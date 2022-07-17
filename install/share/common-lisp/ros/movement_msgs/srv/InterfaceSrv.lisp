; Auto-generated. Do not edit!


(cl:in-package movement_msgs-srv)


;//! \htmlinclude InterfaceSrv-request.msg.html

(cl:defclass <InterfaceSrv-request> (roslisp-msg-protocol:ros-message)
  ((toGazebo
    :reader toGazebo
    :initarg :toGazebo
    :type cl:boolean
    :initform cl:nil)
   (toRobot
    :reader toRobot
    :initarg :toRobot
    :type cl:boolean
    :initform cl:nil)
   (scanMotors
    :reader scanMotors
    :initarg :scanMotors
    :type cl:boolean
    :initform cl:nil)
   (getPID
    :reader getPID
    :initarg :getPID
    :type cl:boolean
    :initform cl:nil)
   (getMotorPos
    :reader getMotorPos
    :initarg :getMotorPos
    :type cl:boolean
    :initform cl:nil)
   (send2Motor
    :reader send2Motor
    :initarg :send2Motor
    :type cl:boolean
    :initform cl:nil)
   (setTorque
    :reader setTorque
    :initarg :setTorque
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil))
   (motorIds
    :reader motorIds
    :initarg :motorIds
    :type cl:fixnum
    :initform 0)
   (fall
    :reader fall
    :initarg :fall
    :type cl:boolean
    :initform cl:nil)
   (ping
    :reader ping
    :initarg :ping
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass InterfaceSrv-request (<InterfaceSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InterfaceSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InterfaceSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<InterfaceSrv-request> is deprecated: use movement_msgs-srv:InterfaceSrv-request instead.")))

(cl:ensure-generic-function 'toGazebo-val :lambda-list '(m))
(cl:defmethod toGazebo-val ((m <InterfaceSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:toGazebo-val is deprecated.  Use movement_msgs-srv:toGazebo instead.")
  (toGazebo m))

(cl:ensure-generic-function 'toRobot-val :lambda-list '(m))
(cl:defmethod toRobot-val ((m <InterfaceSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:toRobot-val is deprecated.  Use movement_msgs-srv:toRobot instead.")
  (toRobot m))

(cl:ensure-generic-function 'scanMotors-val :lambda-list '(m))
(cl:defmethod scanMotors-val ((m <InterfaceSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:scanMotors-val is deprecated.  Use movement_msgs-srv:scanMotors instead.")
  (scanMotors m))

(cl:ensure-generic-function 'getPID-val :lambda-list '(m))
(cl:defmethod getPID-val ((m <InterfaceSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:getPID-val is deprecated.  Use movement_msgs-srv:getPID instead.")
  (getPID m))

(cl:ensure-generic-function 'getMotorPos-val :lambda-list '(m))
(cl:defmethod getMotorPos-val ((m <InterfaceSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:getMotorPos-val is deprecated.  Use movement_msgs-srv:getMotorPos instead.")
  (getMotorPos m))

(cl:ensure-generic-function 'send2Motor-val :lambda-list '(m))
(cl:defmethod send2Motor-val ((m <InterfaceSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:send2Motor-val is deprecated.  Use movement_msgs-srv:send2Motor instead.")
  (send2Motor m))

(cl:ensure-generic-function 'setTorque-val :lambda-list '(m))
(cl:defmethod setTorque-val ((m <InterfaceSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:setTorque-val is deprecated.  Use movement_msgs-srv:setTorque instead.")
  (setTorque m))

(cl:ensure-generic-function 'motorIds-val :lambda-list '(m))
(cl:defmethod motorIds-val ((m <InterfaceSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:motorIds-val is deprecated.  Use movement_msgs-srv:motorIds instead.")
  (motorIds m))

(cl:ensure-generic-function 'fall-val :lambda-list '(m))
(cl:defmethod fall-val ((m <InterfaceSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:fall-val is deprecated.  Use movement_msgs-srv:fall instead.")
  (fall m))

(cl:ensure-generic-function 'ping-val :lambda-list '(m))
(cl:defmethod ping-val ((m <InterfaceSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:ping-val is deprecated.  Use movement_msgs-srv:ping instead.")
  (ping m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InterfaceSrv-request>) ostream)
  "Serializes a message object of type '<InterfaceSrv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'toGazebo) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'toRobot) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'scanMotors) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'getPID) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'getMotorPos) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'send2Motor) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'setTorque))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'setTorque))
  (cl:let* ((signed (cl:slot-value msg 'motorIds)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'fall) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ping) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InterfaceSrv-request>) istream)
  "Deserializes a message object of type '<InterfaceSrv-request>"
    (cl:setf (cl:slot-value msg 'toGazebo) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'toRobot) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'scanMotors) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'getPID) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'getMotorPos) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'send2Motor) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'setTorque) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'setTorque)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'motorIds) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:slot-value msg 'fall) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'ping) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InterfaceSrv-request>)))
  "Returns string type for a service object of type '<InterfaceSrv-request>"
  "movement_msgs/InterfaceSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InterfaceSrv-request)))
  "Returns string type for a service object of type 'InterfaceSrv-request"
  "movement_msgs/InterfaceSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InterfaceSrv-request>)))
  "Returns md5sum for a message object of type '<InterfaceSrv-request>"
  "df2744d447a21ef2bc8fc6392375798f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InterfaceSrv-request)))
  "Returns md5sum for a message object of type 'InterfaceSrv-request"
  "df2744d447a21ef2bc8fc6392375798f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InterfaceSrv-request>)))
  "Returns full string definition for message of type '<InterfaceSrv-request>"
  (cl:format cl:nil "bool toGazebo~%bool toRobot~%bool scanMotors~%bool getPID~%bool getMotorPos~%bool send2Motor~%bool[] setTorque~%int16  motorIds~%bool fall~%bool ping~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InterfaceSrv-request)))
  "Returns full string definition for message of type 'InterfaceSrv-request"
  (cl:format cl:nil "bool toGazebo~%bool toRobot~%bool scanMotors~%bool getPID~%bool getMotorPos~%bool send2Motor~%bool[] setTorque~%int16  motorIds~%bool fall~%bool ping~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InterfaceSrv-request>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'setTorque) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     2
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InterfaceSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'InterfaceSrv-request
    (cl:cons ':toGazebo (toGazebo msg))
    (cl:cons ':toRobot (toRobot msg))
    (cl:cons ':scanMotors (scanMotors msg))
    (cl:cons ':getPID (getPID msg))
    (cl:cons ':getMotorPos (getMotorPos msg))
    (cl:cons ':send2Motor (send2Motor msg))
    (cl:cons ':setTorque (setTorque msg))
    (cl:cons ':motorIds (motorIds msg))
    (cl:cons ':fall (fall msg))
    (cl:cons ':ping (ping msg))
))
;//! \htmlinclude InterfaceSrv-response.msg.html

(cl:defclass <InterfaceSrv-response> (roslisp-msg-protocol:ros-message)
  ((motorState
    :reader motorState
    :initarg :motorState
    :type movement_msgs-msg:JointStateMsg
    :initform (cl:make-instance 'movement_msgs-msg:JointStateMsg))
   (motorPID
    :reader motorPID
    :initarg :motorPID
    :type movement_msgs-msg:MotorPIDMsg
    :initform (cl:make-instance 'movement_msgs-msg:MotorPIDMsg))
   (ids
    :reader ids
    :initarg :ids
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass InterfaceSrv-response (<InterfaceSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InterfaceSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InterfaceSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<InterfaceSrv-response> is deprecated: use movement_msgs-srv:InterfaceSrv-response instead.")))

(cl:ensure-generic-function 'motorState-val :lambda-list '(m))
(cl:defmethod motorState-val ((m <InterfaceSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:motorState-val is deprecated.  Use movement_msgs-srv:motorState instead.")
  (motorState m))

(cl:ensure-generic-function 'motorPID-val :lambda-list '(m))
(cl:defmethod motorPID-val ((m <InterfaceSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:motorPID-val is deprecated.  Use movement_msgs-srv:motorPID instead.")
  (motorPID m))

(cl:ensure-generic-function 'ids-val :lambda-list '(m))
(cl:defmethod ids-val ((m <InterfaceSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:ids-val is deprecated.  Use movement_msgs-srv:ids instead.")
  (ids m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InterfaceSrv-response>) ostream)
  "Serializes a message object of type '<InterfaceSrv-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'motorState) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'motorPID) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ids))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'ids))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InterfaceSrv-response>) istream)
  "Deserializes a message object of type '<InterfaceSrv-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'motorState) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'motorPID) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ids) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ids)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InterfaceSrv-response>)))
  "Returns string type for a service object of type '<InterfaceSrv-response>"
  "movement_msgs/InterfaceSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InterfaceSrv-response)))
  "Returns string type for a service object of type 'InterfaceSrv-response"
  "movement_msgs/InterfaceSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InterfaceSrv-response>)))
  "Returns md5sum for a message object of type '<InterfaceSrv-response>"
  "df2744d447a21ef2bc8fc6392375798f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InterfaceSrv-response)))
  "Returns md5sum for a message object of type 'InterfaceSrv-response"
  "df2744d447a21ef2bc8fc6392375798f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InterfaceSrv-response>)))
  "Returns full string definition for message of type '<InterfaceSrv-response>"
  (cl:format cl:nil "movement_msgs/JointStateMsg motorState~%movement_msgs/MotorPIDMsg   motorPID~%int16[]                     ids~%~%~%================================================================================~%MSG: movement_msgs/JointStateMsg~%Header    header~%float64[] pos~%float64[] vel~%float64[] acc~%float64[] torq~%string  writeCommand~%string        kind~%string        readCommand~%int32         type~%int32         source~%float64       dt~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: movement_msgs/MotorPIDMsg~%float64[]       kp~%float64[]       ki~%float64[]       kd~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InterfaceSrv-response)))
  "Returns full string definition for message of type 'InterfaceSrv-response"
  (cl:format cl:nil "movement_msgs/JointStateMsg motorState~%movement_msgs/MotorPIDMsg   motorPID~%int16[]                     ids~%~%~%================================================================================~%MSG: movement_msgs/JointStateMsg~%Header    header~%float64[] pos~%float64[] vel~%float64[] acc~%float64[] torq~%string  writeCommand~%string        kind~%string        readCommand~%int32         type~%int32         source~%float64       dt~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: movement_msgs/MotorPIDMsg~%float64[]       kp~%float64[]       ki~%float64[]       kd~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InterfaceSrv-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'motorState))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'motorPID))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ids) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InterfaceSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'InterfaceSrv-response
    (cl:cons ':motorState (motorState msg))
    (cl:cons ':motorPID (motorPID msg))
    (cl:cons ':ids (ids msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'InterfaceSrv)))
  'InterfaceSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'InterfaceSrv)))
  'InterfaceSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InterfaceSrv)))
  "Returns string type for a service object of type '<InterfaceSrv>"
  "movement_msgs/InterfaceSrv")