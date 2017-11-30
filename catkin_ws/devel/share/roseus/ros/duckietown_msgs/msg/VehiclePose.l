;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::VehiclePose)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'VehiclePose (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::VEHICLEPOSE")
  (make-package "DUCKIETOWN_MSGS::VEHICLEPOSE"))

(in-package "ROS")
;;//! \htmlinclude VehiclePose.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::VehiclePose
  :super ros::object
  :slots (_header _rho _theta _psi _x _y _angle _detection _collision ))

(defmethod duckietown_msgs::VehiclePose
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:rho __rho) 0.0)
    ((:theta __theta) 0.0)
    ((:psi __psi) 0.0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:angle __angle) 0.0)
    ((:detection __detection) nil)
    ((:collision __collision) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _rho (float __rho))
   (setq _theta (float __theta))
   (setq _psi (float __psi))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _angle (float __angle))
   (setq _detection __detection)
   (setq _collision __collision)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:rho
   (&optional __rho)
   (if __rho (setq _rho __rho)) _rho)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:psi
   (&optional __psi)
   (if __psi (setq _psi __psi)) _psi)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:detection
   (&optional __detection)
   (if __detection (setq _detection __detection)) _detection)
  (:collision
   (&optional __collision)
   (if __collision (setq _collision __collision)) _collision)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _rho
    4
    ;; float32 _theta
    4
    ;; float32 _psi
    4
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _angle
    4
    ;; bool _detection
    1
    ;; bool _collision
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _rho
       (sys::poke _rho (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _psi
       (sys::poke _psi (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _detection
       (if _detection (write-byte -1 s) (write-byte 0 s))
     ;; bool _collision
       (if _collision (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _rho
     (setq _rho (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta
     (setq _theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _psi
     (setq _psi (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _detection
     (setq _detection (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _collision
     (setq _collision (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get duckietown_msgs::VehiclePose :md5sum-) "df758920f0dcfc57f9658d6eba2cf23a")
(setf (get duckietown_msgs::VehiclePose :datatype-) "duckietown_msgs/VehiclePose")
(setf (get duckietown_msgs::VehiclePose :definition-)
      "Header header
float32 rho
float32 theta
float32 psi
float32 x
float32 y
float32 angle
bool detection
bool collision
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :duckietown_msgs/VehiclePose "df758920f0dcfc57f9658d6eba2cf23a")


