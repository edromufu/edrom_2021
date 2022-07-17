;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::MovementStatesSrv)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'MovementStatesSrv (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::MOVEMENTSTATESSRV")
  (make-package "MOVEMENT_MSGS::MOVEMENTSTATESSRV"))
(unless (find-package "MOVEMENT_MSGS::MOVEMENTSTATESSRVREQUEST")
  (make-package "MOVEMENT_MSGS::MOVEMENTSTATESSRVREQUEST"))
(unless (find-package "MOVEMENT_MSGS::MOVEMENTSTATESSRVRESPONSE")
  (make-package "MOVEMENT_MSGS::MOVEMENTSTATESSRVRESPONSE"))

(in-package "ROS")





(defclass movement_msgs::MovementStatesSrvRequest
  :super ros::object
  :slots (_state ))

(defmethod movement_msgs::MovementStatesSrvRequest
  (:init
   (&key
    ((:state __state) "")
    )
   (send-super :init)
   (setq _state (string __state))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; string _state
    4 (length _state)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _state
       (write-long (length _state) s) (princ _state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _state
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _state (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass movement_msgs::MovementStatesSrvResponse
  :super ros::object
  :slots (_status ))

(defmethod movement_msgs::MovementStatesSrvResponse
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

(defclass movement_msgs::MovementStatesSrv
  :super ros::object
  :slots ())

(setf (get movement_msgs::MovementStatesSrv :md5sum-) "745fac47da8f3252744504f4a4bc2fe8")
(setf (get movement_msgs::MovementStatesSrv :datatype-) "movement_msgs/MovementStatesSrv")
(setf (get movement_msgs::MovementStatesSrv :request) movement_msgs::MovementStatesSrvRequest)
(setf (get movement_msgs::MovementStatesSrv :response) movement_msgs::MovementStatesSrvResponse)

(defmethod movement_msgs::MovementStatesSrvRequest
  (:response () (instance movement_msgs::MovementStatesSrvResponse :init)))

(setf (get movement_msgs::MovementStatesSrvRequest :md5sum-) "745fac47da8f3252744504f4a4bc2fe8")
(setf (get movement_msgs::MovementStatesSrvRequest :datatype-) "movement_msgs/MovementStatesSrvRequest")
(setf (get movement_msgs::MovementStatesSrvRequest :definition-)
      "string state
---
bool status
")

(setf (get movement_msgs::MovementStatesSrvResponse :md5sum-) "745fac47da8f3252744504f4a4bc2fe8")
(setf (get movement_msgs::MovementStatesSrvResponse :datatype-) "movement_msgs/MovementStatesSrvResponse")
(setf (get movement_msgs::MovementStatesSrvResponse :definition-)
      "string state
---
bool status
")



(provide :movement_msgs/MovementStatesSrv "745fac47da8f3252744504f4a4bc2fe8")


