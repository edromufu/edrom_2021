;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::WebotsMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'WebotsMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::WEBOTSMSG")
  (make-package "MOVEMENT_MSGS::WEBOTSMSG"))

(in-package "ROS")
;;//! \htmlinclude WebotsMsg.msg.html


(defclass movement_msgs::WebotsMsg
  :super ros::object
  :slots (_position _velocity _control _motor_name ))

(defmethod movement_msgs::WebotsMsg
  (:init
   (&key
    ((:position __position) (make-array 20 :initial-element 0.0 :element-type :float))
    ((:velocity __velocity) (make-array 20 :initial-element 0.0 :element-type :float))
    ((:control __control) "")
    ((:motor_name __motor_name) (let (r) (dotimes (i 20) (push "" r)) r))
    )
   (send-super :init)
   (setq _position __position)
   (setq _velocity __velocity)
   (setq _control (string __control))
   (setq _motor_name __motor_name)
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:control
   (&optional __control)
   (if __control (setq _control __control)) _control)
  (:motor_name
   (&optional __motor_name)
   (if __motor_name (setq _motor_name __motor_name)) _motor_name)
  (:serialization-length
   ()
   (+
    ;; float64[20] _position
    (* 8    20)
    ;; float64[20] _velocity
    (* 8    20)
    ;; string _control
    4 (length _control)
    ;; string[20] _motor_name
    (apply #'+ 4 (length _motor_name)    20)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[20] _position
     (dotimes (i 20)
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[20] _velocity
     (dotimes (i 20)
       (sys::poke (elt _velocity i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; string _control
       (write-long (length _control) s) (princ _control s)
     ;; string[20] _motor_name
     (write-long (length _motor_name) s)
     (dolist (elem _motor_name)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[20] _position
   (dotimes (i (length _position))
     (setf (elt _position i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[20] _velocity
   (dotimes (i (length _velocity))
     (setf (elt _velocity i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; string _control
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _control (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string[20] _motor_name
   (dotimes (i (length _motor_name))
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _motor_name i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     )
   ;;
   self)
  )

(setf (get movement_msgs::WebotsMsg :md5sum-) "954ba293d4cc5b7067f7a1e881d6f143")
(setf (get movement_msgs::WebotsMsg :datatype-) "movement_msgs/WebotsMsg")
(setf (get movement_msgs::WebotsMsg :definition-)
      "float64[20] position
float64[20] velocity
string control
string[20] motor_name

")



(provide :movement_msgs/WebotsMsg "954ba293d4cc5b7067f7a1e881d6f143")


