#!/usr/bin/env python

## @package docstring
#  This is the typical ROS template node for python.
#

import rospy
import sys
import signal
import time
import numpy
from numpy import array
import tf
import math
from gazebo_msgs.srv import GetModelState
from gazebo_msgs.srv import SetModelState
from gazebo_msgs.msg import ModelState
from sensor_msgs.msg import Joy

#--------------------------------- Constants ----------------------------------#

TAG       = "Boat control 01:"              ## Node verbosity tag
node_name = "boat_control_01"               ## ROS node name

#------------------------------------------------------------------------------#
## Application class
#
class Application:
    ## Input topics
    input_topic = "/input_topic"

    ## Output topics
    output_topic = "/output_topic"

    ## Init function
    #  @param self The object pointer.
    def __init__(self):
        time.sleep(5)
        # Initial parameters
        self.boat_control_velocity = 0.0
        self.boat_control_omega    = 0.0
        # Assigning the SIGINT handler
        signal.signal(signal.SIGINT, self.sigint_handler)

        # Starting the node
        rospy.init_node(node_name, anonymous=False)

        # Services
        self.gazebo_get_model_state = rospy.ServiceProxy("/gazebo/get_model_state", GetModelState, persistent=True)
        self.gazebo_set_model_state = rospy.ServiceProxy("/gazebo/set_model_state", SetModelState, persistent=True)

        # Subscribers
        rospy.Subscriber("/aries/joy", Joy, self.joy_callback)

        self.boat_speed = 0.1
        self.boat_mass  = 0.8 # Can be obtained from parameters (when lot of free time available)
        # Bad approach, simulating almost everything here instead of gazebo
        # in future, ditch "freefloating gazebo" and switch to complete "force-based" simulations.
        self.boat_velocity = 0.0
        self.boat_omega    = 0.0

        self.frontal_force       = [0.0, 0.0, 0.0]
        self.frontal_resistance  = [500.0, 0.0, 0.0]
        self.backward_resistance = [3500.0, 0.0, 0.0]
        self.frontal_resforce    = [0.0, 0.0, 0.0]    # = frontal_resistance*(V^2)
                                                      # or backward resistance*(V^2)
        self.side_torque         = [0.0, 0.0, 0.0]    #Roll Pitch Yaw
        self.side_resistance     = [0.0, 0.0, 2.0]
        self.side_resforce       = [0.0, 0.0, 0.0]    # Same principle

        old_time = rospy.get_time()
        refresh_rate = rospy.Rate(30)
        cycle_cnt = 0
        old_pos = (0,0,0)
        new_pos = (0,0,0)
        old_yaw = 0.0
        new_yaw = 0.0
        boat_speed = 0.0

        self.boat_vel   = [0.0, 0.0, 0.0]
        self.boat_accel = [0.0, 0.0, 0.0]
        self.boat_w     = [0.0, 0.0, 0.0]
        self.boat_wacc  = [0.0, 0.0, 0.0]
        while True:
            new_time = rospy.get_time()
            time_passed = new_time - old_time

            if cycle_cnt > 2:
                resp = self.gazebo_get_model_state("aries","")

                ms = ModelState()
                ms.model_name      = "aries"
                ms.reference_frame = ""
                ms.pose  = resp.pose
                ms.twist = resp.twist

                new_pos = (ms.pose.position.x, ms.pose.position.y, ms.pose.position.z)
                dx = new_pos[0]-old_pos[0]
                dy = new_pos[1]-old_pos[1]
                dz = new_pos[2]-old_pos[2]
                boat_speed = math.sqrt(dx*dx+dy*dy+dz*dz)
                print "Boat speed: %0.3f" % (boat_speed)

                Q = (ms.pose.orientation.x, ms.pose.orientation.y, ms.pose.orientation.z ,ms.pose.orientation.w)
                euler = tf.transformations.euler_from_quaternion(Q)
                roll  = euler[0]
                pitch = euler[1]
                yaw   = euler[2]
                print "Yaw: %0.3f" % (yaw)
                print "Omega: %0.3f" % (self.boat_w[2])
                #Torque computation
                if (self.boat_w[2]>=0):
                    self.side_torque[2] = self.boat_control_omega*4.0
                    print "ST : %0.3f" % (self.side_torque[2])
                    self.side_resforce[2] = self.boat_w[2]*self.boat_w[2]*self.side_resistance[2]
                    print "SRF: %0.3f" % (self.side_resforce[2])
                    self.side_torque[2] = self.side_torque[2]-self.side_resforce[2]
                    print "STF: %0.3f" % (self.side_torque[2])
                else:
                    self.side_torque[2] = self.boat_control_omega*4.0
                    print "ST : %0.3f" % (self.side_torque[2])
                    self.side_resforce[2] = self.boat_w[2]*self.boat_w[2]*self.side_resistance[2]
                    print "SRF: %0.3f" % (self.side_resforce[2])
                    self.side_torque[2] = self.side_torque[2]+self.side_resforce[2]
                    print "STF: %0.3f" % (self.side_torque[2])

                self.boat_wacc[2] = (self.side_torque[2]/self.boat_mass)
                self.boat_w[2] = self.boat_w[2] + (self.boat_wacc[2]*time_passed)

                yaw = yaw + (self.boat_w[2]*time_passed)
                #yaw = yaw + (self.boat_control_omega*time_passed)

                Q = tf.transformations.quaternion_from_euler(roll, pitch, yaw)
                ms.pose.orientation.x = Q[0]
                ms.pose.orientation.y = Q[1]
                ms.pose.orientation.z = Q[2]
                ms.pose.orientation.w = Q[3]

                Qdir = (ms.pose.orientation.x, ms.pose.orientation.y, ms.pose.orientation.z ,ms.pose.orientation.w)
                Vunit = (1, 0, 0)
                Vdir = self.qv_mult(Qdir,Vunit)
                Vdir = tf.transformations.unit_vector(Vdir)

                #Force computation
                if (self.boat_vel[0]>=0):
                    self.frontal_force[0] = self.boat_control_velocity*0.8
                    print "FF : %0.3f" % (self.frontal_force[0])
                    self.frontal_resforce[0] = boat_speed*boat_speed*self.frontal_resistance[0]
                    print "FRF: %0.3f" % (self.frontal_resforce[0])
                    self.frontal_force[0] = self.frontal_force[0]-self.frontal_resforce[0]
                    print "FFF: %0.3f" % (self.frontal_force[0])
                else:
                    self.frontal_force[0] = self.boat_control_velocity*0.8
                    print "FF : %0.3f" % (self.frontal_force[0])
                    self.frontal_resforce[0] = boat_speed*boat_speed*self.backward_resistance[0]
                    print "FRF: %0.3f" % (self.frontal_resforce[0])
                    self.frontal_force[0] = self.frontal_force[0]+self.frontal_resforce[0]
                    print "FFF: %0.3f" % (self.frontal_force[0])

                self.boat_accel[0] = (self.frontal_force[0]/self.boat_mass)
                self.boat_vel[0] = self.boat_vel[0] + self.boat_accel[0]*time_passed

                ms.pose.position.x = ms.pose.position.x + (self.boat_vel[0]*Vdir[0]*time_passed)
                ms.pose.position.y = ms.pose.position.y + (self.boat_vel[0]*Vdir[1]*time_passed)
                ms.pose.position.z = ms.pose.position.z + (self.boat_vel[0]*Vdir[2]*time_passed)

                resp = self.gazebo_set_model_state(ms)

            cycle_cnt = cycle_cnt + 1
            old_pos = new_pos
            old_time = new_time
            refresh_rate.sleep()

    def qv_mult(self, q1, v1):
        v1 = tf.transformations.unit_vector(v1)
        q2 = list(v1)
        q2.append(0.0)
        return tf.transformations.quaternion_multiply(
            tf.transformations.quaternion_multiply(q1, q2),
            tf.transformations.quaternion_conjugate(q1)
        )[:3]

    def joy_callback(self, data):
        self.boat_control_velocity = data.axes[1]
        self.boat_control_omega    = data.axes[3]


    ## SIGINT Signal handler
    #  @param self The object pointer.
    #  @param signal The signal itself.
    #  @param frame The timeframe signal occured.
    def sigint_handler(self, signal, frame):
            print ""
            print TAG,"Interrupt!"
            print TAG,"Terminated"
            sys.exit(0)

#------------------------------------- Main -------------------------------------#

if __name__ == '__main__':
    print TAG,"Started"

    app = Application()

    print TAG,"Terminated"
