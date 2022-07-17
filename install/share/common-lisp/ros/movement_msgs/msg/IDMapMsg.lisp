; Auto-generated. Do not edit!


(cl:in-package movement_msgs-msg)


;//! \htmlinclude IDMapMsg.msg.html

(cl:defclass <IDMapMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (map
    :reader map
    :initarg :map
    :type std_msgs-msg:Int32MultiArray
    :initform (cl:make-instance 'std_msgs-msg:Int32MultiArray))
   (jNames
    :reader jNames
    :initarg :jNames
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (robotDOF
    :reader robotDOF
    :initarg :robotDOF
    :type cl:integer
    :initform 0)
   (urdfDOF
    :reader urdfDOF
    :initarg :urdfDOF
    :type cl:integer
    :initform 0)
   (ikDOF
    :reader ikDOF
    :initarg :ikDOF
    :type cl:integer
    :initform 0))
)

(cl:defclass IDMapMsg (<IDMapMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IDMapMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IDMapMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-msg:<IDMapMsg> is deprecated: use movement_msgs-msg:IDMapMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <IDMapMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:header-val is deprecated.  Use movement_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'map-val :lambda-list '(m))
(cl:defmethod map-val ((m <IDMapMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:map-val is deprecated.  Use movement_msgs-msg:map instead.")
  (map m))

(cl:ensure-generic-function 'jNames-val :lambda-list '(m))
(cl:defmethod jNames-val ((m <IDMapMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:jNames-val is deprecated.  Use movement_msgs-msg:jNames instead.")
  (jNames m))

(cl:ensure-generic-function 'robotDOF-val :lambda-list '(m))
(cl:defmethod robotDOF-val ((m <IDMapMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:robotDOF-val is deprecated.  Use movement_msgs-msg:robotDOF instead.")
  (robotDOF m))

(cl:ensure-generic-function 'urdfDOF-val :lambda-list '(m))
(cl:defmethod urdfDOF-val ((m <IDMapMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:urdfDOF-val is deprecated.  Use movement_msgs-msg:urdfDOF instead.")
  (urdfDOF m))

(cl:ensure-generic-function 'ikDOF-val :lambda-list '(m))
(cl:defmethod ikDOF-val ((m <IDMapMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:ikDOF-val is deprecated.  Use movement_msgs-msg:ikDOF instead.")
  (ikDOF m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IDMapMsg>) ostream)
  "Serializes a message object of type '<IDMapMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'map) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'jNames))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'jNames))
  (cl:let* ((signed (cl:slot-value msg 'robotDOF)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'urdfDOF)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ikDOF)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IDMapMsg>) istream)
  "Deserializes a message object of type '<IDMapMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'map) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'jNames) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'jNames)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robotDOF) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'urdfDOF) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ikDOF) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IDMapMsg>)))
  "Returns string type for a message object of type '<IDMapMsg>"
  "movement_msgs/IDMapMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IDMapMsg)))
  "Returns string type for a message object of type 'IDMapMsg"
  "movement_msgs/IDMapMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IDMapMsg>)))
  "Returns md5sum for a message object of type '<IDMapMsg>"
  "1d05c13180a22938616df56def75e013")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IDMapMsg)))
  "Returns md5sum for a message object of type 'IDMapMsg"
  "1d05c13180a22938616df56def75e013")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IDMapMsg>)))
  "Returns full string definition for message of type '<IDMapMsg>"
  (cl:format cl:nil "Header                    header~%std_msgs/Int32MultiArray  map~%string[]                  jNames~%int32                     robotDOF~%int32                     urdfDOF~%int32                     ikDOF~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/Int32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%int32[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IDMapMsg)))
  "Returns full string definition for message of type 'IDMapMsg"
  (cl:format cl:nil "Header                    header~%std_msgs/Int32MultiArray  map~%string[]                  jNames~%int32                     robotDOF~%int32                     urdfDOF~%int32                     ikDOF~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/Int32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%int32[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IDMapMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'map))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'jNames) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IDMapMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'IDMapMsg
    (cl:cons ':header (header msg))
    (cl:cons ':map (map msg))
    (cl:cons ':jNames (jNames msg))
    (cl:cons ':robotDOF (robotDOF msg))
    (cl:cons ':urdfDOF (urdfDOF msg))
    (cl:cons ':ikDOF (ikDOF msg))
))
