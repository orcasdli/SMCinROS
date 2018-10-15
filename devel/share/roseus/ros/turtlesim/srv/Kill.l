;; Auto-generated. Do not edit!


(when (boundp 'turtlesim::Kill)
  (if (not (find-package "TURTLESIM"))
    (make-package "TURTLESIM"))
  (shadow 'Kill (find-package "TURTLESIM")))
(unless (find-package "TURTLESIM::KILL")
  (make-package "TURTLESIM::KILL"))
(unless (find-package "TURTLESIM::KILLREQUEST")
  (make-package "TURTLESIM::KILLREQUEST"))
(unless (find-package "TURTLESIM::KILLRESPONSE")
  (make-package "TURTLESIM::KILLRESPONSE"))

(in-package "ROS")





(defclass turtlesim::KillRequest
  :super ros::object
  :slots (_name ))

(defmethod turtlesim::KillRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass turtlesim::KillResponse
  :super ros::object
  :slots ())

(defmethod turtlesim::KillResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass turtlesim::Kill
  :super ros::object
  :slots ())

(setf (get turtlesim::Kill :md5sum-) "c1f3d28f1b044c871e6eff2e9fc3c667")
(setf (get turtlesim::Kill :datatype-) "turtlesim/Kill")
(setf (get turtlesim::Kill :request) turtlesim::KillRequest)
(setf (get turtlesim::Kill :response) turtlesim::KillResponse)

(defmethod turtlesim::KillRequest
  (:response () (instance turtlesim::KillResponse :init)))

(setf (get turtlesim::KillRequest :md5sum-) "c1f3d28f1b044c871e6eff2e9fc3c667")
(setf (get turtlesim::KillRequest :datatype-) "turtlesim/KillRequest")
(setf (get turtlesim::KillRequest :definition-)
      "string name
---
")

(setf (get turtlesim::KillResponse :md5sum-) "c1f3d28f1b044c871e6eff2e9fc3c667")
(setf (get turtlesim::KillResponse :datatype-) "turtlesim/KillResponse")
(setf (get turtlesim::KillResponse :definition-)
      "string name
---
")



(provide :turtlesim/Kill "c1f3d28f1b044c871e6eff2e9fc3c667")


