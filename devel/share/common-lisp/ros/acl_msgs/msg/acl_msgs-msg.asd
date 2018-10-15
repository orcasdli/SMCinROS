
(cl:in-package :asdf)

(defsystem "acl_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "IMU" :depends-on ("_package_IMU"))
    (:file "_package_IMU" :depends-on ("_package"))
    (:file "QuadAttCmd" :depends-on ("_package_QuadAttCmd"))
    (:file "_package_QuadAttCmd" :depends-on ("_package"))
    (:file "QuadMotors" :depends-on ("_package_QuadMotors"))
    (:file "_package_QuadMotors" :depends-on ("_package"))
    (:file "SMCData" :depends-on ("_package_SMCData"))
    (:file "_package_SMCData" :depends-on ("_package"))
    (:file "State" :depends-on ("_package_State"))
    (:file "_package_State" :depends-on ("_package"))
    (:file "ViconState" :depends-on ("_package_ViconState"))
    (:file "_package_ViconState" :depends-on ("_package"))
  ))