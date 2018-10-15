;; Auto-generated. Do not edit!


(when (boundp 'rospy_tutorials::HeaderString)
  (if (not (find-package "ROSPY_TUTORIALS"))
    (make-package "ROSPY_TUTORIALS"))
  (shadow 'HeaderString (find-package "ROSPY_TUTORIALS")))
(unless (find-package "ROSPY_TUTORIALS::HEADERSTRING")
  (make-package "ROSPY_TUTORIALS::HEADERSTRING"))

(in-package "ROS")
;;//! \htmlinclude HeaderString.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass rospy_tutorials::HeaderString
  :super ros::object
  :slots (_header _data ))

(defmethod rospy_tutorials::HeaderString
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:data __data) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _data (string __data))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _data
    4 (length _data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get rospy_tutorials::HeaderString :md5sum-) "c99a9440709e4d4a9716d55b8270d5e7")
(setf (get rospy_tutorials::HeaderString :datatype-) "rospy_tutorials/HeaderString")
(setf (get rospy_tutorials::HeaderString :definition-)
      "Header header
string data

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



(provide :rospy_tutorials/HeaderString "c99a9440709e4d4a9716d55b8270d5e7")


