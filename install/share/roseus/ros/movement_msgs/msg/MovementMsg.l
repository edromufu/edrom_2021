;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::MovementMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'MovementMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::MOVEMENTMSG")
  (make-package "MOVEMENT_MSGS::MOVEMENTMSG"))

(in-package "ROS")
;;//! \htmlinclude MovementMsg.msg.html


(defclass movement_msgs::MovementMsg
  :super ros::object
  :slots (_xHead _yHead _roll _pitch _yaw ))

(defmethod movement_msgs::MovementMsg
  (:init
   (&key
    ((:xHead __xHead) 0.0)
    ((:yHead __yHead) 0.0)
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    )
   (send-super :init)
   (setq _xHead (float __xHead))
   (setq _yHead (float __yHead))
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   self)
  (:xHead
   (&optional __xHead)
   (if __xHead (setq _xHead __xHead)) _xHead)
  (:yHead
   (&optional __yHead)
   (if __yHead (setq _yHead __yHead)) _yHead)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; float64 _xHead
    8
    ;; float64 _yHead
    8
    ;; float64 _roll
    8
    ;; float64 _pitch
    8
    ;; float64 _yaw
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _xHead
       (sys::poke _xHead (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yHead
       (sys::poke _yHead (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _xHead
     (setq _xHead (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yHead
     (setq _yHead (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get movement_msgs::MovementMsg :md5sum-) "1f55457e70c178e855a6ca79758abeb7")
(setf (get movement_msgs::MovementMsg :datatype-) "movement_msgs/MovementMsg")
(setf (get movement_msgs::MovementMsg :definition-)
      "float64 xHead
float64 yHead
float64 roll
float64 pitch
float64 yaw

")



(provide :movement_msgs/MovementMsg "1f55457e70c178e855a6ca79758abeb7")


