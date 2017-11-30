;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::RobotList)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'RobotList (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::ROBOTLIST")
  (make-package "DUCKIETOWN_MSGS::ROBOTLIST"))

(in-package "ROS")
;;//! \htmlinclude RobotList.msg.html


(defclass duckietown_msgs::RobotList
  :super ros::object
  :slots (_robot ))

(defmethod duckietown_msgs::RobotList
  (:init
   (&key
    ((:robot __robot) 0)
    )
   (send-super :init)
   (setq _robot (round __robot))
   self)
  (:robot
   (&optional __robot)
   (if __robot (setq _robot __robot)) _robot)
  (:serialization-length
   ()
   (+
    ;; int32 _robot
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _robot
       (write-long _robot s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _robot
     (setq _robot (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::RobotList :md5sum-) "19238a8d0c7746376713b235eefb7a53")
(setf (get duckietown_msgs::RobotList :datatype-) "duckietown_msgs/RobotList")
(setf (get duckietown_msgs::RobotList :definition-)
      "int32 robot

")



(provide :duckietown_msgs/RobotList "19238a8d0c7746376713b235eefb7a53")


