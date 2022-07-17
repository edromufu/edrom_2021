;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::MotorDatasMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'MotorDatasMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::MOTORDATASMSG")
  (make-package "MOVEMENT_MSGS::MOTORDATASMSG"))

(in-package "ROS")
;;//! \htmlinclude MotorDatasMsg.msg.html


(defclass movement_msgs::MotorDatasMsg
  :super ros::object
  :slots (_left_hip_yaw _left_hip_pitch _left_hip_roll _left_knee _left_ankle_pitch _left_ankle_roll _right_hip_yaw _right_hip_pitch _right_hip_roll _right_knee _right_ankle_pitch _right_ankle_roll ))

(defmethod movement_msgs::MotorDatasMsg
  (:init
   (&key
    ((:left_hip_yaw __left_hip_yaw) 0.0)
    ((:left_hip_pitch __left_hip_pitch) 0.0)
    ((:left_hip_roll __left_hip_roll) 0.0)
    ((:left_knee __left_knee) 0.0)
    ((:left_ankle_pitch __left_ankle_pitch) 0.0)
    ((:left_ankle_roll __left_ankle_roll) 0.0)
    ((:right_hip_yaw __right_hip_yaw) 0.0)
    ((:right_hip_pitch __right_hip_pitch) 0.0)
    ((:right_hip_roll __right_hip_roll) 0.0)
    ((:right_knee __right_knee) 0.0)
    ((:right_ankle_pitch __right_ankle_pitch) 0.0)
    ((:right_ankle_roll __right_ankle_roll) 0.0)
    )
   (send-super :init)
   (setq _left_hip_yaw (float __left_hip_yaw))
   (setq _left_hip_pitch (float __left_hip_pitch))
   (setq _left_hip_roll (float __left_hip_roll))
   (setq _left_knee (float __left_knee))
   (setq _left_ankle_pitch (float __left_ankle_pitch))
   (setq _left_ankle_roll (float __left_ankle_roll))
   (setq _right_hip_yaw (float __right_hip_yaw))
   (setq _right_hip_pitch (float __right_hip_pitch))
   (setq _right_hip_roll (float __right_hip_roll))
   (setq _right_knee (float __right_knee))
   (setq _right_ankle_pitch (float __right_ankle_pitch))
   (setq _right_ankle_roll (float __right_ankle_roll))
   self)
  (:left_hip_yaw
   (&optional __left_hip_yaw)
   (if __left_hip_yaw (setq _left_hip_yaw __left_hip_yaw)) _left_hip_yaw)
  (:left_hip_pitch
   (&optional __left_hip_pitch)
   (if __left_hip_pitch (setq _left_hip_pitch __left_hip_pitch)) _left_hip_pitch)
  (:left_hip_roll
   (&optional __left_hip_roll)
   (if __left_hip_roll (setq _left_hip_roll __left_hip_roll)) _left_hip_roll)
  (:left_knee
   (&optional __left_knee)
   (if __left_knee (setq _left_knee __left_knee)) _left_knee)
  (:left_ankle_pitch
   (&optional __left_ankle_pitch)
   (if __left_ankle_pitch (setq _left_ankle_pitch __left_ankle_pitch)) _left_ankle_pitch)
  (:left_ankle_roll
   (&optional __left_ankle_roll)
   (if __left_ankle_roll (setq _left_ankle_roll __left_ankle_roll)) _left_ankle_roll)
  (:right_hip_yaw
   (&optional __right_hip_yaw)
   (if __right_hip_yaw (setq _right_hip_yaw __right_hip_yaw)) _right_hip_yaw)
  (:right_hip_pitch
   (&optional __right_hip_pitch)
   (if __right_hip_pitch (setq _right_hip_pitch __right_hip_pitch)) _right_hip_pitch)
  (:right_hip_roll
   (&optional __right_hip_roll)
   (if __right_hip_roll (setq _right_hip_roll __right_hip_roll)) _right_hip_roll)
  (:right_knee
   (&optional __right_knee)
   (if __right_knee (setq _right_knee __right_knee)) _right_knee)
  (:right_ankle_pitch
   (&optional __right_ankle_pitch)
   (if __right_ankle_pitch (setq _right_ankle_pitch __right_ankle_pitch)) _right_ankle_pitch)
  (:right_ankle_roll
   (&optional __right_ankle_roll)
   (if __right_ankle_roll (setq _right_ankle_roll __right_ankle_roll)) _right_ankle_roll)
  (:serialization-length
   ()
   (+
    ;; float32 _left_hip_yaw
    4
    ;; float32 _left_hip_pitch
    4
    ;; float32 _left_hip_roll
    4
    ;; float32 _left_knee
    4
    ;; float32 _left_ankle_pitch
    4
    ;; float32 _left_ankle_roll
    4
    ;; float32 _right_hip_yaw
    4
    ;; float32 _right_hip_pitch
    4
    ;; float32 _right_hip_roll
    4
    ;; float32 _right_knee
    4
    ;; float32 _right_ankle_pitch
    4
    ;; float32 _right_ankle_roll
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _left_hip_yaw
       (sys::poke _left_hip_yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _left_hip_pitch
       (sys::poke _left_hip_pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _left_hip_roll
       (sys::poke _left_hip_roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _left_knee
       (sys::poke _left_knee (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _left_ankle_pitch
       (sys::poke _left_ankle_pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _left_ankle_roll
       (sys::poke _left_ankle_roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _right_hip_yaw
       (sys::poke _right_hip_yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _right_hip_pitch
       (sys::poke _right_hip_pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _right_hip_roll
       (sys::poke _right_hip_roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _right_knee
       (sys::poke _right_knee (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _right_ankle_pitch
       (sys::poke _right_ankle_pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _right_ankle_roll
       (sys::poke _right_ankle_roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _left_hip_yaw
     (setq _left_hip_yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _left_hip_pitch
     (setq _left_hip_pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _left_hip_roll
     (setq _left_hip_roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _left_knee
     (setq _left_knee (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _left_ankle_pitch
     (setq _left_ankle_pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _left_ankle_roll
     (setq _left_ankle_roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _right_hip_yaw
     (setq _right_hip_yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _right_hip_pitch
     (setq _right_hip_pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _right_hip_roll
     (setq _right_hip_roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _right_knee
     (setq _right_knee (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _right_ankle_pitch
     (setq _right_ankle_pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _right_ankle_roll
     (setq _right_ankle_roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get movement_msgs::MotorDatasMsg :md5sum-) "a20165a6a0e94f4795ab484f0c0e748e")
(setf (get movement_msgs::MotorDatasMsg :datatype-) "movement_msgs/MotorDatasMsg")
(setf (get movement_msgs::MotorDatasMsg :definition-)
      "float32 left_hip_yaw
float32 left_hip_pitch
float32 left_hip_roll
float32 left_knee
float32 left_ankle_pitch
float32 left_ankle_roll
float32 right_hip_yaw
float32 right_hip_pitch
float32 right_hip_roll
float32 right_knee
float32 right_ankle_pitch
float32 right_ankle_roll
")



(provide :movement_msgs/MotorDatasMsg "a20165a6a0e94f4795ab484f0c0e748e")


