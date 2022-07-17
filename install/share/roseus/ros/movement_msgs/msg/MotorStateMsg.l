;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::MotorStateMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'MotorStateMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::MOTORSTATEMSG")
  (make-package "MOVEMENT_MSGS::MOTORSTATEMSG"))

(in-package "ROS")
;;//! \htmlinclude MotorStateMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass movement_msgs::MotorStateMsg
  :super ros::object
  :slots (_header _temp _error ))

(defmethod movement_msgs::MotorStateMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:temp __temp) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:error __error) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _header __header)
   (setq _temp __temp)
   (setq _error __error)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:temp
   (&optional __temp)
   (if __temp (setq _temp __temp)) _temp)
  (:error
   (&optional __error)
   (if __error (setq _error __error)) _error)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[] _temp
    (* 8    (length _temp)) 4
    ;; int16[] _error
    (* 2    (length _error)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64[] _temp
     (write-long (length _temp) s)
     (dotimes (i (length _temp))
       (sys::poke (elt _temp i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; int16[] _error
     (write-long (length _error) s)
     (dotimes (i (length _error))
       (write-word (elt _error i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64[] _temp
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _temp (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _temp i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; int16[] _error
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _error (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _error i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get movement_msgs::MotorStateMsg :md5sum-) "482b5a95d66b7eabefdb77851294e15c")
(setf (get movement_msgs::MotorStateMsg :datatype-) "movement_msgs/MotorStateMsg")
(setf (get movement_msgs::MotorStateMsg :definition-)
      "Header     header
float64[]  temp
int16[]    error

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :movement_msgs/MotorStateMsg "482b5a95d66b7eabefdb77851294e15c")


