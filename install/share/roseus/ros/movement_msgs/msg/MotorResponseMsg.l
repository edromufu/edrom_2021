;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::MotorResponseMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'MotorResponseMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::MOTORRESPONSEMSG")
  (make-package "MOVEMENT_MSGS::MOTORRESPONSEMSG"))

(in-package "ROS")
;;//! \htmlinclude MotorResponseMsg.msg.html


(defclass movement_msgs::MotorResponseMsg
  :super ros::object
  :slots (_status _data ))

(defmethod movement_msgs::MotorResponseMsg
  (:init
   (&key
    ((:status __status) "")
    ((:data __data) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _status (string __status))
   (setq _data __data)
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; string _status
    4 (length _status)
    ;; float64[] _data
    (* 8    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _status
       (write-long (length _status) s) (princ _status s)
     ;; float64[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (sys::poke (elt _data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get movement_msgs::MotorResponseMsg :md5sum-) "cf3eb345b69e8eb3ee3ea3e7ea26e807")
(setf (get movement_msgs::MotorResponseMsg :datatype-) "movement_msgs/MotorResponseMsg")
(setf (get movement_msgs::MotorResponseMsg :definition-)
      "string status
float64[] data

")



(provide :movement_msgs/MotorResponseMsg "cf3eb345b69e8eb3ee3ea3e7ea26e807")


