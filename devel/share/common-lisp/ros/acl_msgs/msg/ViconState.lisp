; Auto-generated. Do not edit!


(cl:in-package acl_msgs-msg)


;//! \htmlinclude ViconState.msg.html

(cl:defclass <ViconState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (Eulers
    :reader Eulers
    :initarg :Eulers
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (twist
    :reader twist
    :initarg :twist
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist))
   (pos_accel
    :reader pos_accel
    :initarg :pos_accel
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (Eulers_accel
    :reader Eulers_accel
    :initarg :Eulers_accel
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (has_pose
    :reader has_pose
    :initarg :has_pose
    :type cl:boolean
    :initform cl:nil)
   (has_twist
    :reader has_twist
    :initarg :has_twist
    :type cl:boolean
    :initform cl:nil)
   (has_accel
    :reader has_accel
    :initarg :has_accel
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ViconState (<ViconState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ViconState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ViconState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name acl_msgs-msg:<ViconState> is deprecated: use acl_msgs-msg:ViconState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ViconState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:header-val is deprecated.  Use acl_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <ViconState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:pose-val is deprecated.  Use acl_msgs-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'Eulers-val :lambda-list '(m))
(cl:defmethod Eulers-val ((m <ViconState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:Eulers-val is deprecated.  Use acl_msgs-msg:Eulers instead.")
  (Eulers m))

(cl:ensure-generic-function 'twist-val :lambda-list '(m))
(cl:defmethod twist-val ((m <ViconState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:twist-val is deprecated.  Use acl_msgs-msg:twist instead.")
  (twist m))

(cl:ensure-generic-function 'pos_accel-val :lambda-list '(m))
(cl:defmethod pos_accel-val ((m <ViconState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:pos_accel-val is deprecated.  Use acl_msgs-msg:pos_accel instead.")
  (pos_accel m))

(cl:ensure-generic-function 'Eulers_accel-val :lambda-list '(m))
(cl:defmethod Eulers_accel-val ((m <ViconState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:Eulers_accel-val is deprecated.  Use acl_msgs-msg:Eulers_accel instead.")
  (Eulers_accel m))

(cl:ensure-generic-function 'has_pose-val :lambda-list '(m))
(cl:defmethod has_pose-val ((m <ViconState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:has_pose-val is deprecated.  Use acl_msgs-msg:has_pose instead.")
  (has_pose m))

(cl:ensure-generic-function 'has_twist-val :lambda-list '(m))
(cl:defmethod has_twist-val ((m <ViconState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:has_twist-val is deprecated.  Use acl_msgs-msg:has_twist instead.")
  (has_twist m))

(cl:ensure-generic-function 'has_accel-val :lambda-list '(m))
(cl:defmethod has_accel-val ((m <ViconState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader acl_msgs-msg:has_accel-val is deprecated.  Use acl_msgs-msg:has_accel instead.")
  (has_accel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ViconState>) ostream)
  "Serializes a message object of type '<ViconState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Eulers) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'twist) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pos_accel) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Eulers_accel) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'has_pose) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'has_twist) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'has_accel) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ViconState>) istream)
  "Deserializes a message object of type '<ViconState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Eulers) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'twist) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pos_accel) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Eulers_accel) istream)
    (cl:setf (cl:slot-value msg 'has_pose) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'has_twist) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'has_accel) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ViconState>)))
  "Returns string type for a message object of type '<ViconState>"
  "acl_msgs/ViconState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ViconState)))
  "Returns string type for a message object of type 'ViconState"
  "acl_msgs/ViconState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ViconState>)))
  "Returns md5sum for a message object of type '<ViconState>"
  "b7e43266dac9a0f8e73e309a192f76b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ViconState)))
  "Returns md5sum for a message object of type 'ViconState"
  "b7e43266dac9a0f8e73e309a192f76b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ViconState>)))
  "Returns full string definition for message of type '<ViconState>"
  (cl:format cl:nil "Header header~%geometry_msgs/Pose pose~%geometry_msgs/Vector3 Eulers~%geometry_msgs/Twist twist~%geometry_msgs/Vector3 pos_accel~%geometry_msgs/Vector3 Eulers_accel~%bool has_pose~%bool has_twist~%bool has_accel~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ViconState)))
  "Returns full string definition for message of type 'ViconState"
  (cl:format cl:nil "Header header~%geometry_msgs/Pose pose~%geometry_msgs/Vector3 Eulers~%geometry_msgs/Twist twist~%geometry_msgs/Vector3 pos_accel~%geometry_msgs/Vector3 Eulers_accel~%bool has_pose~%bool has_twist~%bool has_accel~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ViconState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Eulers))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'twist))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pos_accel))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Eulers_accel))
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ViconState>))
  "Converts a ROS message object to a list"
  (cl:list 'ViconState
    (cl:cons ':header (header msg))
    (cl:cons ':pose (pose msg))
    (cl:cons ':Eulers (Eulers msg))
    (cl:cons ':twist (twist msg))
    (cl:cons ':pos_accel (pos_accel msg))
    (cl:cons ':Eulers_accel (Eulers_accel msg))
    (cl:cons ':has_pose (has_pose msg))
    (cl:cons ':has_twist (has_twist msg))
    (cl:cons ':has_accel (has_accel msg))
))
