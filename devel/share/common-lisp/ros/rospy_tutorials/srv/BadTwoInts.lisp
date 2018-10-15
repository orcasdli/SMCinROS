; Auto-generated. Do not edit!


(cl:in-package rospy_tutorials-srv)


;//! \htmlinclude BadTwoInts-request.msg.html

(cl:defclass <BadTwoInts-request> (roslisp-msg-protocol:ros-message)
  ((a
    :reader a
    :initarg :a
    :type cl:integer
    :initform 0)
   (b
    :reader b
    :initarg :b
    :type cl:integer
    :initform 0))
)

(cl:defclass BadTwoInts-request (<BadTwoInts-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BadTwoInts-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BadTwoInts-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rospy_tutorials-srv:<BadTwoInts-request> is deprecated: use rospy_tutorials-srv:BadTwoInts-request instead.")))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <BadTwoInts-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rospy_tutorials-srv:a-val is deprecated.  Use rospy_tutorials-srv:a instead.")
  (a m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <BadTwoInts-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rospy_tutorials-srv:b-val is deprecated.  Use rospy_tutorials-srv:b instead.")
  (b m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BadTwoInts-request>) ostream)
  "Serializes a message object of type '<BadTwoInts-request>"
  (cl:let* ((signed (cl:slot-value msg 'a)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'b)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BadTwoInts-request>) istream)
  "Deserializes a message object of type '<BadTwoInts-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'a) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'b) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BadTwoInts-request>)))
  "Returns string type for a service object of type '<BadTwoInts-request>"
  "rospy_tutorials/BadTwoIntsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BadTwoInts-request)))
  "Returns string type for a service object of type 'BadTwoInts-request"
  "rospy_tutorials/BadTwoIntsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BadTwoInts-request>)))
  "Returns md5sum for a message object of type '<BadTwoInts-request>"
  "60962375a49bd6746d7c85dff75ebb9c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BadTwoInts-request)))
  "Returns md5sum for a message object of type 'BadTwoInts-request"
  "60962375a49bd6746d7c85dff75ebb9c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BadTwoInts-request>)))
  "Returns full string definition for message of type '<BadTwoInts-request>"
  (cl:format cl:nil "~%int64 a~%int32 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BadTwoInts-request)))
  "Returns full string definition for message of type 'BadTwoInts-request"
  (cl:format cl:nil "~%int64 a~%int32 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BadTwoInts-request>))
  (cl:+ 0
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BadTwoInts-request>))
  "Converts a ROS message object to a list"
  (cl:list 'BadTwoInts-request
    (cl:cons ':a (a msg))
    (cl:cons ':b (b msg))
))
;//! \htmlinclude BadTwoInts-response.msg.html

(cl:defclass <BadTwoInts-response> (roslisp-msg-protocol:ros-message)
  ((sum
    :reader sum
    :initarg :sum
    :type cl:integer
    :initform 0))
)

(cl:defclass BadTwoInts-response (<BadTwoInts-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BadTwoInts-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BadTwoInts-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rospy_tutorials-srv:<BadTwoInts-response> is deprecated: use rospy_tutorials-srv:BadTwoInts-response instead.")))

(cl:ensure-generic-function 'sum-val :lambda-list '(m))
(cl:defmethod sum-val ((m <BadTwoInts-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rospy_tutorials-srv:sum-val is deprecated.  Use rospy_tutorials-srv:sum instead.")
  (sum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BadTwoInts-response>) ostream)
  "Serializes a message object of type '<BadTwoInts-response>"
  (cl:let* ((signed (cl:slot-value msg 'sum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BadTwoInts-response>) istream)
  "Deserializes a message object of type '<BadTwoInts-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sum) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BadTwoInts-response>)))
  "Returns string type for a service object of type '<BadTwoInts-response>"
  "rospy_tutorials/BadTwoIntsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BadTwoInts-response)))
  "Returns string type for a service object of type 'BadTwoInts-response"
  "rospy_tutorials/BadTwoIntsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BadTwoInts-response>)))
  "Returns md5sum for a message object of type '<BadTwoInts-response>"
  "60962375a49bd6746d7c85dff75ebb9c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BadTwoInts-response)))
  "Returns md5sum for a message object of type 'BadTwoInts-response"
  "60962375a49bd6746d7c85dff75ebb9c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BadTwoInts-response>)))
  "Returns full string definition for message of type '<BadTwoInts-response>"
  (cl:format cl:nil "int32 sum~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BadTwoInts-response)))
  "Returns full string definition for message of type 'BadTwoInts-response"
  (cl:format cl:nil "int32 sum~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BadTwoInts-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BadTwoInts-response>))
  "Converts a ROS message object to a list"
  (cl:list 'BadTwoInts-response
    (cl:cons ':sum (sum msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'BadTwoInts)))
  'BadTwoInts-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'BadTwoInts)))
  'BadTwoInts-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BadTwoInts)))
  "Returns string type for a service object of type '<BadTwoInts>"
  "rospy_tutorials/BadTwoInts")