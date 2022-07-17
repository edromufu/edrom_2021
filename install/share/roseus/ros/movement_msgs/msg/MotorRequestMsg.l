;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::MotorRequestMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'MotorRequestMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::MOTORREQUESTMSG")
  (make-package "MOVEMENT_MSGS::MOTORREQUESTMSG"))

(in-package "ROS")
;;//! \htmlinclude MotorRequestMsg.msg.html


(defclass movement_msgs::MotorRequestMsg
  :super ros::object
  :slots (_source _writeCommand _data _velocity _readCommand ))

(defmethod movement_msgs::MotorRequestMsg
  (:init
   (&key
    ((:source __source) "")
    ((:writeCommand __writeCommand) "")
    ((:data __data) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:velocity __velocity) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:readCommand __readCommand) "")
    )
   (send-super :init)
   (setq _source (string __source))
   (setq _writeCommand (string __writeCommand))
   (setq _data __data)
   (setq _velocity __velocity)
   (setq _readCommand (string __readCommand))
   self)
  (:source
   (&optional __source)
   (if __source (setq _source __source)) _source)
  (:writeCommand
   (&optional __writeCommand)
   (if __writeCommand (setq _writeCommand __writeCommand)) _writeCommand)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:readCommand
   (&optional __readCommand)
   (if __readCommand (setq _readCommand __readCommand)) _readCommand)
  (:serialization-length
   ()
   (+
    ;; string _source
    4 (length _source)
    ;; string _writeCommand
    4 (length _writeCommand)
    ;; float64[] _data
    (* 8    (length _data)) 4
    ;; float64[] _velocity
    (* 8    (length _velocity)) 4
    ;; string _readCommand
    4 (length _readCommand)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _source
       (write-long (length _source) s) (princ _source s)
     ;; string _writeCommand
       (write-long (length _writeCommand) s) (princ _writeCommand s)
     ;; float64[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (sys::poke (elt _data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _velocity
     (write-long (length _velocity) s)
     (dotimes (i (length _velocity))
       (sys::poke (elt _velocity i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; string _readCommand
       (write-long (length _readCommand) s) (princ _readCommand s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _source
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _source (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _writeCommand
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _writeCommand (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _velocity
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _velocity (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _velocity i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; string _readCommand
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _readCommand (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get movement_msgs::MotorRequestMsg :md5sum-) "298878b70cf41c7555ec4b3aacf8d255")
(setf (get movement_msgs::MotorRequestMsg :datatype-) "movement_msgs/MotorRequestMsg")
(setf (get movement_msgs::MotorRequestMsg :definition-)
      "string source
string writeCommand
float64[] data
float64[] velocity
string readCommand


")



(provide :movement_msgs/MotorRequestMsg "298878b70cf41c7555ec4b3aacf8d255")


