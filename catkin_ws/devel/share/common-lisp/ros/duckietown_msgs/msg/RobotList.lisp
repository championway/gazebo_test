; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude RobotList.msg.html

(cl:defclass <RobotList> (roslisp-msg-protocol:ros-message)
  ((robot
    :reader robot
    :initarg :robot
    :type cl:integer
    :initform 0))
)

(cl:defclass RobotList (<RobotList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<RobotList> is deprecated: use duckietown_msgs-msg:RobotList instead.")))

(cl:ensure-generic-function 'robot-val :lambda-list '(m))
(cl:defmethod robot-val ((m <RobotList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:robot-val is deprecated.  Use duckietown_msgs-msg:robot instead.")
  (robot m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotList>) ostream)
  "Serializes a message object of type '<RobotList>"
  (cl:let* ((signed (cl:slot-value msg 'robot)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotList>) istream)
  "Deserializes a message object of type '<RobotList>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotList>)))
  "Returns string type for a message object of type '<RobotList>"
  "duckietown_msgs/RobotList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotList)))
  "Returns string type for a message object of type 'RobotList"
  "duckietown_msgs/RobotList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotList>)))
  "Returns md5sum for a message object of type '<RobotList>"
  "19238a8d0c7746376713b235eefb7a53")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotList)))
  "Returns md5sum for a message object of type 'RobotList"
  "19238a8d0c7746376713b235eefb7a53")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotList>)))
  "Returns full string definition for message of type '<RobotList>"
  (cl:format cl:nil "int32 robot~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotList)))
  "Returns full string definition for message of type 'RobotList"
  (cl:format cl:nil "int32 robot~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotList>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotList>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotList
    (cl:cons ':robot (robot msg))
))
