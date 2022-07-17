;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::FFTMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'FFTMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::FFTMSG")
  (make-package "MOVEMENT_MSGS::FFTMSG"))

(in-package "ROS")
;;//! \htmlinclude FFTMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass movement_msgs::FFTMsg
  :super ros::object
  :slots (_header _mean _bins _df ))

(defmethod movement_msgs::FFTMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:mean __mean) 0.0)
    ((:bins __bins) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:df __df) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _mean (float __mean))
   (setq _bins __bins)
   (setq _df (float __df))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:mean
   (&optional __mean)
   (if __mean (setq _mean __mean)) _mean)
  (:bins
   (&optional __bins)
   (if __bins (setq _bins __bins)) _bins)
  (:df
   (&optional __df)
   (if __df (setq _df __df)) _df)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _mean
    8
    ;; float64[] _bins
    (* 8    (length _bins)) 4
    ;; float64 _df
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _mean
       (sys::poke _mean (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[] _bins
     (write-long (length _bins) s)
     (dotimes (i (length _bins))
       (sys::poke (elt _bins i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _df
       (sys::poke _df (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _mean
     (setq _mean (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[] _bins
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _bins (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _bins i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64 _df
     (setq _df (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get movement_msgs::FFTMsg :md5sum-) "920b50939e8ceb599da8e34c404bba26")
(setf (get movement_msgs::FFTMsg :datatype-) "movement_msgs/FFTMsg")
(setf (get movement_msgs::FFTMsg :definition-)
      "Header  header
float64 mean
float64[] bins
float64 df

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



(provide :movement_msgs/FFTMsg "920b50939e8ceb599da8e34c404bba26")


