
(cl:in-package :asdf)

(defsystem "rospy_tutorials-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "AddTwoInts" :depends-on ("_package_AddTwoInts"))
    (:file "_package_AddTwoInts" :depends-on ("_package"))
    (:file "BadTwoInts" :depends-on ("_package_BadTwoInts"))
    (:file "_package_BadTwoInts" :depends-on ("_package"))
  ))