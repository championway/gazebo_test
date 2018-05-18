#!/usr/bin/env python
import rospy
from geometry_msgs.msg import PoseStamped, PointStamped, Twist, Point
from robotx_msgs.msg import ObstaclePoseList, WayPoint, WayPointList
import numpy as np
import math
import tf
import sys
import random
from math import sqrt, cos, sin, atan2 ,pow
#from message_filters import ApproximateTimeSynchronizer, TimeSynchronizer, Subscriber
import message_filters
# constants
XDIM = 640
YDIM = 480
WINSIZE = [XDIM, YDIM]  #for map size
EPSILON = 0.08           #each RRT route's distance
Theta = 0               #start and destination 's Theta
start = None         #start
des = [5,1]           #destination
dis = 0
a = 0                   #oval's a
b = 0                   #oval's b
Range = 0.25               #car size ( range*range )
route = []              #route for RRT ( for  application )
obstacle = []           #obstacle [ x ,y ,range]
obstacle_num = 5
accuracy = 1            # for arrive Accuracy

#rotate matrix
def rotate(point,theta):
    return [point[0] * cos(theta) + point[1] * sin(theta) , -1 * point[0] * sin(theta) + point[1] * cos(theta)]

#Weights  ( need modify )
def random_weights():
    print start
    center = (start[0]+des[0]) / 2 , (start[1]+des[1]) / 2
    center_r = rotate(center,Theta)
    while True:
        rand = [random.random() * 640.0, random.random() * 480.0]
        rand_r = rotate(rand,Theta)
        if (pow(rand_r[0] - center_r[0],2) / pow(a,2) + pow(rand_r[1] - center_r[1] , 2) / pow(b , 2)) <= 1:
            # print pow(rand_r[0] - center_r[0], 2) / pow(a, 2) + pow(rand_r[1] - center_r[1], 2) / pow(b, 2)
            # print rand_r
            # print rand
            break
    return  rand

def dist(p1, p2):
    return sqrt((p1[0] - p2[0]) * (p1[0] - p2[0]) + (p1[1] - p2[1]) * (p1[1] - p2[1]))

def step_from_to(p1, p2):
    if dist(p1, p2) < EPSILON:
        return p2
    else:
        theta = atan2(p2[1] - p1[1], p2[0] - p1[0])
        return [p1[0] + EPSILON * cos(theta), p1[1] + EPSILON * sin(theta)]

#need modify by ros subscriber , we temporarily assign randomly
def obstacle_add(msg):
    for i in range(msg.size):
        obs = [msg.list[i].x, msg.list[i].y, 0.7]
        obstacle.append(obs)

#confirm  whether avoid obstacle or not
def judgment(origin , point):
    for i in obstacle:
        if dist(point,i) < (EPSILON + Range + i[2]):           #this can reduce time in calculation
            theta_1 = Theta_get(origin,point)
            temp =[0,0,0]
            temp[0] = origin[0]
            temp[1] = origin[1]
            temp[2] = origin[2]

            #print "May Collision"

            for j in range(int(EPSILON)):
                temp[0] +=  cos(theta_1)
                temp[1] +=  sin(theta_1)
                if dist(i,temp) <  (Range + i[2]) :
                    print "Collision"
                    return False
            #print "Succeed in avoidance "
    return True

def Theta_get(p1,p2):
    return  atan2(p2[1] - p1[1], p2[0] - p1[0])

def pose_cb(msg):
    global start
    start = [1, 1]
    #start = [msg.pose.position.x, msg.pose.position.y]
    print start

def call_back(obs_msg, pos_msg):
    '''print "okok"
    waypointlist = WayPointList()
    waypoint = WayPoint()
    waypoint.x = 1
    waypoint.y = 0
    waypointlist.list.append(waypoint)
    waypoint = WayPoint()
    waypoint.x = 2
    waypoint.y = 1
    waypointlist.list.append(waypoint)
    pub_waypoint.publish(waypointlist)'''
    print "hhh"
    global start
    start = [pos_msg.pose.position.x, pos_msg.pose.position.y]
    # initialize and prepare screen

    global a, b ,Theta,dis
    obstacle_add(obs_msg)
    #print "obstacle =  ",obstacle
    print "start = ", start
    Theta = Theta_get(start, des)
    dis = dist(start , des)
    a = dis/2 * 1.3                     #need modify if needed
    b = dis/2 * 0.8                     #need modify if needed
    #print dis ,a ,b

    nodes = []
    start.append(0)
    nodes.append(start)
    while True:
        print "fuck for while"
        ran_point = random_weights()
        nn = nodes[0]
        num = 0
        temp = num
        for p in nodes:
            if dist(p, ran_point) < dist(nn, ran_point):
                nn = p
                temp = num
            num += 1
        newnode = step_from_to(nn, ran_point)
        newnode.append(temp)
        if judgment(nodes[temp],newnode) :
            nodes.append(newnode)
            if(dist(newnode,des) < Range/accuracy):
                break
    while nodes[num] != start:
        route.append(nodes[num])
        num = nodes[num][2]
    route.append(nodes[num])
    route.reverse()
    waypoint = WayPoint()
    waypointlist = WayPointList()
    print "------------------------Start--------------------------"
    for i in route:
        print "x = " , i[0] , ", y = " , i[1]
        waypoint = WayPoint()
        waypoint.x = i[0]
        waypoint.y = i[1]
        waypointlist.list.append(waypoint)
    print "-----------------------Arrive--------------------------"
    pub_waypoint.publish(waypointlist)
    start = None
    nodes = []


# if python says run, then we should run
if __name__ == '__main__':
    rospy.init_node('rrt', anonymous=False)
    pub_waypoint = rospy.Publisher('/waypoint_list', WayPointList, queue_size=1)
    obs_sub = message_filters.Subscriber("/obstacle_list", ObstaclePoseList)
    pos_sub = message_filters.Subscriber("/pose", PoseStamped)
    
    ats = message_filters.ApproximateTimeSynchronizer([obs_sub, pos_sub],queue_size = 1, slop = 1)
    ats.registerCallback(call_back)
    print "fuck"
    rospy.spin()