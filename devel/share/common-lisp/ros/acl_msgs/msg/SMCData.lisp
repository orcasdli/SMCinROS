; Auto-generated. Do not edit!


(cl:in-package acl_msgs-msg)


;//! \htmlinclude SMCData.msg.html

(cl:defclass <SMCData> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (q_des
    :reader q_des
    :initarg :q_des
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion))
   (q_act
    :reader q_act
    :initarg :q_act
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion))
   (q_err
    :reader q_err
    :initarg :q_err
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion))
   (w_des
    :reader w_des
    :initarg :w_des
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (w_act
    :reader w_act
    :initarg :w_act
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (w_err
    :reader w_err
    :initarg :w_err
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (s
    :reader s
    :initarg :s
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass SMCData (<SMCData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SMCData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SMCData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name acl_msgs-msg:<SMCData> is deprecated: use acl_msgs-msg:SMCData instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SMCData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:header-val is deprecated.  Use acl_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'q_des-val :lambda-list '(m))
(cl:defmethod q_des-val ((m <SMCData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:q_des-val is deprecated.  Use acl_msgs-msg:q_des instead.")
  (q_des m))

(cl:ensure-generic-function 'q_act-val :lambda-list '(m))
(cl:defmethod q_act-val ((m <SMCData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:q_act-val is deprecated.  Use acl_msgs-msg:q_act instead.")
  (q_act m))

(cl:ensure-generic-function 'q_err-val :lambda-list '(m))
(cl:defmethod q_err-val ((m <SMCData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:q_err-val is deprecated.  Use acl_msgs-msg:q_err instead.")
  (q_err m))

(cl:ensure-generic-function 'w_des-val :lambda-list '(m))
(cl:defmethod w_des-val ((m <SMCData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:w_des-val is deprecated.  Use acl_msgs-msg:w_des instead.")
  (w_des m))

(cl:ensure-generic-function 'w_act-val :lambda-list '(m))
(cl:defmethod w_act-val ((m <SMCData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:w_act-val is deprecated.  Use acl_msgs-msg:w_act instead.")
  (w_act m))

(cl:ensure-generic-function 'w_err-val :lambda-list '(m))
(cl:defmethod w_err-val ((m <SMCData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:w_err-val is deprecated.  Use acl_msgs-msg:w_err instead.")
  (w_err m))

(cl:ensure-generic-function 's-val :lambda-list '(m))
(cl:defmethod s-val ((m <SMCData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:s-val is deprecated.  Use acl_msgs-msg:s instead.")
  (s m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SMCData>) ostream)
  "Serializes a message object of type '<SMCData>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'q_des) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'q_act) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'q_err) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'w_des) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'w_act) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'w_err) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 's) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SMCData>) istream)
  "Deserializes a message object of type '<SMCData>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'q_des) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'q_act) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'q_err) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'w_des) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'w_act) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'w_err) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 's) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SMCData>)))
  "Returns string type for a message object of type '<SMCData>"
  "acl_msgs/SMCData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SMCData)))
  "Returns string type for a message object of type 'SMCData"
  "acl_msgs/SMCData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SMCData>)))
  "Returns md5sum for a message object of type '<SMCData>"
  "c369b167744f4400cc4a61aab630dae0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SMCData)))
  "Returns md5sum for a message object of type 'SMCData"
  "c369b167744f4400cc4a61aab630dae0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SMCData>)))
  "Returns full string definition for message of type '<SMCData>"
  (cl:format cl:nil "Header header~%geometry_msgs/Quaternion q_des~%geometry_msgs/Quaternion q_act~%geometry_msgs/Quaternion q_err~%~%geometry_msgs/Vector3 w_des~%geometry_msgs/Vector3 w_act~%geometry_msgs/Vector3 w_err~%~%geometry_msgs/Vector3 s~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SMCData)))
  "Returns full string definition for message of type 'SMCData"
  (cl:format cl:nil "Header header~%geometry_msgs/Quaternion q_des~%geometry_msgs/Quaternion q_act~%geometry_msgs/Quaternion q_err~%~%geometry_msgs/Vector3 w_des~%geometry_msgs/Vector3 w_act~%geometry_msgs/Vector3 w_err~%~%geometry_msgs/Vector3 s~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SMCData>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'q_des))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'q_act))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'q_err))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'w_des))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'w_act))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'w_err))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 's))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SMCData>))
  "Converts a ROS message object to a list"
  (cl:list 'SMCData
    (cl:cons ':header (header msg))
    (cl:cons ':q_des (q_des msg))
    (cl:cons ':q_act (q_act msg))
    (cl:cons ':q_err (q_err msg))
    (cl:cons ':w_des (w_des msg))
    (cl:cons ':w_act (w_act msg))
    (cl:cons ':w_err (w_err msg))
    (cl:cons ':s (s msg))
))
