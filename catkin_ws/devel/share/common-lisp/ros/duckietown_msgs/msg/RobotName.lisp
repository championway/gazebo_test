; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude RobotName.msg.html

(cl:defclass <RobotName> (roslisp-msg-protocol:ros-message)
  ((robot_name
    :reader robot_name
    :initarg :robot_name
    :type cl:string
    :initform "")
   (send
    :reader send
    :initarg :send
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RobotName (<RobotName>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotName>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotName)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<RobotName> is deprecated: use duckietown_msgs-msg:RobotName instead.")))

(cl:ensure-generic-function 'robot_name-val :lambda-list '(m))
(cl:defmethod robot_name-val ((m <RobotName>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:robot_name-val is deprecated.  Use duckietown_msgs-msg:robot_name instead.")
  (robot_name m))

(cl:ensure-generic-function 'send-val :lambda-list '(m))
(cl:defmethod send-val ((m <RobotName>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:send-val is deprecated.  Use duckietown_msgs-msg:send instead.")
  (send m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotName>) ostream)
  "Serializes a message object of type '<RobotName>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot_name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'send) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotName>) istream)
  "Deserializes a message object of type '<RobotName>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robot_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'send) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotName>)))
  "Returns string type for a message object of type '<RobotName>"
  "duckietown_msgs/RobotName")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotName)))
  "Returns string type for a message object of type 'RobotName"
  "duckietown_msgs/RobotName")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotName>)))
  "Returns md5sum for a message object of type '<RobotName>"
  "78807f811fa3e05d59138ca9cc794ba9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotName)))
  "Returns md5sum for a message object of type 'RobotName"
  "78807f811fa3e05d59138ca9cc794ba9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotName>)))
  "Returns full string definition for message of type '<RobotName>"
  (cl:format cl:nil "string robot_name~%bool send~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotName)))
  "Returns full string definition for message of type 'RobotName"
  (cl:format cl:nil "string robot_name~%bool send~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotName>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'robot_name))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotName>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotName
    (cl:cons ':robot_name (robot_name msg))
    (cl:cons ':send (send msg))
))
