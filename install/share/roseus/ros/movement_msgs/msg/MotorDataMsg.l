;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::MotorDataMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'MotorDataMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::MOTORDATAMSG")
  (make-package "MOVEMENT_MSGS::MOTORDATAMSG"))

(in-package "ROS")
;;//! \htmlinclude MotorDataMsg.msg.html


(defclass movement_msgs::MotorDataMsg
  :super ros::object
  :slots (_source _command _data _vel ))

(defmethod movement_msgs::MotorDataMsg
  (:init
   (&key
    ((:source __source) "")
    ((:command __command) "")
    ((:data __data) (make-array 21 :initial-element 0.0 :element-type :float))
    ((:vel __vel) (make-array 21 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _source (string __source))
   (setq _command (string __command))
   (setq _data __data)
   (setq _vel __vel)
   self)
  (:source
   (&optional __source)
   (if __source (setq _source __source)) _source)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:vel
   (&optional __vel)
   (if __vel (setq _vel __vel)) _vel)
  (:serialization-length
   ()
   (+
    ;; string _source
    4 (length _source)
    ;; string _command
    4 (length _command)
    ;; float64[21] _data
    (* 8    21)
    ;; float64[21] _vel
    (* 8    21)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _source
       (write-long (length _source) s) (princ _source s)
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;; float64[21] _data
     (dotimes (i 21)
       (sys::poke (elt _data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[21] _vel
     (dotimes (i 21)
       (sys::poke (elt _vel i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _source
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _source (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64[21] _data
   (dotimes (i (length _data))
     (setf (elt _data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[21] _vel
   (dotimes (i (length _vel))
     (setf (elt _vel i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(setf (get movement_msgs::MotorDataMsg :md5sum-) "6feb0c31507e3a5a74f2b1241e9d5301")
(setf (get movement_msgs::MotorDataMsg :datatype-) "movement_msgs/MotorDataMsg")
(setf (get movement_msgs::MotorDataMsg :definition-)
      "string source
string command
float64[21] data
float64[21] vel



")



(provide :movement_msgs/MotorDataMsg "6feb0c31507e3a5a74f2b1241e9d5301")


