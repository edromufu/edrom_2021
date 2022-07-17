;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::HumanoidStateMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'HumanoidStateMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::HUMANOIDSTATEMSG")
  (make-package "MOVEMENT_MSGS::HUMANOIDSTATEMSG"))

(in-package "ROS")
;;//! \htmlinclude HumanoidStateMsg.msg.html


(defclass movement_msgs::HumanoidStateMsg
  :super ros::object
  :slots (_angX _angY _gyroX _gyroY _gyroZ _accX _accY _accZ ))

(defmethod movement_msgs::HumanoidStateMsg
  (:init
   (&key
    ((:angX __angX) 0.0)
    ((:angY __angY) 0.0)
    ((:gyroX __gyroX) 0.0)
    ((:gyroY __gyroY) 0.0)
    ((:gyroZ __gyroZ) 0.0)
    ((:accX __accX) 0.0)
    ((:accY __accY) 0.0)
    ((:accZ __accZ) 0.0)
    )
   (send-super :init)
   (setq _angX (float __angX))
   (setq _angY (float __angY))
   (setq _gyroX (float __gyroX))
   (setq _gyroY (float __gyroY))
   (setq _gyroZ (float __gyroZ))
   (setq _accX (float __accX))
   (setq _accY (float __accY))
   (setq _accZ (float __accZ))
   self)
  (:angX
   (&optional __angX)
   (if __angX (setq _angX __angX)) _angX)
  (:angY
   (&optional __angY)
   (if __angY (setq _angY __angY)) _angY)
  (:gyroX
   (&optional __gyroX)
   (if __gyroX (setq _gyroX __gyroX)) _gyroX)
  (:gyroY
   (&optional __gyroY)
   (if __gyroY (setq _gyroY __gyroY)) _gyroY)
  (:gyroZ
   (&optional __gyroZ)
   (if __gyroZ (setq _gyroZ __gyroZ)) _gyroZ)
  (:accX
   (&optional __accX)
   (if __accX (setq _accX __accX)) _accX)
  (:accY
   (&optional __accY)
   (if __accY (setq _accY __accY)) _accY)
  (:accZ
   (&optional __accZ)
   (if __accZ (setq _accZ __accZ)) _accZ)
  (:serialization-length
   ()
   (+
    ;; float64 _angX
    8
    ;; float64 _angY
    8
    ;; float64 _gyroX
    8
    ;; float64 _gyroY
    8
    ;; float64 _gyroZ
    8
    ;; float64 _accX
    8
    ;; float64 _accY
    8
    ;; float64 _accZ
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _angX
       (sys::poke _angX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angY
       (sys::poke _angY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _gyroX
       (sys::poke _gyroX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _gyroY
       (sys::poke _gyroY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _gyroZ
       (sys::poke _gyroZ (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _accX
       (sys::poke _accX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _accY
       (sys::poke _accY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _accZ
       (sys::poke _accZ (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _angX
     (setq _angX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angY
     (setq _angY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _gyroX
     (setq _gyroX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _gyroY
     (setq _gyroY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _gyroZ
     (setq _gyroZ (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _accX
     (setq _accX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _accY
     (setq _accY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _accZ
     (setq _accZ (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get movement_msgs::HumanoidStateMsg :md5sum-) "7110852ac7d0bacf26e5ea1ead1abb25")
(setf (get movement_msgs::HumanoidStateMsg :datatype-) "movement_msgs/HumanoidStateMsg")
(setf (get movement_msgs::HumanoidStateMsg :definition-)
      "float64 angX
float64 angY

float64 gyroX
float64 gyroY
float64 gyroZ

float64 accX
float64 accY
float64 accZ

")



(provide :movement_msgs/HumanoidStateMsg "7110852ac7d0bacf26e5ea1ead1abb25")


