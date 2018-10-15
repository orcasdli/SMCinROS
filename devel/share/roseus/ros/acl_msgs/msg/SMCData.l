;; Auto-generated. Do not edit!


(when (boundp 'acl_msgs::SMCData)
  (if (not (find-package "ACL_MSGS"))
    (make-package "ACL_MSGS"))
  (shadow 'SMCData (find-package "ACL_MSGS")))
(unless (find-package "ACL_MSGS::SMCDATA")
  (make-package "ACL_MSGS::SMCDATA"))

(in-package "ROS")
;;//! \htmlinclude SMCData.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass acl_msgs::SMCData
  :super ros::object
  :slots (_header _q_des _q_act _q_err _w_des _w_act _w_err _s ))

(defmethod acl_msgs::SMCData
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:q_des __q_des) (instance geometry_msgs::Quaternion :init))
    ((:q_act __q_act) (instance geometry_msgs::Quaternion :init))
    ((:q_err __q_err) (instance geometry_msgs::Quaternion :init))
    ((:w_des __w_des) (instance geometry_msgs::Vector3 :init))
    ((:w_act __w_act) (instance geometry_msgs::Vector3 :init))
    ((:w_err __w_err) (instance geometry_msgs::Vector3 :init))
    ((:s __s) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _q_des __q_des)
   (setq _q_act __q_act)
   (setq _q_err __q_err)
   (setq _w_des __w_des)
   (setq _w_act __w_act)
   (setq _w_err __w_err)
   (setq _s __s)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:q_des
   (&rest __q_des)
   (if (keywordp (car __q_des))
       (send* _q_des __q_des)
     (progn
       (if __q_des (setq _q_des (car __q_des)))
       _q_des)))
  (:q_act
   (&rest __q_act)
   (if (keywordp (car __q_act))
       (send* _q_act __q_act)
     (progn
       (if __q_act (setq _q_act (car __q_act)))
       _q_act)))
  (:q_err
   (&rest __q_err)
   (if (keywordp (car __q_err))
       (send* _q_err __q_err)
     (progn
       (if __q_err (setq _q_err (car __q_err)))
       _q_err)))
  (:w_des
   (&rest __w_des)
   (if (keywordp (car __w_des))
       (send* _w_des __w_des)
     (progn
       (if __w_des (setq _w_des (car __w_des)))
       _w_des)))
  (:w_act
   (&rest __w_act)
   (if (keywordp (car __w_act))
       (send* _w_act __w_act)
     (progn
       (if __w_act (setq _w_act (car __w_act)))
       _w_act)))
  (:w_err
   (&rest __w_err)
   (if (keywordp (car __w_err))
       (send* _w_err __w_err)
     (progn
       (if __w_err (setq _w_err (car __w_err)))
       _w_err)))
  (:s
   (&rest __s)
   (if (keywordp (car __s))
       (send* _s __s)
     (progn
       (if __s (setq _s (car __s)))
       _s)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Quaternion _q_des
    (send _q_des :serialization-length)
    ;; geometry_msgs/Quaternion _q_act
    (send _q_act :serialization-length)
    ;; geometry_msgs/Quaternion _q_err
    (send _q_err :serialization-length)
    ;; geometry_msgs/Vector3 _w_des
    (send _w_des :serialization-length)
    ;; geometry_msgs/Vector3 _w_act
    (send _w_act :serialization-length)
    ;; geometry_msgs/Vector3 _w_err
    (send _w_err :serialization-length)
    ;; geometry_msgs/Vector3 _s
    (send _s :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Quaternion _q_des
       (send _q_des :serialize s)
     ;; geometry_msgs/Quaternion _q_act
       (send _q_act :serialize s)
     ;; geometry_msgs/Quaternion _q_err
       (send _q_err :serialize s)
     ;; geometry_msgs/Vector3 _w_des
       (send _w_des :serialize s)
     ;; geometry_msgs/Vector3 _w_act
       (send _w_act :serialize s)
     ;; geometry_msgs/Vector3 _w_err
       (send _w_err :serialize s)
     ;; geometry_msgs/Vector3 _s
       (send _s :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Quaternion _q_des
     (send _q_des :deserialize buf ptr-) (incf ptr- (send _q_des :serialization-length))
   ;; geometry_msgs/Quaternion _q_act
     (send _q_act :deserialize buf ptr-) (incf ptr- (send _q_act :serialization-length))
   ;; geometry_msgs/Quaternion _q_err
     (send _q_err :deserialize buf ptr-) (incf ptr- (send _q_err :serialization-length))
   ;; geometry_msgs/Vector3 _w_des
     (send _w_des :deserialize buf ptr-) (incf ptr- (send _w_des :serialization-length))
   ;; geometry_msgs/Vector3 _w_act
     (send _w_act :deserialize buf ptr-) (incf ptr- (send _w_act :serialization-length))
   ;; geometry_msgs/Vector3 _w_err
     (send _w_err :deserialize buf ptr-) (incf ptr- (send _w_err :serialization-length))
   ;; geometry_msgs/Vector3 _s
     (send _s :deserialize buf ptr-) (incf ptr- (send _s :serialization-length))
   ;;
   self)
  )

(setf (get acl_msgs::SMCData :md5sum-) "c369b167744f4400cc4a61aab630dae0")
(setf (get acl_msgs::SMCData :datatype-) "acl_msgs/SMCData")
(setf (get acl_msgs::SMCData :definition-)
      "Header header
geometry_msgs/Quaternion q_des
geometry_msgs/Quaternion q_act
geometry_msgs/Quaternion q_err

geometry_msgs/Vector3 w_des
geometry_msgs/Vector3 w_act
geometry_msgs/Vector3 w_err

geometry_msgs/Vector3 s
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



(provide :acl_msgs/SMCData "c369b167744f4400cc4a61aab630dae0")


