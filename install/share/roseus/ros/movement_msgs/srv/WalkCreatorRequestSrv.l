;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::WalkCreatorRequestSrv)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'WalkCreatorRequestSrv (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::WALKCREATORREQUESTSRV")
  (make-package "MOVEMENT_MSGS::WALKCREATORREQUESTSRV"))
(unless (find-package "MOVEMENT_MSGS::WALKCREATORREQUESTSRVREQUEST")
  (make-package "MOVEMENT_MSGS::WALKCREATORREQUESTSRVREQUEST"))
(unless (find-package "MOVEMENT_MSGS::WALKCREATORREQUESTSRVRESPONSE")
  (make-package "MOVEMENT_MSGS::WALKCREATORREQUESTSRVRESPONSE"))

(in-package "ROS")





(defclass movement_msgs::WalkCreatorRequestSrvRequest
  :super ros::object
  :slots (_enabledGain _stepGain _lateralGain _turnGain ))

(defmethod movement_msgs::WalkCreatorRequestSrvRequest
  (:init
   (&key
    ((:enabledGain __enabledGain) 0)
    ((:stepGain __stepGain) 0.0)
    ((:lateralGain __lateralGain) 0.0)
    ((:turnGain __turnGain) 0.0)
    )
   (send-super :init)
   (setq _enabledGain (round __enabledGain))
   (setq _stepGain (float __stepGain))
   (setq _lateralGain (float __lateralGain))
   (setq _turnGain (float __turnGain))
   self)
  (:enabledGain
   (&optional __enabledGain)
   (if __enabledGain (setq _enabledGain __enabledGain)) _enabledGain)
  (:stepGain
   (&optional __stepGain)
   (if __stepGain (setq _stepGain __stepGain)) _stepGain)
  (:lateralGain
   (&optional __lateralGain)
   (if __lateralGain (setq _lateralGain __lateralGain)) _lateralGain)
  (:turnGain
   (&optional __turnGain)
   (if __turnGain (setq _turnGain __turnGain)) _turnGain)
  (:serialization-length
   ()
   (+
    ;; int32 _enabledGain
    4
    ;; float32 _stepGain
    4
    ;; float32 _lateralGain
    4
    ;; float32 _turnGain
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _enabledGain
       (write-long _enabledGain s)
     ;; float32 _stepGain
       (sys::poke _stepGain (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _lateralGain
       (sys::poke _lateralGain (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _turnGain
       (sys::poke _turnGain (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _enabledGain
     (setq _enabledGain (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _stepGain
     (setq _stepGain (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _lateralGain
     (setq _lateralGain (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _turnGain
     (setq _turnGain (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass movement_msgs::WalkCreatorRequestSrvResponse
  :super ros::object
  :slots (_success ))

(defmethod movement_msgs::WalkCreatorRequestSrvResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass movement_msgs::WalkCreatorRequestSrv
  :super ros::object
  :slots ())

(setf (get movement_msgs::WalkCreatorRequestSrv :md5sum-) "2ef0cc05178b854a3a3baabade41abc2")
(setf (get movement_msgs::WalkCreatorRequestSrv :datatype-) "movement_msgs/WalkCreatorRequestSrv")
(setf (get movement_msgs::WalkCreatorRequestSrv :request) movement_msgs::WalkCreatorRequestSrvRequest)
(setf (get movement_msgs::WalkCreatorRequestSrv :response) movement_msgs::WalkCreatorRequestSrvResponse)

(defmethod movement_msgs::WalkCreatorRequestSrvRequest
  (:response () (instance movement_msgs::WalkCreatorRequestSrvResponse :init)))

(setf (get movement_msgs::WalkCreatorRequestSrvRequest :md5sum-) "2ef0cc05178b854a3a3baabade41abc2")
(setf (get movement_msgs::WalkCreatorRequestSrvRequest :datatype-) "movement_msgs/WalkCreatorRequestSrvRequest")
(setf (get movement_msgs::WalkCreatorRequestSrvRequest :definition-)
      "int32   enabledGain
float32 stepGain
float32 lateralGain
float32 turnGain
---
bool success
")

(setf (get movement_msgs::WalkCreatorRequestSrvResponse :md5sum-) "2ef0cc05178b854a3a3baabade41abc2")
(setf (get movement_msgs::WalkCreatorRequestSrvResponse :datatype-) "movement_msgs/WalkCreatorRequestSrvResponse")
(setf (get movement_msgs::WalkCreatorRequestSrvResponse :definition-)
      "int32   enabledGain
float32 stepGain
float32 lateralGain
float32 turnGain
---
bool success
")



(provide :movement_msgs/WalkCreatorRequestSrv "2ef0cc05178b854a3a3baabade41abc2")


