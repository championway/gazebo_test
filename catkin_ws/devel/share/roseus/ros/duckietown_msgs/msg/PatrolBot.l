;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::PatrolBot)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'PatrolBot (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::PATROLBOT")
  (make-package "DUCKIETOWN_MSGS::PATROLBOT"))

(in-package "ROS")
;;//! \htmlinclude PatrolBot.msg.html


(defclass duckietown_msgs::PatrolBot
  :super ros::object
  :slots (_name _direction _id ))

(defmethod duckietown_msgs::PatrolBot
  (:init
   (&key
    ((:name __name) "")
    ((:direction __direction) "")
    ((:id __id) 0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _direction (string __direction))
   (setq _id (round __id))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; string _direction
    4 (length _direction)
    ;; int32 _id
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _direction
       (write-long (length _direction) s) (princ _direction s)
     ;; int32 _id
       (write-long _id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _direction
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _direction (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::PatrolBot :md5sum-) "515b9ef8adc1a831f89a147203c7da57")
(setf (get duckietown_msgs::PatrolBot :datatype-) "duckietown_msgs/PatrolBot")
(setf (get duckietown_msgs::PatrolBot :definition-)
      "string name
string direction
int32 id
")



(provide :duckietown_msgs/PatrolBot "515b9ef8adc1a831f89a147203c7da57")


