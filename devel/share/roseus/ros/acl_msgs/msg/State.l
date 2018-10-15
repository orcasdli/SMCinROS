;; Auto-generated. Do not edit!


(when (boundp 'acl_msgs::State)
  (if (not (find-package "ACL_MSGS"))
    (make-package "ACL_MSGS"))
  (shadow 'State (find-package "ACL_MSGS")))
(unless (find-package "ACL_MSGS::STATE")
  (make-package "ACL_MSGS::STATE"))

(in-package "ROS")
;;//! \htmlinclude State.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass acl_msgs::State
  :super ros::object
  :slots (_header _state_stamp _pos _vel _quat _w _abias _gbias ))

(defmethod acl_msgs::State
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:state_stamp __state_stamp) (instance ros::time :init))
    ((:pos __pos) (instance geometry_msgs::Vector3 :init))
    ((:vel __vel) (instance geometry_msgs::Vector3 :init))
    ((:quat __quat) (instance geometry_msgs::Quaternion :init))
    ((:w __w) (instance geometry_msgs::Vector3 :init))
    ((:abias __abias) (instance geometry_msgs::Vector3 :init))
    ((:gbias __gbias) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _state_stamp __state_stamp)
   (setq _pos __pos)
   (setq _vel __vel)
   (setq _quat __quat)
   (setq _w __w)
   (setq _abias __abias)
   (setq _gbias __gbias)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:state_stamp
   (&optional __state_stamp)
   (if __state_stamp (setq _state_stamp __state_stamp)) _state_stamp)
  (:pos
   (&rest __pos)
   (if (keywordp (car __pos))
       (send* _pos __pos)
     (progn
       (if __pos (setq _pos (car __pos)))
       _pos)))
  (:vel
   (&rest __vel)
   (if (keywordp (car __vel))
       (send* _vel __vel)
     (progn
       (if __vel (setq _vel (car __vel)))
       _vel)))
  (:quat
   (&rest __quat)
   (if (keywordp (car __quat))
       (send* _quat __quat)
     (progn
       (if __quat (setq _quat (car __quat)))
       _quat)))
  (:w
   (&rest __w)
   (if (keywordp (car __w))
       (send* _w __w)
     (progn
       (if __w (setq _w (car __w)))
       _w)))
  (:abias
   (&rest __abias)
   (if (keywordp (car __abias))
       (send* _abias __abias)
     (progn
       (if __abias (setq _abias (car __abias)))
       _abias)))
  (:gbias
   (&rest __gbias)
   (if (keywordp (car __gbias))
       (send* _gbias __gbias)
     (progn
       (if __gbias (setq _gbias (car __gbias)))
       _gbias)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; time _state_stamp
    8
    ;; geometry_msgs/Vector3 _pos
    (send _pos :serialization-length)
    ;; geometry_msgs/Vector3 _vel
    (send _vel :serialization-length)
    ;; geometry_msgs/Quaternion _quat
    (send _quat :serialization-length)
    ;; geometry_msgs/Vector3 _w
    (send _w :serialization-length)
    ;; geometry_msgs/Vector3 _abias
    (send _abias :serialization-length)
    ;; geometry_msgs/Vector3 _gbias
    (send _gbias :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; time _state_stamp
       (write-long (send _state_stamp :sec) s) (write-long (send _state_stamp :nsec) s)
     ;; geometry_msgs/Vector3 _pos
       (send _pos :serialize s)
     ;; geometry_msgs/Vector3 _vel
       (send _vel :serialize s)
     ;; geometry_msgs/Quaternion _quat
       (send _quat :serialize s)
     ;; geometry_msgs/Vector3 _w
       (send _w :serialize s)
     ;; geometry_msgs/Vector3 _abias
       (send _abias :serialize s)
     ;; geometry_msgs/Vector3 _gbias
       (send _gbias :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; time _state_stamp
     (send _state_stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _state_stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Vector3 _pos
     (send _pos :deserialize buf ptr-) (incf ptr- (send _pos :serialization-length))
   ;; geometry_msgs/Vector3 _vel
     (send _vel :deserialize buf ptr-) (incf ptr- (send _vel :serialization-length))
   ;; geometry_msgs/Quaternion _quat
     (send _quat :deserialize buf ptr-) (incf ptr- (send _quat :serialization-length))
   ;; geometry_msgs/Vector3 _w
     (send _w :deserialize buf ptr-) (incf ptr- (send _w :serialization-length))
   ;; geometry_msgs/Vector3 _abias
     (send _abias :deserialize buf ptr-) (incf ptr- (send _abias :serialization-length))
   ;; geometry_msgs/Vector3 _gbias
     (send _gbias :deserialize buf ptr-) (incf ptr- (send _gbias :serialization-length))
   ;;
   self)
  )

(setf (get acl_msgs::State :md5sum-) "d541639d4febb63bce9ed67bfaf4f2ba")
(setf (get acl_msgs::State :datatype-) "acl_msgs/State")
(setf (get acl_msgs::State :definition-)
      "Header header
time state_stamp
geometry_msgs/Vector3 pos
geometry_msgs/Vector3 vel
geometry_msgs/Quaternion quat
geometry_msgs/Vector3 w
geometry_msgs/Vector3 abias
geometry_msgs/Vector3 gbias

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



(provide :acl_msgs/State "d541639d4febb63bce9ed67bfaf4f2ba")


