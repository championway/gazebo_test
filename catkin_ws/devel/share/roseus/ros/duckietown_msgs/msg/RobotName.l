;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::RobotName)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'RobotName (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::ROBOTNAME")
  (make-package "DUCKIETOWN_MSGS::ROBOTNAME"))

(in-package "ROS")
;;//! \htmlinclude RobotName.msg.html


(defclass duckietown_msgs::RobotName
  :super ros::object
  :slots (_robot_name _send ))

(defmethod duckietown_msgs::RobotName
  (:init
   (&key
    ((:robot_name __robot_name) "")
    ((:send __send) nil)
    )
   (send-super :init)
   (setq _robot_name (string __robot_name))
   (setq _send __send)
   self)
  (:robot_name
   (&optional __robot_name)
   (if __robot_name (setq _robot_name __robot_name)) _robot_name)
  (:send
   (&optional __send)
   (if __send (setq _send __send)) _send)
  (:serialization-length
   ()
   (+
    ;; string _robot_name
    4 (length _robot_name)
    ;; bool _send
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _robot_name
       (write-long (length _robot_name) s) (princ _robot_name s)
     ;; bool _send
       (if _send (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _robot_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _send
     (setq _send (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get duckietown_msgs::RobotName :md5sum-) "78807f811fa3e05d59138ca9cc794ba9")
(setf (get duckietown_msgs::RobotName :datatype-) "duckietown_msgs/RobotName")
(setf (get duckietown_msgs::RobotName :definition-)
      "string robot_name
bool send
")



(provide :duckietown_msgs/RobotName "78807f811fa3e05d59138ca9cc794ba9")


