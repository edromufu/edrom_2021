;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::WalkingMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'WalkingMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::WALKINGMSG")
  (make-package "MOVEMENT_MSGS::WALKINGMSG"))

(in-package "ROS")
;;//! \htmlinclude WalkingMsg.msg.html


(defclass movement_msgs::WalkingMsg
  :super ros::object
  :slots (_go _vx _vy _vz ))

(defmethod movement_msgs::WalkingMsg
  (:init
   (&key
    ((:go __go) 0)
    ((:vx __vx) 0.0)
    ((:vy __vy) 0.0)
    ((:vz __vz) 0.0)
    )
   (send-super :init)
   (setq _go (round __go))
   (setq _vx (float __vx))
   (setq _vy (float __vy))
   (setq _vz (float __vz))
   self)
  (:go
   (&optional __go)
   (if __go (setq _go __go)) _go)
  (:vx
   (&optional __vx)
   (if __vx (setq _vx __vx)) _vx)
  (:vy
   (&optional __vy)
   (if __vy (setq _vy __vy)) _vy)
  (:vz
   (&optional __vz)
   (if __vz (setq _vz __vz)) _vz)
  (:serialization-length
   ()
   (+
    ;; int32 _go
    4
    ;; float64 _vx
    8
    ;; float64 _vy
    8
    ;; float64 _vz
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _go
       (write-long _go s)
     ;; float64 _vx
       (sys::poke _vx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vy
       (sys::poke _vy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vz
       (sys::poke _vz (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _go
     (setq _go (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _vx
     (setq _vx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vy
     (setq _vy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vz
     (setq _vz (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get movement_msgs::WalkingMsg :md5sum-) "a31409d81cc4c450d46abeca782221de")
(setf (get movement_msgs::WalkingMsg :datatype-) "movement_msgs/WalkingMsg")
(setf (get movement_msgs::WalkingMsg :definition-)
      "int32       go
float64     vx
float64     vy
float64     vz


")



(provide :movement_msgs/WalkingMsg "a31409d81cc4c450d46abeca782221de")


