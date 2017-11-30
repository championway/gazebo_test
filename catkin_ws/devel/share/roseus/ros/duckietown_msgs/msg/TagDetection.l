;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::TagDetection)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'TagDetection (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::TAGDETECTION")
  (make-package "DUCKIETOWN_MSGS::TAGDETECTION"))

(in-package "ROS")
;;//! \htmlinclude TagDetection.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass duckietown_msgs::TagDetection
  :super ros::object
  :slots (_good _id _p _cxy _observedPerimeter _homography _orientation _hxy _transform ))

(defmethod duckietown_msgs::TagDetection
  (:init
   (&key
    ((:good __good) nil)
    ((:id __id) 0)
    ((:p __p) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:cxy __cxy) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:observedPerimeter __observedPerimeter) 0.0)
    ((:homography __homography) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:orientation __orientation) 0.0)
    ((:hxy __hxy) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:transform __transform) (instance geometry_msgs::Transform :init))
    )
   (send-super :init)
   (setq _good __good)
   (setq _id (round __id))
   (setq _p __p)
   (setq _cxy __cxy)
   (setq _observedPerimeter (float __observedPerimeter))
   (setq _homography __homography)
   (setq _orientation (float __orientation))
   (setq _hxy __hxy)
   (setq _transform __transform)
   self)
  (:good
   (&optional __good)
   (if __good (setq _good __good)) _good)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:p
   (&optional __p)
   (if __p (setq _p __p)) _p)
  (:cxy
   (&optional __cxy)
   (if __cxy (setq _cxy __cxy)) _cxy)
  (:observedPerimeter
   (&optional __observedPerimeter)
   (if __observedPerimeter (setq _observedPerimeter __observedPerimeter)) _observedPerimeter)
  (:homography
   (&optional __homography)
   (if __homography (setq _homography __homography)) _homography)
  (:orientation
   (&optional __orientation)
   (if __orientation (setq _orientation __orientation)) _orientation)
  (:hxy
   (&optional __hxy)
   (if __hxy (setq _hxy __hxy)) _hxy)
  (:transform
   (&rest __transform)
   (if (keywordp (car __transform))
       (send* _transform __transform)
     (progn
       (if __transform (setq _transform (car __transform)))
       _transform)))
  (:serialization-length
   ()
   (+
    ;; bool _good
    1
    ;; int32 _id
    4
    ;; float32[] _p
    (* 4    (length _p)) 4
    ;; float32[] _cxy
    (* 4    (length _cxy)) 4
    ;; float32 _observedPerimeter
    4
    ;; float32[] _homography
    (* 4    (length _homography)) 4
    ;; float32 _orientation
    4
    ;; float32[] _hxy
    (* 4    (length _hxy)) 4
    ;; geometry_msgs/Transform _transform
    (send _transform :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _good
       (if _good (write-byte -1 s) (write-byte 0 s))
     ;; int32 _id
       (write-long _id s)
     ;; float32[] _p
     (write-long (length _p) s)
     (dotimes (i (length _p))
       (sys::poke (elt _p i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _cxy
     (write-long (length _cxy) s)
     (dotimes (i (length _cxy))
       (sys::poke (elt _cxy i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _observedPerimeter
       (sys::poke _observedPerimeter (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[] _homography
     (write-long (length _homography) s)
     (dotimes (i (length _homography))
       (sys::poke (elt _homography i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _orientation
       (sys::poke _orientation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[] _hxy
     (write-long (length _hxy) s)
     (dotimes (i (length _hxy))
       (sys::poke (elt _hxy i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; geometry_msgs/Transform _transform
       (send _transform :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _good
     (setq _good (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32[] _p
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _p (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _p i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _cxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _cxy (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _cxy i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _observedPerimeter
     (setq _observedPerimeter (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[] _homography
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _homography (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _homography i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _orientation
     (setq _orientation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[] _hxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _hxy (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _hxy i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; geometry_msgs/Transform _transform
     (send _transform :deserialize buf ptr-) (incf ptr- (send _transform :serialization-length))
   ;;
   self)
  )

(setf (get duckietown_msgs::TagDetection :md5sum-) "4b7d45baa0b18dbb969cc3d0e5133e7f")
(setf (get duckietown_msgs::TagDetection :datatype-) "duckietown_msgs/TagDetection")
(setf (get duckietown_msgs::TagDetection :definition-)
      "#Mirrors TagDetection.h in the apriltags pkg
bool good
int32 id
float32[] p
float32[] cxy
float32 observedPerimeter
float32[] homography
float32 orientation
float32[] hxy
geometry_msgs/Transform transform

================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :duckietown_msgs/TagDetection "4b7d45baa0b18dbb969cc3d0e5133e7f")


