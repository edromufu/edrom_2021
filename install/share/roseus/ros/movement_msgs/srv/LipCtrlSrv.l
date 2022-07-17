;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::LipCtrlSrv)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'LipCtrlSrv (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::LIPCTRLSRV")
  (make-package "MOVEMENT_MSGS::LIPCTRLSRV"))
(unless (find-package "MOVEMENT_MSGS::LIPCTRLSRVREQUEST")
  (make-package "MOVEMENT_MSGS::LIPCTRLSRVREQUEST"))
(unless (find-package "MOVEMENT_MSGS::LIPCTRLSRVRESPONSE")
  (make-package "MOVEMENT_MSGS::LIPCTRLSRVRESPONSE"))

(in-package "ROS")





(defclass movement_msgs::LipCtrlSrvRequest
  :super ros::object
  :slots (_walk_ctrl _delayR _delayL _delayAll ))

(defmethod movement_msgs::LipCtrlSrvRequest
  (:init
   (&key
    ((:walk_ctrl __walk_ctrl) nil)
    ((:delayR __delayR) 0.0)
    ((:delayL __delayL) 0.0)
    ((:delayAll __delayAll) 0.0)
    )
   (send-super :init)
   (setq _walk_ctrl __walk_ctrl)
   (setq _delayR (float __delayR))
   (setq _delayL (float __delayL))
   (setq _delayAll (float __delayAll))
   self)
  (:walk_ctrl
   (&optional (__walk_ctrl :null))
   (if (not (eq __walk_ctrl :null)) (setq _walk_ctrl __walk_ctrl)) _walk_ctrl)
  (:delayR
   (&optional __delayR)
   (if __delayR (setq _delayR __delayR)) _delayR)
  (:delayL
   (&optional __delayL)
   (if __delayL (setq _delayL __delayL)) _delayL)
  (:delayAll
   (&optional __delayAll)
   (if __delayAll (setq _delayAll __delayAll)) _delayAll)
  (:serialization-length
   ()
   (+
    ;; bool _walk_ctrl
    1
    ;; float64 _delayR
    8
    ;; float64 _delayL
    8
    ;; float64 _delayAll
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _walk_ctrl
       (if _walk_ctrl (write-byte -1 s) (write-byte 0 s))
     ;; float64 _delayR
       (sys::poke _delayR (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _delayL
       (sys::poke _delayL (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _delayAll
       (sys::poke _delayAll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _walk_ctrl
     (setq _walk_ctrl (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _delayR
     (setq _delayR (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _delayL
     (setq _delayL (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _delayAll
     (setq _delayAll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass movement_msgs::LipCtrlSrvResponse
  :super ros::object
  :slots ())

(defmethod movement_msgs::LipCtrlSrvResponse
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

(defclass movement_msgs::LipCtrlSrv
  :super ros::object
  :slots ())

(setf (get movement_msgs::LipCtrlSrv :md5sum-) "19f7b1da62232e35c765032ea5c2cdaa")
(setf (get movement_msgs::LipCtrlSrv :datatype-) "movement_msgs/LipCtrlSrv")
(setf (get movement_msgs::LipCtrlSrv :request) movement_msgs::LipCtrlSrvRequest)
(setf (get movement_msgs::LipCtrlSrv :response) movement_msgs::LipCtrlSrvResponse)

(defmethod movement_msgs::LipCtrlSrvRequest
  (:response () (instance movement_msgs::LipCtrlSrvResponse :init)))

(setf (get movement_msgs::LipCtrlSrvRequest :md5sum-) "19f7b1da62232e35c765032ea5c2cdaa")
(setf (get movement_msgs::LipCtrlSrvRequest :datatype-) "movement_msgs/LipCtrlSrvRequest")
(setf (get movement_msgs::LipCtrlSrvRequest :definition-)
      "bool    walk_ctrl  #true for walking, false to stop
float64 delayR
float64 delayL
float64 delayAll
---



")

(setf (get movement_msgs::LipCtrlSrvResponse :md5sum-) "19f7b1da62232e35c765032ea5c2cdaa")
(setf (get movement_msgs::LipCtrlSrvResponse :datatype-) "movement_msgs/LipCtrlSrvResponse")
(setf (get movement_msgs::LipCtrlSrvResponse :definition-)
      "bool    walk_ctrl  #true for walking, false to stop
float64 delayR
float64 delayL
float64 delayAll
---



")



(provide :movement_msgs/LipCtrlSrv "19f7b1da62232e35c765032ea5c2cdaa")


