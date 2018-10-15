; Auto-generated. Do not edit!


(cl:in-package turtlesim-msg)


;//! \htmlinclude Color.msg.html

(cl:defclass <Color> (roslisp-msg-protocol:ros-message)
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
    :initform 0))
)

(cl:defclass Color (<Color>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Color>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Color)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtlesim-msg:<Color> is deprecated: use turtlesim-msg:Color instead.")))

(cl:ensure-generic-function 'r-val :lambda-list '(m))
(cl:defmethod r-val ((m <Color>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim-msg:r-val is deprecated.  Use turtlesim-msg:r instead.")
  (r m))

(cl:ensure-generic-function 'g-val :lambda-list '(m))
(cl:defmethod g-val ((m <Color>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim-msg:g-val is deprecated.  Use turtlesim-msg:g instead.")
  (g m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <Color>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim-msg:b-val is deprecated.  Use turtlesim-msg:b instead.")
  (b m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Color>) ostream)
  "Serializes a message object of type '<Color>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Color>) istream)
  "Deserializes a message object of type '<Color>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Color>)))
  "Returns string type for a message object of type '<Color>"
  "turtlesim/Color")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Color)))
  "Returns string type for a message object of type 'Color"
  "turtlesim/Color")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Color>)))
  "Returns md5sum for a message object of type '<Color>"
  "353891e354491c51aabe32df673fb446")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Color)))
  "Returns md5sum for a message object of type 'Color"
  "353891e354491c51aabe32df673fb446")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Color>)))
  "Returns full string definition for message of type '<Color>"
  (cl:format cl:nil "uint8 r~%uint8 g~%uint8 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Color)))
  "Returns full string definition for message of type 'Color"
  (cl:format cl:nil "uint8 r~%uint8 g~%uint8 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Color>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Color>))
  "Converts a ROS message object to a list"
  (cl:list 'Color
    (cl:cons ':r (r msg))
    (cl:cons ':g (g msg))
    (cl:cons ':b (b msg))
))
