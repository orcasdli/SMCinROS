;; Auto-generated. Do not edit!


(when (boundp 'acl_msgs::QuadAttCmd)
  (if (not (find-package "ACL_MSGS"))
    (make-package "ACL_MSGS"))
  (shadow 'QuadAttCmd (find-package "ACL_MSGS")))
(unless (find-package "ACL_MSGS::QUADATTCMD")
  (make-package "ACL_MSGS::QUADATTCMD"))

(in-package "ROS")
;;//! \htmlinclude QuadAttCmd.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass acl_msgs::QuadAttCmd
  :super ros::object
  :slots (_header _att _rate _throttle _att_status ))

(defmethod acl_msgs::QuadAttCmd
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:att __att) (instance geometry_msgs::Quaternion :init))
    ((:rate __rate) (instance geometry_msgs::Vector3 :init))
    ((:throttle __throttle) 0.0)
    ((:att_status __att_status) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _att __att)
   (setq _rate __rate)
   (setq _throttle (float __throttle))
   (setq _att_status (round __att_status))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:att
   (&rest __att)
   (if (keywordp (car __att))
       (send* _att __att)
     (progn
       (if __att (setq _att (car __att)))
       _att)))
  (:rate
   (&rest __rate)
   (if (keywordp (car __rate))
       (send* _rate __rate)
     (progn
       (if __rate (setq _rate (car __rate)))
       _rate)))
  (:throttle
   (&optional __throttle)
   (if __throttle (setq _throttle __throttle)) _throttle)
  (:att_status
   (&optional __att_status)
   (if __att_status (setq _att_status __att_status)) _att_status)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Quaternion _att
    (send _att :serialization-length)
    ;; geometry_msgs/Vector3 _rate
    (send _rate :serialization-length)
    ;; float64 _throttle
    8
    ;; int16 _att_status
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Quaternion _att
       (send _att :serialize s)
     ;; geometry_msgs/Vector3 _rate
       (send _rate :serialize s)
     ;; float64 _throttle
       (sys::poke _throttle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int16 _att_status
       (write-word _att_status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Quaternion _att
     (send _att :deserialize buf ptr-) (incf ptr- (send _att :serialization-length))
   ;; geometry_msgs/Vector3 _rate
     (send _rate :deserialize buf ptr-) (incf ptr- (send _rate :serialization-length))
   ;; float64 _throttle
     (setq _throttle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int16 _att_status
     (setq _att_status (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get acl_msgs::QuadAttCmd :md5sum-) "5849d441faf7e1cf53891f700914d00f")
(setf (get acl_msgs::QuadAttCmd :datatype-) "acl_msgs/QuadAttCmd")
(setf (get acl_msgs::QuadAttCmd :definition-)
      "Header header
geometry_msgs/Quaternion att
geometry_msgs/Vector3 rate
float64 throttle
int16 att_status


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
")



(provide :acl_msgs/QuadAttCmd "5849d441faf7e1cf53891f700914d00f")


