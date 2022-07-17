;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::MotorPIDMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'MotorPIDMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::MOTORPIDMSG")
  (make-package "MOVEMENT_MSGS::MOTORPIDMSG"))

(in-package "ROS")
;;//! \htmlinclude MotorPIDMsg.msg.html


(defclass movement_msgs::MotorPIDMsg
  :super ros::object
  :slots (_kp _ki _kd ))

(defmethod movement_msgs::MotorPIDMsg
  (:init
   (&key
    ((:kp __kp) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:ki __ki) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:kd __kd) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _kp __kp)
   (setq _ki __ki)
   (setq _kd __kd)
   self)
  (:kp
   (&optional __kp)
   (if __kp (setq _kp __kp)) _kp)
  (:ki
   (&optional __ki)
   (if __ki (setq _ki __ki)) _ki)
  (:kd
   (&optional __kd)
   (if __kd (setq _kd __kd)) _kd)
  (:serialization-length
   ()
   (+
    ;; float64[] _kp
    (* 8    (length _kp)) 4
    ;; float64[] _ki
    (* 8    (length _ki)) 4
    ;; float64[] _kd
    (* 8    (length _kd)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _kp
     (write-long (length _kp) s)
     (dotimes (i (length _kp))
       (sys::poke (elt _kp i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _ki
     (write-long (length _ki) s)
     (dotimes (i (length _ki))
       (sys::poke (elt _ki i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _kd
     (write-long (length _kd) s)
     (dotimes (i (length _kd))
       (sys::poke (elt _kd i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _kp
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _kp (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _kp i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _ki
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ki (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _ki i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _kd
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _kd (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _kd i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get movement_msgs::MotorPIDMsg :md5sum-) "4792326033ccf840aaf0bded51af3ebe")
(setf (get movement_msgs::MotorPIDMsg :datatype-) "movement_msgs/MotorPIDMsg")
(setf (get movement_msgs::MotorPIDMsg :definition-)
      "float64[]       kp
float64[]       ki
float64[]       kd



")



(provide :movement_msgs/MotorPIDMsg "4792326033ccf840aaf0bded51af3ebe")


