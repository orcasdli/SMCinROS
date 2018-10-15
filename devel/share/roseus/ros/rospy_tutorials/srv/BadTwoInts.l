;; Auto-generated. Do not edit!


(when (boundp 'rospy_tutorials::BadTwoInts)
  (if (not (find-package "ROSPY_TUTORIALS"))
    (make-package "ROSPY_TUTORIALS"))
  (shadow 'BadTwoInts (find-package "ROSPY_TUTORIALS")))
(unless (find-package "ROSPY_TUTORIALS::BADTWOINTS")
  (make-package "ROSPY_TUTORIALS::BADTWOINTS"))
(unless (find-package "ROSPY_TUTORIALS::BADTWOINTSREQUEST")
  (make-package "ROSPY_TUTORIALS::BADTWOINTSREQUEST"))
(unless (find-package "ROSPY_TUTORIALS::BADTWOINTSRESPONSE")
  (make-package "ROSPY_TUTORIALS::BADTWOINTSRESPONSE"))

(in-package "ROS")





(defclass rospy_tutorials::BadTwoIntsRequest
  :super ros::object
  :slots (_a _b ))

(defmethod rospy_tutorials::BadTwoIntsRequest
  (:init
   (&key
    ((:a __a) 0)
    ((:b __b) 0)
    )
   (send-super :init)
   (setq _a (round __a))
   (setq _b (round __b))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:serialization-length
   ()
   (+
    ;; int64 _a
    8
    ;; int32 _b
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _a
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _a (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _a) (= (length (_a . bv)) 2)) ;; bignum
              (write-long (ash (elt (_a . bv) 0) 0) s)
              (write-long (ash (elt (_a . bv) 1) -1) s))
             ((and (class _a) (= (length (_a . bv)) 1)) ;; big1
              (write-long (elt (_a . bv) 0) s)
              (write-long (if (>= _a 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _a s)(write-long (if (>= _a 0) 0 #xffffffff) s)))
     ;; int32 _b
       (write-long _b s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _a
#+(or :alpha :irix6 :x86_64)
      (setf _a (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _a (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int32 _b
     (setq _b (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass rospy_tutorials::BadTwoIntsResponse
  :super ros::object
  :slots (_sum ))

(defmethod rospy_tutorials::BadTwoIntsResponse
  (:init
   (&key
    ((:sum __sum) 0)
    )
   (send-super :init)
   (setq _sum (round __sum))
   self)
  (:sum
   (&optional __sum)
   (if __sum (setq _sum __sum)) _sum)
  (:serialization-length
   ()
   (+
    ;; int32 _sum
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _sum
       (write-long _sum s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _sum
     (setq _sum (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass rospy_tutorials::BadTwoInts
  :super ros::object
  :slots ())

(setf (get rospy_tutorials::BadTwoInts :md5sum-) "60962375a49bd6746d7c85dff75ebb9c")
(setf (get rospy_tutorials::BadTwoInts :datatype-) "rospy_tutorials/BadTwoInts")
(setf (get rospy_tutorials::BadTwoInts :request) rospy_tutorials::BadTwoIntsRequest)
(setf (get rospy_tutorials::BadTwoInts :response) rospy_tutorials::BadTwoIntsResponse)

(defmethod rospy_tutorials::BadTwoIntsRequest
  (:response () (instance rospy_tutorials::BadTwoIntsResponse :init)))

(setf (get rospy_tutorials::BadTwoIntsRequest :md5sum-) "60962375a49bd6746d7c85dff75ebb9c")
(setf (get rospy_tutorials::BadTwoIntsRequest :datatype-) "rospy_tutorials/BadTwoIntsRequest")
(setf (get rospy_tutorials::BadTwoIntsRequest :definition-)
      "
int64 a
int32 b
---
int32 sum

")

(setf (get rospy_tutorials::BadTwoIntsResponse :md5sum-) "60962375a49bd6746d7c85dff75ebb9c")
(setf (get rospy_tutorials::BadTwoIntsResponse :datatype-) "rospy_tutorials/BadTwoIntsResponse")
(setf (get rospy_tutorials::BadTwoIntsResponse :definition-)
      "
int64 a
int32 b
---
int32 sum

")



(provide :rospy_tutorials/BadTwoInts "60962375a49bd6746d7c85dff75ebb9c")


