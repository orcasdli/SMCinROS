; Auto-generated. Do not edit!


(cl:in-package turtlesim-srv)


;//! \htmlinclude SetPen-request.msg.html

(cl:defclass <SetPen-request> (roslisp-msg-protocol:ros-message)
  ((r
    :reader r
    :initarg :r
    :type cl:fixnum
    :initform 0)
   (g
    :reader g
    :initarg :g
    :type cl:fixnum
    :initform 0)
   (b
    :reader b
    :initarg :b
    :type cl:fixnum
    :initform 0)
   (width
    :reader width
    :initarg :width
    :type cl:fixnum
    :initform 0)
   (off
    :reader off
    :initarg :off
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SetPen-request (<SetPen-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPen-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPen-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtlesim-srv:<SetPen-request> is deprecated: use turtlesim-srv:SetPen-request instead.")))

(cl:ensure-generic-function 'r-val :lambda-list '(m))
(cl:defmethod r-val ((m <SetPen-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim-srv:r-val is deprecated.  Use turtlesim-srv:r instead.")
  (r m))

(cl:ensure-generic-function 'g-val :lambda-list '(m))
(cl:defmethod g-val ((m <SetPen-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim-srv:g-val is deprecated.  Use turtlesim-srv:g instead.")
  (g m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <SetPen-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim-srv:b-val is deprecated.  Use turtlesim-srv:b instead.")
  (b m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <SetPen-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim-srv:width-val is deprecated.  Use turtlesim-srv:width instead.")
  (width m))

(cl:ensure-generic-function 'off-val :lambda-list '(m))
(cl:defmethod off-val ((m <SetPen-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim-srv:off-val is deprecated.  Use turtlesim-srv:off instead.")
  (off m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPen-request>) ostream)
  "Serializes a message object of type '<SetPen-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'off)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPen-request>) istream)
  "Deserializes a message object of type '<SetPen-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'off)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPen-request>)))
  "Returns string type for a service object of type '<SetPen-request>"
  "turtlesim/SetPenRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPen-request)))
  "Returns string type for a service object of type 'SetPen-request"
  "turtlesim/SetPenRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPen-request>)))
  "Returns md5sum for a message object of type '<SetPen-request>"
  "9f452acce566bf0c0954594f69a8e41b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPen-request)))
  "Returns md5sum for a message object of type 'SetPen-request"
  "9f452acce566bf0c0954594f69a8e41b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPen-request>)))
  "Returns full string definition for message of type '<SetPen-request>"
  (cl:format cl:nil "uint8 r~%uint8 g~%uint8 b~%uint8 width~%uint8 off~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPen-request)))
  "Returns full string definition for message of type 'SetPen-request"
  (cl:format cl:nil "uint8 r~%uint8 g~%uint8 b~%uint8 width~%uint8 off~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPen-request>))
  (cl:+ 0
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPen-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPen-request
    (cl:cons ':r (r msg))
    (cl:cons ':g (g msg))
    (cl:cons ':b (b msg))
    (cl:cons ':width (width msg))
    (cl:cons ':off (off msg))
))
;//! \htmlinclude SetPen-response.msg.html

(cl:defclass <SetPen-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetPen-response (<SetPen-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPen-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPen-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtlesim-srv:<SetPen-response> is deprecated: use turtlesim-srv:SetPen-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPen-response>) ostream)
  "Serializes a message object of type '<SetPen-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPen-response>) istream)
  "Deserializes a message object of type '<SetPen-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPen-response>)))
  "Returns string type for a service object of type '<SetPen-response>"
  "turtlesim/SetPenResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPen-response)))
  "Returns string type for a service object of type 'SetPen-response"
  "turtlesim/SetPenResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPen-response>)))
  "Returns md5sum for a message object of type '<SetPen-response>"
  "9f452acce566bf0c0954594f69a8e41b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPen-response)))
  "Returns md5sum for a message object of type 'SetPen-response"
  "9f452acce566bf0c0954594f69a8e41b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPen-response>)))
  "Returns full string definition for message of type '<SetPen-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPen-response)))
  "Returns full string definition for message of type 'SetPen-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPen-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPen-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPen-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetPen)))
  'SetPen-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetPen)))
  'SetPen-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPen)))
  "Returns string type for a service object of type '<SetPen>"
  "turtlesim/SetPen")