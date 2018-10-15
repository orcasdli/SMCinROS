;; Auto-generated. Do not edit!


(when (boundp 'turtlesim::TeleportAbsolute)
  (if (not (find-package "TURTLESIM"))
    (make-package "TURTLESIM"))
  (shadow 'TeleportAbsolute (find-package "TURTLESIM")))
(unless (find-package "TURTLESIM::TELEPORTABSOLUTE")
  (make-package "TURTLESIM::TELEPORTABSOLUTE"))
(unless (find-package "TURTLESIM::TELEPORTABSOLUTEREQUEST")
  (make-package "TURTLESIM::TELEPORTABSOLUTEREQUEST"))
(unless (find-package "TURTLESIM::TELEPORTABSOLUTERESPONSE")
  (make-package "TURTLESIM::TELEPORTABSOLUTERESPONSE"))

(in-package "ROS")





(defclass turtlesim::TeleportAbsoluteRequest
  :super ros::object
  :slots (_x _y _theta ))

(defmethod turtlesim::TeleportAbsoluteRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _theta
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta
     (setq _theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass turtlesim::TeleportAbsoluteResponse
  :super ros::object
  :slots ())

(defmethod turtlesim::TeleportAbsoluteResponse
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

(defclass turtlesim::TeleportAbsolute
  :super ros::object
  :slots ())

(setf (get turtlesim::TeleportAbsolute :md5sum-) "a130bc60ee6513855dc62ea83fcc5b20")
(setf (get turtlesim::TeleportAbsolute :datatype-) "turtlesim/TeleportAbsolute")
(setf (get turtlesim::TeleportAbsolute :request) turtlesim::TeleportAbsoluteRequest)
(setf (get turtlesim::TeleportAbsolute :response) turtlesim::TeleportAbsoluteResponse)

(defmethod turtlesim::TeleportAbsoluteRequest
  (:response () (instance turtlesim::TeleportAbsoluteResponse :init)))

(setf (get turtlesim::TeleportAbsoluteRequest :md5sum-) "a130bc60ee6513855dc62ea83fcc5b20")
(setf (get turtlesim::TeleportAbsoluteRequest :datatype-) "turtlesim/TeleportAbsoluteRequest")
(setf (get turtlesim::TeleportAbsoluteRequest :definition-)
      "float32 x
float32 y
float32 theta
---

")

(setf (get turtlesim::TeleportAbsoluteResponse :md5sum-) "a130bc60ee6513855dc62ea83fcc5b20")
(setf (get turtlesim::TeleportAbsoluteResponse :datatype-) "turtlesim/TeleportAbsoluteResponse")
(setf (get turtlesim::TeleportAbsoluteResponse :definition-)
      "float32 x
float32 y
float32 theta
---

")



(provide :turtlesim/TeleportAbsolute "a130bc60ee6513855dc62ea83fcc5b20")


