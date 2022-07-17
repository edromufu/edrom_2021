; Auto-generated. Do not edit!


(cl:in-package movement_msgs-msg)


;//! \htmlinclude EndEffStateMsg.msg.html

(cl:defclass <EndEffStateMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (endEff
    :reader endEff
    :initarg :endEff
    :type (cl:vector movement_msgs-msg:EndEffMsg)
   :initform (cl:make-array 0 :element-type 'movement_msgs-msg:EndEffMsg :initial-element (cl:make-instance 'movement_msgs-msg:EndEffMsg))))
)

(cl:defclass EndEffStateMsg (<EndEffStateMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EndEffStateMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EndEffStateMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-msg:<EndEffStateMsg> is deprecated: use movement_msgs-msg:EndEffStateMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EndEffStateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:header-val is deprecated.  Use movement_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'endEff-val :lambda-list '(m))
(cl:defmethod endEff-val ((m <EndEffStateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:endEff-val is deprecated.  Use movement_msgs-msg:endEff instead.")
  (endEff m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EndEffStateMsg>) ostream)
  "Serializes a message object of type '<EndEffStateMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'endEff))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'endEff))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EndEffStateMsg>) istream)
  "Deserializes a message object of type '<EndEffStateMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'endEff) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'endEff)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'movement_msgs-msg:EndEffMsg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EndEffStateMsg>)))
  "Returns string type for a message object of type '<EndEffStateMsg>"
  "movement_msgs/EndEffStateMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EndEffStateMsg)))
  "Returns string type for a message object of type 'EndEffStateMsg"
  "movement_msgs/EndEffStateMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EndEffStateMsg>)))
  "Returns md5sum for a message object of type '<EndEffStateMsg>"
  "62edf4d89ed16d8d1d54b58ace855e91")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EndEffStateMsg)))
  "Returns md5sum for a message object of type 'EndEffStateMsg"
  "62edf4d89ed16d8d1d54b58ace855e91")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EndEffStateMsg>)))
  "Returns full string definition for message of type '<EndEffStateMsg>"
  (cl:format cl:nil "Header                     header~%movement_msgs/EndEffMsg[]  endEff~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: movement_msgs/EndEffMsg~%geometry_msgs/Point  pos~%geometry_msgs/Point  vel~%geometry_msgs/Point  acc~%geometry_msgs/Point  rot~%int32                type~%int32                flag~%float64              dt~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EndEffStateMsg)))
  "Returns full string definition for message of type 'EndEffStateMsg"
  (cl:format cl:nil "Header                     header~%movement_msgs/EndEffMsg[]  endEff~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: movement_msgs/EndEffMsg~%geometry_msgs/Point  pos~%geometry_msgs/Point  vel~%geometry_msgs/Point  acc~%geometry_msgs/Point  rot~%int32                type~%int32                flag~%float64              dt~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EndEffStateMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'endEff) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EndEffStateMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'EndEffStateMsg
    (cl:cons ':header (header msg))
    (cl:cons ':endEff (endEff msg))
))
