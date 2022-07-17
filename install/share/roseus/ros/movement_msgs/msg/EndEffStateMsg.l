;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::EndEffStateMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'EndEffStateMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::ENDEFFSTATEMSG")
  (make-package "MOVEMENT_MSGS::ENDEFFSTATEMSG"))

(in-package "ROS")
;;//! \htmlinclude EndEffStateMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass movement_msgs::EndEffStateMsg
  :super ros::object
  :slots (_header _endEff ))

(defmethod movement_msgs::EndEffStateMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:endEff __endEff) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _endEff __endEff)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:endEff
   (&rest __endEff)
   (if (keywordp (car __endEff))
       (send* _endEff __endEff)
     (progn
       (if __endEff (setq _endEff (car __endEff)))
       _endEff)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; movement_msgs/EndEffMsg[] _endEff
    (apply #'+ (send-all _endEff :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; movement_msgs/EndEffMsg[] _endEff
     (write-long (length _endEff) s)
     (dolist (elem _endEff)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; movement_msgs/EndEffMsg[] _endEff
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _endEff (let (r) (dotimes (i n) (push (instance movement_msgs::EndEffMsg :init) r)) r))
     (dolist (elem- _endEff)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get movement_msgs::EndEffStateMsg :md5sum-) "62edf4d89ed16d8d1d54b58ace855e91")
(setf (get movement_msgs::EndEffStateMsg :datatype-) "movement_msgs/EndEffStateMsg")
(setf (get movement_msgs::EndEffStateMsg :definition-)
      "Header                     header
movement_msgs/EndEffMsg[]  endEff

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

================================================================================
MSG: movement_msgs/EndEffMsg
geometry_msgs/Point  pos
geometry_msgs/Point  vel
geometry_msgs/Point  acc
geometry_msgs/Point  rot
int32                type
int32                flag
float64              dt

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :movement_msgs/EndEffStateMsg "62edf4d89ed16d8d1d54b58ace855e91")


