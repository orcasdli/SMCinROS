;; Auto-generated. Do not edit!


(when (boundp 'acl_msgs::ViconState)
  (if (not (find-package "ACL_MSGS"))
    (make-package "ACL_MSGS"))
  (shadow 'ViconState (find-package "ACL_MSGS")))
(unless (find-package "ACL_MSGS::VICONSTATE")
  (make-package "ACL_MSGS::VICONSTATE"))

(in-package "ROS")
;;//! \htmlinclude ViconState.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass acl_msgs::ViconState
  :super ros::object
  :slots (_header _pose _Eulers _twist _pos_accel _Eulers_accel _has_pose _has_twist _has_accel ))

(defmethod acl_msgs::ViconState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:Eulers __Eulers) (instance geometry_msgs::Vector3 :init))
    ((:twist __twist) (instance geometry_msgs::Twist :init))
    ((:pos_accel __pos_accel) (instance geometry_msgs::Vector3 :init))
    ((:Eulers_accel __Eulers_accel) (instance geometry_msgs::Vector3 :init))
    ((:has_pose __has_pose) nil)
    ((:has_twist __has_twist) nil)
    ((:has_accel __has_accel) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _pose __pose)
   (setq _Eulers __Eulers)
   (setq _twist __twist)
   (setq _pos_accel __pos_accel)
   (setq _Eulers_accel __Eulers_accel)
   (setq _has_pose __has_pose)
   (setq _has_twist __has_twist)
   (setq _has_accel __has_accel)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:Eulers
   (&rest __Eulers)
   (if (keywordp (car __Eulers))
       (send* _Eulers __Eulers)
     (progn
       (if __Eulers (setq _Eulers (car __Eulers)))
       _Eulers)))
  (:twist
   (&rest __twist)
   (if (keywordp (car __twist))
       (send* _twist __twist)
     (progn
       (if __twist (setq _twist (car __twist)))
       _twist)))
  (:pos_accel
   (&rest __pos_accel)
   (if (keywordp (car __pos_accel))
       (send* _pos_accel __pos_accel)
     (progn
       (if __pos_accel (setq _pos_accel (car __pos_accel)))
       _pos_accel)))
  (:Eulers_accel
   (&rest __Eulers_accel)
   (if (keywordp (car __Eulers_accel))
       (send* _Eulers_accel __Eulers_accel)
     (progn
       (if __Eulers_accel (setq _Eulers_accel (car __Eulers_accel)))
       _Eulers_accel)))
  (:has_pose
   (&optional __has_pose)
   (if __has_pose (setq _has_pose __has_pose)) _has_pose)
  (:has_twist
   (&optional __has_twist)
   (if __has_twist (setq _has_twist __has_twist)) _has_twist)
  (:has_accel
   (&optional __has_accel)
   (if __has_accel (setq _has_accel __has_accel)) _has_accel)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; geometry_msgs/Vector3 _Eulers
    (send _Eulers :serialization-length)
    ;; geometry_msgs/Twist _twist
    (send _twist :serialization-length)
    ;; geometry_msgs/Vector3 _pos_accel
    (send _pos_accel :serialization-length)
    ;; geometry_msgs/Vector3 _Eulers_accel
    (send _Eulers_accel :serialization-length)
    ;; bool _has_pose
    1
    ;; bool _has_twist
    1
    ;; bool _has_accel
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; geometry_msgs/Vector3 _Eulers
       (send _Eulers :serialize s)
     ;; geometry_msgs/Twist _twist
       (send _twist :serialize s)
     ;; geometry_msgs/Vector3 _pos_accel
       (send _pos_accel :serialize s)
     ;; geometry_msgs/Vector3 _Eulers_accel
       (send _Eulers_accel :serialize s)
     ;; bool _has_pose
       (if _has_pose (write-byte -1 s) (write-byte 0 s))
     ;; bool _has_twist
       (if _has_twist (write-byte -1 s) (write-byte 0 s))
     ;; bool _has_accel
       (if _has_accel (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; geometry_msgs/Vector3 _Eulers
     (send _Eulers :deserialize buf ptr-) (incf ptr- (send _Eulers :serialization-length))
   ;; geometry_msgs/Twist _twist
     (send _twist :deserialize buf ptr-) (incf ptr- (send _twist :serialization-length))
   ;; geometry_msgs/Vector3 _pos_accel
     (send _pos_accel :deserialize buf ptr-) (incf ptr- (send _pos_accel :serialization-length))
   ;; geometry_msgs/Vector3 _Eulers_accel
     (send _Eulers_accel :deserialize buf ptr-) (incf ptr- (send _Eulers_accel :serialization-length))
   ;; bool _has_pose
     (setq _has_pose (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _has_twist
     (setq _has_twist (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _has_accel
     (setq _has_accel (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get acl_msgs::ViconState :md5sum-) "b7e43266dac9a0f8e73e309a192f76b9")
(setf (get acl_msgs::ViconState :datatype-) "acl_msgs/ViconState")
(setf (get acl_msgs::ViconState :definition-)
      "Header header
geometry_msgs/Pose pose
geometry_msgs/Vector3 Eulers
geometry_msgs/Twist twist
geometry_msgs/Vector3 pos_accel
geometry_msgs/Vector3 Eulers_accel
bool has_pose
bool has_twist
bool has_accel
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

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
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
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

")



(provide :acl_msgs/ViconState "b7e43266dac9a0f8e73e309a192f76b9")


