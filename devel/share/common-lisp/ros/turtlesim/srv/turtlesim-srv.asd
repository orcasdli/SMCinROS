
(cl:in-package :asdf)

(defsystem "turtlesim-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Kill" :depends-on ("_package_Kill"))
    (:file "_package_Kill" :depends-on ("_package"))
    (:file "SetPen" :depends-on ("_package_SetPen"))
    (:file "_package_SetPen" :depends-on ("_package"))
    (:file "Spawn" :depends-on ("_package_Spawn"))
    (:file "_package_Spawn" :depends-on ("_package"))
    (:file "TeleportAbsolute" :depends-on ("_package_TeleportAbsolute"))
    (:file "_package_TeleportAbsolute" :depends-on ("_package"))
    (:file "TeleportRelative" :depends-on ("_package_TeleportRelative"))
    (:file "_package_TeleportRelative" :depends-on ("_package"))
  ))