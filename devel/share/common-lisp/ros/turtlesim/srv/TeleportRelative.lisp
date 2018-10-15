; Auto-generated. Do not edit!


(cl:in-package turtlesim-srv)


;//! \htmlinclude TeleportRelative-request.msg.html

(cl:defclass <TeleportRelative-request> (roslisp-msg-protocol:ros-message)
  ((linear
    :reader linear
    :initarg :linear
    :type cl:float
    :initform 0.0)
   (angular
    :reader angular
    :initarg :angular
    :type cl:float
    :initform 0.0))
)

(cl:defclass TeleportRelative-request (<TeleportRelative-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TeleportRelative-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TeleportRelative-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtlesim-srv:<TeleportRelative-request> is deprecated: use turtlesim-srv:TeleportRelative-request instead.")))

(cl:ensure-generic-function 'linear-val :lambda-list '(m))
(cl:defmethod linear-val ((m <TeleportRelative-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim-srv:linear-val is deprecated.  Use turtlesim-srv:linear instead.")
  (linear m))

(cl:ensure-generic-function 'angular-val :lambda-list '(m))
(cl:defmethod angular-val ((m <TeleportRelative-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim-srv:angular-val is deprecated.  Use turtlesim-srv:angular instead.")
  (angular m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TeleportRelative-request>) ostream)
  "Serializes a message object of type '<TeleportRelative-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'linear))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angular))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TeleportRelative-request>) istream)
  "Deserializes a message object of type '<TeleportRelative-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linear) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angular) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TeleportRelative-request>)))
  "Returns string type for a service object of type '<TeleportRelative-request>"
  "turtlesim/TeleportRelativeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TeleportRelative-request)))
  "Returns string type for a service object of type 'TeleportRelative-request"
  "turtlesim/TeleportRelativeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TeleportRelative-request>)))
  "Returns md5sum for a message object of type '<TeleportRelative-request>"
  "9d5c2dcd348ac8f76ce2a4307bd63a13")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TeleportRelative-request)))
  "Returns md5sum for a message object of type 'TeleportRelative-request"
  "9d5c2dcd348ac8f76ce2a4307bd63a13")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TeleportRelative-request>)))
  "Returns full string definition for message of type '<TeleportRelative-request>"
  (cl:format cl:nil "float32 linear~%float32 angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TeleportRelative-request)))
  "Returns full string definition for message of type 'TeleportRelative-request"
  (cl:format cl:nil "float32 linear~%float32 angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TeleportRelative-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TeleportRelative-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TeleportRelative-request
    (cl:cons ':linear (linear msg))
    (cl:cons ':angular (angular msg))
))
;//! \htmlinclude TeleportRelative-response.msg.html

(cl:defclass <TeleportRelative-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass TeleportRelative-response (<TeleportRelative-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TeleportRelative-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TeleportRelative-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtlesim-srv:<TeleportRelative-response> is deprecated: use turtlesim-srv:TeleportRelative-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TeleportRelative-response>) ostream)
  "Serializes a message object of type '<TeleportRelative-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TeleportRelative-response>) istream)
  "Deserializes a message object of type '<TeleportRelative-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TeleportRelative-response>)))
  "Returns string type for a service object of type '<TeleportRelative-response>"
  "turtlesim/TeleportRelativeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TeleportRelative-response)))
  "Returns string type for a service object of type 'TeleportRelative-response"
  "turtlesim/TeleportRelativeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TeleportRelative-response>)))
  "Returns md5sum for a message object of type '<TeleportRelative-response>"
  "9d5c2dcd348ac8f76ce2a4307bd63a13")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TeleportRelative-response)))
  "Returns md5sum for a message object of type 'TeleportRelative-response"
  "9d5c2dcd348ac8f76ce2a4307bd63a13")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TeleportRelative-response>)))
  "Returns full string definition for message of type '<TeleportRelative-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TeleportRelative-response)))
  "Returns full string definition for message of type 'TeleportRelative-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TeleportRelative-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TeleportRelative-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TeleportRelative-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TeleportRelative)))
  'TeleportRelative-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TeleportRelative)))
  'TeleportRelative-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TeleportRelative)))
  "Returns string type for a service object of type '<TeleportRelative>"
  "turtlesim/TeleportRelative")