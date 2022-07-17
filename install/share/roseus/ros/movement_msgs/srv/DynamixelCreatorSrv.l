;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::DynamixelCreatorSrv)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'DynamixelCreatorSrv (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::DYNAMIXELCREATORSRV")
  (make-package "MOVEMENT_MSGS::DYNAMIXELCREATORSRV"))
(unless (find-package "MOVEMENT_MSGS::DYNAMIXELCREATORSRVREQUEST")
  (make-package "MOVEMENT_MSGS::DYNAMIXELCREATORSRVREQUEST"))
(unless (find-package "MOVEMENT_MSGS::DYNAMIXELCREATORSRVRESPONSE")
  (make-package "MOVEMENT_MSGS::DYNAMIXELCREATORSRVRESPONSE"))

(in-package "ROS")





(defclass movement_msgs::DynamixelCreatorSrvRequest
  :super ros::object
  :slots (_torque _wish ))

(defmethod movement_msgs::DynamixelCreatorSrvRequest
  (:init
   (&key
    ((:torque __torque) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:wish __wish) "")
    )
   (send-super :init)
   (setq _torque __torque)
   (setq _wish (string __wish))
   self)
  (:torque
   (&optional __torque)
   (if __torque (setq _torque __torque)) _torque)
  (:wish
   (&optional __wish)
   (if __wish (setq _wish __wish)) _wish)
  (:serialization-length
   ()
   (+
    ;; bool[] _torque
    (* 1    (length _torque)) 4
    ;; string _wish
    4 (length _wish)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool[] _torque
     (write-long (length _torque) s)
     (dotimes (i (length _torque))
       (if (elt _torque i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; string _wish
       (write-long (length _wish) s) (princ _wish s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool[] _torque
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _torque (make-list n))
     (dotimes (i n)
     (setf (elt _torque i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; string _wish
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _wish (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass movement_msgs::DynamixelCreatorSrvResponse
  :super ros::object
  :slots (_feedbackPosition _feedbackTorque _feedbackVcc ))

(defmethod movement_msgs::DynamixelCreatorSrvResponse
  (:init
   (&key
    ((:feedbackPosition __feedbackPosition) (make-array 20 :initial-element 0.0 :element-type :float))
    ((:feedbackTorque __feedbackTorque) (let (r) (dotimes (i 20) (push nil r)) r))
    ((:feedbackVcc __feedbackVcc) (make-array 20 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _feedbackPosition __feedbackPosition)
   (setq _feedbackTorque __feedbackTorque)
   (setq _feedbackVcc __feedbackVcc)
   self)
  (:feedbackPosition
   (&optional __feedbackPosition)
   (if __feedbackPosition (setq _feedbackPosition __feedbackPosition)) _feedbackPosition)
  (:feedbackTorque
   (&optional __feedbackTorque)
   (if __feedbackTorque (setq _feedbackTorque __feedbackTorque)) _feedbackTorque)
  (:feedbackVcc
   (&optional __feedbackVcc)
   (if __feedbackVcc (setq _feedbackVcc __feedbackVcc)) _feedbackVcc)
  (:serialization-length
   ()
   (+
    ;; float64[20] _feedbackPosition
    (* 8    20)
    ;; bool[20] _feedbackTorque
    (* 1    20)
    ;; float64[20] _feedbackVcc
    (* 8    20)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[20] _feedbackPosition
     (dotimes (i 20)
       (sys::poke (elt _feedbackPosition i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; bool[20] _feedbackTorque
     (dotimes (i 20)
       (if (elt _feedbackTorque i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; float64[20] _feedbackVcc
     (dotimes (i 20)
       (sys::poke (elt _feedbackVcc i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[20] _feedbackPosition
   (dotimes (i (length _feedbackPosition))
     (setf (elt _feedbackPosition i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; bool[20] _feedbackTorque
   (dotimes (i (length _feedbackTorque))
     (setf (elt _feedbackTorque i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     )
   ;; float64[20] _feedbackVcc
   (dotimes (i (length _feedbackVcc))
     (setf (elt _feedbackVcc i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(defclass movement_msgs::DynamixelCreatorSrv
  :super ros::object
  :slots ())

(setf (get movement_msgs::DynamixelCreatorSrv :md5sum-) "afc4a102e69ac104a3346382d7f6e9b9")
(setf (get movement_msgs::DynamixelCreatorSrv :datatype-) "movement_msgs/DynamixelCreatorSrv")
(setf (get movement_msgs::DynamixelCreatorSrv :request) movement_msgs::DynamixelCreatorSrvRequest)
(setf (get movement_msgs::DynamixelCreatorSrv :response) movement_msgs::DynamixelCreatorSrvResponse)

(defmethod movement_msgs::DynamixelCreatorSrvRequest
  (:response () (instance movement_msgs::DynamixelCreatorSrvResponse :init)))

(setf (get movement_msgs::DynamixelCreatorSrvRequest :md5sum-) "afc4a102e69ac104a3346382d7f6e9b9")
(setf (get movement_msgs::DynamixelCreatorSrvRequest :datatype-) "movement_msgs/DynamixelCreatorSrvRequest")
(setf (get movement_msgs::DynamixelCreatorSrvRequest :definition-)
      "bool[] torque
string wish 

---
float64[20] feedbackPosition
bool[20] feedbackTorque
float64[20] feedbackVcc

")

(setf (get movement_msgs::DynamixelCreatorSrvResponse :md5sum-) "afc4a102e69ac104a3346382d7f6e9b9")
(setf (get movement_msgs::DynamixelCreatorSrvResponse :datatype-) "movement_msgs/DynamixelCreatorSrvResponse")
(setf (get movement_msgs::DynamixelCreatorSrvResponse :definition-)
      "bool[] torque
string wish 

---
float64[20] feedbackPosition
bool[20] feedbackTorque
float64[20] feedbackVcc

")



(provide :movement_msgs/DynamixelCreatorSrv "afc4a102e69ac104a3346382d7f6e9b9")


