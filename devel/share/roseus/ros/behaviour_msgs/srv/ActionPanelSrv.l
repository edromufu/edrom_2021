;; Auto-generated. Do not edit!


(when (boundp 'behaviour_msgs::ActionPanelSrv)
  (if (not (find-package "BEHAVIOUR_MSGS"))
    (make-package "BEHAVIOUR_MSGS"))
  (shadow 'ActionPanelSrv (find-package "BEHAVIOUR_MSGS")))
(unless (find-package "BEHAVIOUR_MSGS::ACTIONPANELSRV")
  (make-package "BEHAVIOUR_MSGS::ACTIONPANELSRV"))
(unless (find-package "BEHAVIOUR_MSGS::ACTIONPANELSRVREQUEST")
  (make-package "BEHAVIOUR_MSGS::ACTIONPANELSRVREQUEST"))
(unless (find-package "BEHAVIOUR_MSGS::ACTIONPANELSRVRESPONSE")
  (make-package "BEHAVIOUR_MSGS::ACTIONPANELSRVRESPONSE"))

(in-package "ROS")





(defclass behaviour_msgs::ActionPanelSrvRequest
  :super ros::object
  :slots (_actions ))

(defmethod behaviour_msgs::ActionPanelSrvRequest
  (:init
   (&key
    ((:actions __actions) (instance behaviour_msgs::ActionMsg :init))
    )
   (send-super :init)
   (setq _actions __actions)
   self)
  (:actions
   (&rest __actions)
   (if (keywordp (car __actions))
       (send* _actions __actions)
     (progn
       (if __actions (setq _actions (car __actions)))
       _actions)))
  (:serialization-length
   ()
   (+
    ;; behaviour_msgs/ActionMsg _actions
    (send _actions :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; behaviour_msgs/ActionMsg _actions
       (send _actions :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; behaviour_msgs/ActionMsg _actions
     (send _actions :deserialize buf ptr-) (incf ptr- (send _actions :serialization-length))
   ;;
   self)
  )

(defclass behaviour_msgs::ActionPanelSrvResponse
  :super ros::object
  :slots (_status ))

(defmethod behaviour_msgs::ActionPanelSrvResponse
  (:init
   (&key
    ((:status __status) nil)
    )
   (send-super :init)
   (setq _status __status)
   self)
  (:status
   (&optional (__status :null))
   (if (not (eq __status :null)) (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; bool _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _status
       (if _status (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _status
     (setq _status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass behaviour_msgs::ActionPanelSrv
  :super ros::object
  :slots ())

(setf (get behaviour_msgs::ActionPanelSrv :md5sum-) "08e9f2a38a830622970eb20f373e5093")
(setf (get behaviour_msgs::ActionPanelSrv :datatype-) "behaviour_msgs/ActionPanelSrv")
(setf (get behaviour_msgs::ActionPanelSrv :request) behaviour_msgs::ActionPanelSrvRequest)
(setf (get behaviour_msgs::ActionPanelSrv :response) behaviour_msgs::ActionPanelSrvResponse)

(defmethod behaviour_msgs::ActionPanelSrvRequest
  (:response () (instance behaviour_msgs::ActionPanelSrvResponse :init)))

(setf (get behaviour_msgs::ActionPanelSrvRequest :md5sum-) "08e9f2a38a830622970eb20f373e5093")
(setf (get behaviour_msgs::ActionPanelSrvRequest :datatype-) "behaviour_msgs/ActionPanelSrvRequest")
(setf (get behaviour_msgs::ActionPanelSrvRequest :definition-)
      "behaviour_msgs/ActionMsg actions


================================================================================
MSG: behaviour_msgs/ActionMsg

bool ball_tracking
bool center_ball
bool align_body
bool walk
bool kick
int32 defend
bool squat
bool goal_tracking
---
bool status

")

(setf (get behaviour_msgs::ActionPanelSrvResponse :md5sum-) "08e9f2a38a830622970eb20f373e5093")
(setf (get behaviour_msgs::ActionPanelSrvResponse :datatype-) "behaviour_msgs/ActionPanelSrvResponse")
(setf (get behaviour_msgs::ActionPanelSrvResponse :definition-)
      "behaviour_msgs/ActionMsg actions


================================================================================
MSG: behaviour_msgs/ActionMsg

bool ball_tracking
bool center_ball
bool align_body
bool walk
bool kick
int32 defend
bool squat
bool goal_tracking
---
bool status

")



(provide :behaviour_msgs/ActionPanelSrv "08e9f2a38a830622970eb20f373e5093")


