; Auto-generated. Do not edit!


(cl:in-package movement_msgs-srv)


;//! \htmlinclude LoadMapConfigsSrv-request.msg.html

(cl:defclass <LoadMapConfigsSrv-request> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (fEnum
    :reader fEnum
    :initarg :fEnum
    :type cl:string
    :initform "")
   (fRobot
    :reader fRobot
    :initarg :fRobot
    :type cl:string
    :initform "")
   (fUrdf
    :reader fUrdf
    :initarg :fUrdf
    :type cl:string
    :initform "")
   (fIk
    :reader fIk
    :initarg :fIk
    :type cl:string
    :initform "")
   (update
    :reader update
    :initarg :update
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LoadMapConfigsSrv-request (<LoadMapConfigsSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadMapConfigsSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadMapConfigsSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<LoadMapConfigsSrv-request> is deprecated: use movement_msgs-srv:LoadMapConfigsSrv-request instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LoadMapConfigsSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:header-val is deprecated.  Use movement_msgs-srv:header instead.")
  (header m))

(cl:ensure-generic-function 'fEnum-val :lambda-list '(m))
(cl:defmethod fEnum-val ((m <LoadMapConfigsSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:fEnum-val is deprecated.  Use movement_msgs-srv:fEnum instead.")
  (fEnum m))

(cl:ensure-generic-function 'fRobot-val :lambda-list '(m))
(cl:defmethod fRobot-val ((m <LoadMapConfigsSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:fRobot-val is deprecated.  Use movement_msgs-srv:fRobot instead.")
  (fRobot m))

(cl:ensure-generic-function 'fUrdf-val :lambda-list '(m))
(cl:defmethod fUrdf-val ((m <LoadMapConfigsSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:fUrdf-val is deprecated.  Use movement_msgs-srv:fUrdf instead.")
  (fUrdf m))

(cl:ensure-generic-function 'fIk-val :lambda-list '(m))
(cl:defmethod fIk-val ((m <LoadMapConfigsSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:fIk-val is deprecated.  Use movement_msgs-srv:fIk instead.")
  (fIk m))

(cl:ensure-generic-function 'update-val :lambda-list '(m))
(cl:defmethod update-val ((m <LoadMapConfigsSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:update-val is deprecated.  Use movement_msgs-srv:update instead.")
  (update m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadMapConfigsSrv-request>) ostream)
  "Serializes a message object of type '<LoadMapConfigsSrv-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'fEnum))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'fEnum))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'fRobot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'fRobot))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'fUrdf))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'fUrdf))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'fIk))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'fIk))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'update) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadMapConfigsSrv-request>) istream)
  "Deserializes a message object of type '<LoadMapConfigsSrv-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fEnum) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'fEnum) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fRobot) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'fRobot) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fUrdf) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'fUrdf) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fIk) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'fIk) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'update) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadMapConfigsSrv-request>)))
  "Returns string type for a service object of type '<LoadMapConfigsSrv-request>"
  "movement_msgs/LoadMapConfigsSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadMapConfigsSrv-request)))
  "Returns string type for a service object of type 'LoadMapConfigsSrv-request"
  "movement_msgs/LoadMapConfigsSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadMapConfigsSrv-request>)))
  "Returns md5sum for a message object of type '<LoadMapConfigsSrv-request>"
  "90c8e8e79a383c29a071f7abd2119ce5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadMapConfigsSrv-request)))
  "Returns md5sum for a message object of type 'LoadMapConfigsSrv-request"
  "90c8e8e79a383c29a071f7abd2119ce5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadMapConfigsSrv-request>)))
  "Returns full string definition for message of type '<LoadMapConfigsSrv-request>"
  (cl:format cl:nil "Header header~%string fEnum~%string fRobot~%string fUrdf~%string fIk~%bool   update~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadMapConfigsSrv-request)))
  "Returns full string definition for message of type 'LoadMapConfigsSrv-request"
  (cl:format cl:nil "Header header~%string fEnum~%string fRobot~%string fUrdf~%string fIk~%bool   update~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadMapConfigsSrv-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'fEnum))
     4 (cl:length (cl:slot-value msg 'fRobot))
     4 (cl:length (cl:slot-value msg 'fUrdf))
     4 (cl:length (cl:slot-value msg 'fIk))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadMapConfigsSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadMapConfigsSrv-request
    (cl:cons ':header (header msg))
    (cl:cons ':fEnum (fEnum msg))
    (cl:cons ':fRobot (fRobot msg))
    (cl:cons ':fUrdf (fUrdf msg))
    (cl:cons ':fIk (fIk msg))
    (cl:cons ':update (update msg))
))
;//! \htmlinclude LoadMapConfigsSrv-response.msg.html

(cl:defclass <LoadMapConfigsSrv-response> (roslisp-msg-protocol:ros-message)
  ((idMap
    :reader idMap
    :initarg :idMap
    :type movement_msgs-msg:IDMapMsg
    :initform (cl:make-instance 'movement_msgs-msg:IDMapMsg)))
)

(cl:defclass LoadMapConfigsSrv-response (<LoadMapConfigsSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadMapConfigsSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadMapConfigsSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<LoadMapConfigsSrv-response> is deprecated: use movement_msgs-srv:LoadMapConfigsSrv-response instead.")))

(cl:ensure-generic-function 'idMap-val :lambda-list '(m))
(cl:defmethod idMap-val ((m <LoadMapConfigsSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:idMap-val is deprecated.  Use movement_msgs-srv:idMap instead.")
  (idMap m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadMapConfigsSrv-response>) ostream)
  "Serializes a message object of type '<LoadMapConfigsSrv-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'idMap) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadMapConfigsSrv-response>) istream)
  "Deserializes a message object of type '<LoadMapConfigsSrv-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'idMap) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadMapConfigsSrv-response>)))
  "Returns string type for a service object of type '<LoadMapConfigsSrv-response>"
  "movement_msgs/LoadMapConfigsSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadMapConfigsSrv-response)))
  "Returns string type for a service object of type 'LoadMapConfigsSrv-response"
  "movement_msgs/LoadMapConfigsSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadMapConfigsSrv-response>)))
  "Returns md5sum for a message object of type '<LoadMapConfigsSrv-response>"
  "90c8e8e79a383c29a071f7abd2119ce5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadMapConfigsSrv-response)))
  "Returns md5sum for a message object of type 'LoadMapConfigsSrv-response"
  "90c8e8e79a383c29a071f7abd2119ce5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadMapConfigsSrv-response>)))
  "Returns full string definition for message of type '<LoadMapConfigsSrv-response>"
  (cl:format cl:nil "~%movement_msgs/IDMapMsg  idMap~%~%~%~%================================================================================~%MSG: movement_msgs/IDMapMsg~%Header                    header~%std_msgs/Int32MultiArray  map~%string[]                  jNames~%int32                     robotDOF~%int32                     urdfDOF~%int32                     ikDOF~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/Int32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%int32[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadMapConfigsSrv-response)))
  "Returns full string definition for message of type 'LoadMapConfigsSrv-response"
  (cl:format cl:nil "~%movement_msgs/IDMapMsg  idMap~%~%~%~%================================================================================~%MSG: movement_msgs/IDMapMsg~%Header                    header~%std_msgs/Int32MultiArray  map~%string[]                  jNames~%int32                     robotDOF~%int32                     urdfDOF~%int32                     ikDOF~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/Int32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%int32[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadMapConfigsSrv-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'idMap))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadMapConfigsSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadMapConfigsSrv-response
    (cl:cons ':idMap (idMap msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LoadMapConfigsSrv)))
  'LoadMapConfigsSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LoadMapConfigsSrv)))
  'LoadMapConfigsSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadMapConfigsSrv)))
  "Returns string type for a service object of type '<LoadMapConfigsSrv>"
  "movement_msgs/LoadMapConfigsSrv")