;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::LoadMapConfigsSrv)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'LoadMapConfigsSrv (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::LOADMAPCONFIGSSRV")
  (make-package "MOVEMENT_MSGS::LOADMAPCONFIGSSRV"))
(unless (find-package "MOVEMENT_MSGS::LOADMAPCONFIGSSRVREQUEST")
  (make-package "MOVEMENT_MSGS::LOADMAPCONFIGSSRVREQUEST"))
(unless (find-package "MOVEMENT_MSGS::LOADMAPCONFIGSSRVRESPONSE")
  (make-package "MOVEMENT_MSGS::LOADMAPCONFIGSSRVRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass movement_msgs::LoadMapConfigsSrvRequest
  :super ros::object
  :slots (_header _fEnum _fRobot _fUrdf _fIk _update ))

(defmethod movement_msgs::LoadMapConfigsSrvRequest
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:fEnum __fEnum) "")
    ((:fRobot __fRobot) "")
    ((:fUrdf __fUrdf) "")
    ((:fIk __fIk) "")
    ((:update __update) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _fEnum (string __fEnum))
   (setq _fRobot (string __fRobot))
   (setq _fUrdf (string __fUrdf))
   (setq _fIk (string __fIk))
   (setq _update __update)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:fEnum
   (&optional __fEnum)
   (if __fEnum (setq _fEnum __fEnum)) _fEnum)
  (:fRobot
   (&optional __fRobot)
   (if __fRobot (setq _fRobot __fRobot)) _fRobot)
  (:fUrdf
   (&optional __fUrdf)
   (if __fUrdf (setq _fUrdf __fUrdf)) _fUrdf)
  (:fIk
   (&optional __fIk)
   (if __fIk (setq _fIk __fIk)) _fIk)
  (:update
   (&optional (__update :null))
   (if (not (eq __update :null)) (setq _update __update)) _update)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _fEnum
    4 (length _fEnum)
    ;; string _fRobot
    4 (length _fRobot)
    ;; string _fUrdf
    4 (length _fUrdf)
    ;; string _fIk
    4 (length _fIk)
    ;; bool _update
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _fEnum
       (write-long (length _fEnum) s) (princ _fEnum s)
     ;; string _fRobot
       (write-long (length _fRobot) s) (princ _fRobot s)
     ;; string _fUrdf
       (write-long (length _fUrdf) s) (princ _fUrdf s)
     ;; string _fIk
       (write-long (length _fIk) s) (princ _fIk s)
     ;; bool _update
       (if _update (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _fEnum
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _fEnum (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _fRobot
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _fRobot (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _fUrdf
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _fUrdf (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _fIk
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _fIk (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _update
     (setq _update (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass movement_msgs::LoadMapConfigsSrvResponse
  :super ros::object
  :slots (_idMap ))

(defmethod movement_msgs::LoadMapConfigsSrvResponse
  (:init
   (&key
    ((:idMap __idMap) (instance movement_msgs::IDMapMsg :init))
    )
   (send-super :init)
   (setq _idMap __idMap)
   self)
  (:idMap
   (&rest __idMap)
   (if (keywordp (car __idMap))
       (send* _idMap __idMap)
     (progn
       (if __idMap (setq _idMap (car __idMap)))
       _idMap)))
  (:serialization-length
   ()
   (+
    ;; movement_msgs/IDMapMsg _idMap
    (send _idMap :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; movement_msgs/IDMapMsg _idMap
       (send _idMap :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; movement_msgs/IDMapMsg _idMap
     (send _idMap :deserialize buf ptr-) (incf ptr- (send _idMap :serialization-length))
   ;;
   self)
  )

(defclass movement_msgs::LoadMapConfigsSrv
  :super ros::object
  :slots ())

(setf (get movement_msgs::LoadMapConfigsSrv :md5sum-) "90c8e8e79a383c29a071f7abd2119ce5")
(setf (get movement_msgs::LoadMapConfigsSrv :datatype-) "movement_msgs/LoadMapConfigsSrv")
(setf (get movement_msgs::LoadMapConfigsSrv :request) movement_msgs::LoadMapConfigsSrvRequest)
(setf (get movement_msgs::LoadMapConfigsSrv :response) movement_msgs::LoadMapConfigsSrvResponse)

(defmethod movement_msgs::LoadMapConfigsSrvRequest
  (:response () (instance movement_msgs::LoadMapConfigsSrvResponse :init)))

(setf (get movement_msgs::LoadMapConfigsSrvRequest :md5sum-) "90c8e8e79a383c29a071f7abd2119ce5")
(setf (get movement_msgs::LoadMapConfigsSrvRequest :datatype-) "movement_msgs/LoadMapConfigsSrvRequest")
(setf (get movement_msgs::LoadMapConfigsSrvRequest :definition-)
      "Header header
string fEnum
string fRobot
string fUrdf
string fIk
bool   update



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
---

movement_msgs/IDMapMsg  idMap



================================================================================
MSG: movement_msgs/IDMapMsg
Header                    header
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
")

(setf (get movement_msgs::LoadMapConfigsSrvResponse :md5sum-) "90c8e8e79a383c29a071f7abd2119ce5")
(setf (get movement_msgs::LoadMapConfigsSrvResponse :datatype-) "movement_msgs/LoadMapConfigsSrvResponse")
(setf (get movement_msgs::LoadMapConfigsSrvResponse :definition-)
      "Header header
string fEnum
string fRobot
string fUrdf
string fIk
bool   update



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
---

movement_msgs/IDMapMsg  idMap



================================================================================
MSG: movement_msgs/IDMapMsg
Header                    header
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
")



(provide :movement_msgs/LoadMapConfigsSrv "90c8e8e79a383c29a071f7abd2119ce5")


