
(cl:in-package :asdf)

(defsystem "movement_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "HeadParamsMsg" :depends-on ("_package_HeadParamsMsg"))
    (:file "_package_HeadParamsMsg" :depends-on ("_package"))
    (:file "OpencmRequestMsg" :depends-on ("_package_OpencmRequestMsg"))
    (:file "_package_OpencmRequestMsg" :depends-on ("_package"))
    (:file "OpencmResponseMsg" :depends-on ("_package_OpencmResponseMsg"))
    (:file "_package_OpencmResponseMsg" :depends-on ("_package"))
    (:file "WalkingParamsMsg" :depends-on ("_package_WalkingParamsMsg"))
    (:file "_package_WalkingParamsMsg" :depends-on ("_package"))
    (:file "WalkingPositionsMsg" :depends-on ("_package_WalkingPositionsMsg"))
    (:file "_package_WalkingPositionsMsg" :depends-on ("_package"))
  ))