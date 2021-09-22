
(cl:in-package :asdf)

(defsystem "movement_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "BehRequestSrv" :depends-on ("_package_BehRequestSrv"))
    (:file "_package_BehRequestSrv" :depends-on ("_package"))
  ))