#!/usr/bin/env python
import rospy
from geometry_msgs.msg import PoseStamped, PointStamped, Twist, Point
from std_msgs.msg import Bool
from gazebo_msgs.msg import ModelStates
from gazebo_msgs.srv import GetModelState
from nav_msgs.msg import Path
from visualization_msgs.msg import Marker
import numpy as np
import math
import tf
"""
This program utilizes pure pursuit to follow a given trajectory.
"""

class pub_rviz():
    def __init__(self):
        # Init subscribers and publishers
        self.sub_model_state = rospy.Subscriber("/gazebo/model_states", ModelStates, self.model_stateCB, queue_size=1)
        self.odom_pub = rospy.Publisher("visualization_marker",Marker,queue_size=1)
        self.waypoint_pub = rospy.Publisher("visualization_marker1",Marker,queue_size=1)
        self.robot_pose = None
        self.frame_name = "gazebo"
        self.waypoint_list = [(0, 0),(2,2),(-1,1),(-3,3),(-3,0),(1,-2),(0,0)]
        self.initial_odom()
        self.initial_waypoint()

    def initial_waypoint(self):
        self.waypoint = Marker()
        self.waypoint.header.frame_id = self.frame_name
        self.waypoint.header.stamp = rospy.Time.now()
        self.waypoint.ns = "points_for_waypoint"
        self.waypoint.action = Marker.ADD
        self.waypoint.pose.orientation.w = 1.0
        self.waypoint.id = 0
        self.waypoint.type = Marker.LINE_STRIP
        self.waypoint.scale.x = 0.03
        self.waypoint.scale.y = 0.03
        self.waypoint.color.r = 1.0
        self.waypoint.color.a = 1.0
        for way in self.waypoint_list:
            wp = Point()
            wp.x, wp.y = way[:2]
            wp.z = 0
            self.waypoint.points.append(wp)

    def initial_odom(self):
        self.odom = Marker()
        self.odom.header.frame_id = self.frame_name
        self.odom.header.stamp = rospy.Time.now()
        self.odom.ns = "points_for_odometry"
        self.odom.action = Marker.ADD
        self.odom.pose.orientation.w = 1.0
        self.odom.id = 0
        self.odom.type = Marker.LINE_STRIP
        self.odom.scale.x = 0.03
        self.odom.scale.y = 0.03
        self.odom.color.g = 1.0
        self.odom.color.a = 1.0

    def pub_waypoint(self):
        #self.waypoint.points = self.odom.points
        #print self.waypoint.points
        self.waypoint_pub.publish(self.waypoint)

    def pub_odom(self, pose):
        p = Point()
        p.x, p.y, p.z = pose[:3]
        self.odom.points.append(p)
        self.odom_pub.publish(self.odom)

    def model_stateCB(self, msg):
        self.robot_pose = (msg.pose[1].position.x, msg.pose[1].position.y, msg.pose[1].position.z)
        self.pub_odom(self.robot_pose)
        self.pub_waypoint()

if __name__=="__main__":
    # Tell ROS that we're making a new node.
    rospy.init_node("pub_rviz",anonymous=False)
    pub_rviz = pub_rviz()
    rospy.spin()