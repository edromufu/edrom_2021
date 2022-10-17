
(cl:in-package :asdf)

(defsystem "behaviour_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :behaviour_msgs-msg
)
  :components ((:file "_package")
    (:file "ActionPanelSrv" :depends-on ("_package_ActionPanelSrv"))
    (:file "_package_ActionPanelSrv" :depends-on ("_package"))
    (:file "GameControllerSrv" :depends-on ("_package_GameControllerSrv"))
    (:file "_package_GameControllerSrv" :depends-on ("_package"))
    (:file "service_page" :depends-on ("_package_service_page"))
    (:file "_package_service_page" :depends-on ("_package"))
    (:file "yamlTransitionSrv" :depends-on ("_package_yamlTransitionSrv"))
    (:file "_package_yamlTransitionSrv" :depends-on ("_package"))
  ))