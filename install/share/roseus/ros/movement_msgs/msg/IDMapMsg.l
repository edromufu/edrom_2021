;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::IDMapMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'IDMapMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::IDMAPMSG")
  (make-package "MOVEMENT_MSGS::IDMAPMSG"))

(in-package "ROS")
;;//! \htmlinclude IDMapMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass movement_msgs::IDMapMsg
  :super ros::object
  :slots (_header _map _jNames _robotDOF _urdfDOF _ikDOF ))

(defmethod movement_msgs::IDMapMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:map __map) (instance std_msgs::Int32MultiArray :init))
    ((:jNames __jNames) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:robotDOF __robotDOF) 0)
    ((:urdfDOF __urdfDOF) 0)
    ((:ikDOF __ikDOF) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _map __map)
   (setq _jNames __jNames)
   (setq _robotDOF (round __robotDOF))
   (setq _urdfDOF (round __urdfDOF))
   (setq _ikDOF (round __ikDOF))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:map
   (&rest __map)
   (if (keywordp (car __map))
       (send* _map __map)
     (progn
       (if __map (setq _map (car __map)))
       _map)))
  (:jNames
   (&optional __jNames)
   (if __jNames (setq _jNames __jNames)) _jNames)
  (:robotDOF
   (&optional __robotDOF)
   (if __robotDOF (setq _robotDOF __robotDOF)) _robotDOF)
  (:urdfDOF
   (&optional __urdfDOF)
   (if __urdfDOF (setq _urdfDOF __urdfDOF)) _urdfDOF)
  (:ikDOF
   (&optional __ikDOF)
   (if __ikDOF (setq _ikDOF __ikDOF)) _ikDOF)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; std_msgs/Int32MultiArray _map
    (send _map :serialization-length)
    ;; string[] _jNames
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _jNames)) 4
    ;; int32 _robotDOF
    4
    ;; int32 _urdfDOF
    4
    ;; int32 _ikDOF
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; std_msgs/Int32MultiArray _map
       (send _map :serialize s)
     ;; string[] _jNames
     (write-long (length _jNames) s)
     (dolist (elem _jNames)
       (write-long (length elem) s) (princ elem s)
       )
     ;; int32 _robotDOF
       (write-long _robotDOF s)
     ;; int32 _urdfDOF
       (write-long _urdfDOF s)
     ;; int32 _ikDOF
       (write-long _ikDOF s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; std_msgs/Int32MultiArray _map
     (send _map :deserialize buf ptr-) (incf ptr- (send _map :serialization-length))
   ;; string[] _jNames
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _jNames (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _jNames i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; int32 _robotDOF
     (setq _robotDOF (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _urdfDOF
     (setq _urdfDOF (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _ikDOF
     (setq _ikDOF (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get movement_msgs::IDMapMsg :md5sum-) "1d05c13180a22938616df56def75e013")
(setf (get movement_msgs::IDMapMsg :datatype-) "movement_msgs/IDMapMsg")
(setf (get movement_msgs::IDMapMsg :definition-)
      "Header                    header
std_msgs/Int32MultiArray  map
string[]                  jNames
int32                     robotDOF
int32                     urdfDOF
int32                     ikDOF



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
MSG: std_msgs/Int32MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
int32[]           data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
uint32 stride  # stride of given dimension
")



(provide :movement_msgs/IDMapMsg "1d05c13180a22938616df56def75e013")


