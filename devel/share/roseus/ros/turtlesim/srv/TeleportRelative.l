;; Auto-generated. Do not edit!


(when (boundp 'turtlesim::TeleportRelative)
  (if (not (find-package "TURTLESIM"))
    (make-package "TURTLESIM"))
  (shadow 'TeleportRelative (find-package "TURTLESIM")))
(unless (find-package "TURTLESIM::TELEPORTRELATIVE")
  (make-package "TURTLESIM::TELEPORTRELATIVE"))
(unless (find-package "TURTLESIM::TELEPORTRELATIVEREQUEST")
  (make-package "TURTLESIM::TELEPORTRELATIVEREQUEST"))
(unless (find-package "TURTLESIM::TELEPORTRELATIVERESPONSE")
  (make-package "TURTLESIM::TELEPORTRELATIVERESPONSE"))

(in-package "ROS")





(defclass turtlesim::TeleportRelativeRequest
  :super ros::object
  :slots (_linear _angular ))

(defmethod turtlesim::TeleportRelativeRequest
  (:init
   (&key
    ((:linear __linear) 0.0)
    ((:angular __angular) 0.0)
    )
   (send-super :init)
   (setq _linear (float __linear))
   (setq _angular (float __angular))
   self)
  (:linear
   (&optional __linear)
   (if __linear (setq _linear __linear)) _linear)
  (:angular
   (&optional __angular)
   (if __angular (setq _angular __angular)) _angular)
  (:serialization-length
   ()
   (+
    ;; float32 _linear
    4
    ;; float32 _angular
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _linear
       (sys::poke _linear (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angular
       (sys::poke _angular (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _linear
     (setq _linear (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angular
     (setq _angular (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass turtlesim::TeleportRelativeResponse
  :super ros::object
  :slots ())

(defmethod turtlesim::TeleportRelativeResponse
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

(defclass turtlesim::TeleportRelative
  :super ros::object
  :slots ())

(setf (get turtlesim::TeleportRelative :md5sum-) "9d5c2dcd348ac8f76ce2a4307bd63a13")
(setf (get turtlesim::TeleportRelative :datatype-) "turtlesim/TeleportRelative")
(setf (get turtlesim::TeleportRelative :request) turtlesim::TeleportRelativeRequest)
(setf (get turtlesim::TeleportRelative :response) turtlesim::TeleportRelativeResponse)

(defmethod turtlesim::TeleportRelativeRequest
  (:response () (instance turtlesim::TeleportRelativeResponse :init)))

(setf (get turtlesim::TeleportRelativeRequest :md5sum-) "9d5c2dcd348ac8f76ce2a4307bd63a13")
(setf (get turtlesim::TeleportRelativeRequest :datatype-) "turtlesim/TeleportRelativeRequest")
(setf (get turtlesim::TeleportRelativeRequest :definition-)
      "float32 linear
float32 angular
---

")

(setf (get turtlesim::TeleportRelativeResponse :md5sum-) "9d5c2dcd348ac8f76ce2a4307bd63a13")
(setf (get turtlesim::TeleportRelativeResponse :datatype-) "turtlesim/TeleportRelativeResponse")
(setf (get turtlesim::TeleportRelativeResponse :definition-)
      "float32 linear
float32 angular
---

")



(provide :turtlesim/TeleportRelative "9d5c2dcd348ac8f76ce2a4307bd63a13")


