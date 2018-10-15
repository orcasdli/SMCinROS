; Auto-generated. Do not edit!


(cl:in-package turtlesim-srv)


;//! \htmlinclude TeleportAbsolute-request.msg.html

(cl:defclass <TeleportAbsolute-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (theta
    :reader theta
    :initarg :theta
    :type cl:float
    :initform 0.0))
)

(cl:defclass TeleportAbsolute-request (<TeleportAbsolute-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TeleportAbsolute-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TeleportAbsolute-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtlesim-srv:<TeleportAbsolute-request> is deprecated: use turtlesim-srv:TeleportAbsolute-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <TeleportAbsolute-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim-srv:x-val is deprecated.  Use turtlesim-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <TeleportAbsolute-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim-srv:y-val is deprecated.  Use turtlesim-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'theta-val :lambda-list '(m))
(cl:defmethod theta-val ((m <TeleportAbsolute-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim-srv:theta-val is deprecated.  Use turtlesim-srv:theta instead.")
  (theta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TeleportAbsolute-request>) ostream)
  "Serializes a message object of type '<TeleportAbsolute-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TeleportAbsolute-request>) istream)
  "Deserializes a message object of type '<TeleportAbsolute-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TeleportAbsolute-request>)))
  "Returns string type for a service object of type '<TeleportAbsolute-request>"
  "turtlesim/TeleportAbsoluteRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TeleportAbsolute-request)))
  "Returns string type for a service object of type 'TeleportAbsolute-request"
  "turtlesim/TeleportAbsoluteRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TeleportAbsolute-request>)))
  "Returns md5sum for a message object of type '<TeleportAbsolute-request>"
  "a130bc60ee6513855dc62ea83fcc5b20")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TeleportAbsolute-request)))
  "Returns md5sum for a message object of type 'TeleportAbsolute-request"
  "a130bc60ee6513855dc62ea83fcc5b20")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TeleportAbsolute-request>)))
  "Returns full string definition for message of type '<TeleportAbsolute-request>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TeleportAbsolute-request)))
  "Returns full string definition for message of type 'TeleportAbsolute-request"
  (cl:format cl:nil "float32 x~%float32 y~%float32 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TeleportAbsolute-request>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TeleportAbsolute-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TeleportAbsolute-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':theta (theta msg))
))
;//! \htmlinclude TeleportAbsolute-response.msg.html

(cl:defclass <TeleportAbsolute-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass TeleportAbsolute-response (<TeleportAbsolute-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TeleportAbsolute-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TeleportAbsolute-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtlesim-srv:<TeleportAbsolute-response> is deprecated: use turtlesim-srv:TeleportAbsolute-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TeleportAbsolute-response>) ostream)
  "Serializes a message object of type '<TeleportAbsolute-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TeleportAbsolute-response>) istream)
  "Deserializes a message object of type '<TeleportAbsolute-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TeleportAbsolute-response>)))
  "Returns string type for a service object of type '<TeleportAbsolute-response>"
  "turtlesim/TeleportAbsoluteResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TeleportAbsolute-response)))
  "Returns string type for a service object of type 'TeleportAbsolute-response"
  "turtlesim/TeleportAbsoluteResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TeleportAbsolute-response>)))
  "Returns md5sum for a message object of type '<TeleportAbsolute-response>"
  "a130bc60ee6513855dc62ea83fcc5b20")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TeleportAbsolute-response)))
  "Returns md5sum for a message object of type 'TeleportAbsolute-response"
  "a130bc60ee6513855dc62ea83fcc5b20")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TeleportAbsolute-response>)))
  "Returns full string definition for message of type '<TeleportAbsolute-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TeleportAbsolute-response)))
  "Returns full string definition for message of type 'TeleportAbsolute-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TeleportAbsolute-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TeleportAbsolute-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TeleportAbsolute-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TeleportAbsolute)))
  'TeleportAbsolute-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TeleportAbsolute)))
  'TeleportAbsolute-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TeleportAbsolute)))
  "Returns string type for a service object of type '<TeleportAbsolute>"
  "turtlesim/TeleportAbsolute")