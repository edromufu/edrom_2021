; Auto-generated. Do not edit!


(cl:in-package movement_msgs-srv)


;//! \htmlinclude LoadHumanoidPropertiesSrv-request.msg.html

(cl:defclass <LoadHumanoidPropertiesSrv-request> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (joint
    :reader joint
    :initarg :joint
    :type movement_msgs-msg:JointStateMsg
    :initform (cl:make-instance 'movement_msgs-msg:JointStateMsg))
   (endEff
    :reader endEff
    :initarg :endEff
    :type movement_msgs-msg:EndEffStateMsg
    :initform (cl:make-instance 'movement_msgs-msg:EndEffStateMsg))
   (ikRef
    :reader ikRef
    :initarg :ikRef
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (calcZMP
    :reader calcZMP
    :initarg :calcZMP
    :type cl:boolean
    :initform cl:nil)
   (calcCOM
    :reader calcCOM
    :initarg :calcCOM
    :type cl:boolean
    :initform cl:nil)
   (calcInvDyn
    :reader calcInvDyn
    :initarg :calcInvDyn
    :type cl:boolean
    :initform cl:nil)
   (setIkRef
    :reader setIkRef
    :initarg :setIkRef
    :type cl:boolean
    :initform cl:nil)
   (setComAsIkRef
    :reader setComAsIkRef
    :initarg :setComAsIkRef
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LoadHumanoidPropertiesSrv-request (<LoadHumanoidPropertiesSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadHumanoidPropertiesSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadHumanoidPropertiesSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<LoadHumanoidPropertiesSrv-request> is deprecated: use movement_msgs-srv:LoadHumanoidPropertiesSrv-request instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LoadHumanoidPropertiesSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:header-val is deprecated.  Use movement_msgs-srv:header instead.")
  (header m))

(cl:ensure-generic-function 'joint-val :lambda-list '(m))
(cl:defmethod joint-val ((m <LoadHumanoidPropertiesSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:joint-val is deprecated.  Use movement_msgs-srv:joint instead.")
  (joint m))

(cl:ensure-generic-function 'endEff-val :lambda-list '(m))
(cl:defmethod endEff-val ((m <LoadHumanoidPropertiesSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:endEff-val is deprecated.  Use movement_msgs-srv:endEff instead.")
  (endEff m))

(cl:ensure-generic-function 'ikRef-val :lambda-list '(m))
(cl:defmethod ikRef-val ((m <LoadHumanoidPropertiesSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:ikRef-val is deprecated.  Use movement_msgs-srv:ikRef instead.")
  (ikRef m))

(cl:ensure-generic-function 'calcZMP-val :lambda-list '(m))
(cl:defmethod calcZMP-val ((m <LoadHumanoidPropertiesSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:calcZMP-val is deprecated.  Use movement_msgs-srv:calcZMP instead.")
  (calcZMP m))

(cl:ensure-generic-function 'calcCOM-val :lambda-list '(m))
(cl:defmethod calcCOM-val ((m <LoadHumanoidPropertiesSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:calcCOM-val is deprecated.  Use movement_msgs-srv:calcCOM instead.")
  (calcCOM m))

(cl:ensure-generic-function 'calcInvDyn-val :lambda-list '(m))
(cl:defmethod calcInvDyn-val ((m <LoadHumanoidPropertiesSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:calcInvDyn-val is deprecated.  Use movement_msgs-srv:calcInvDyn instead.")
  (calcInvDyn m))

(cl:ensure-generic-function 'setIkRef-val :lambda-list '(m))
(cl:defmethod setIkRef-val ((m <LoadHumanoidPropertiesSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:setIkRef-val is deprecated.  Use movement_msgs-srv:setIkRef instead.")
  (setIkRef m))

(cl:ensure-generic-function 'setComAsIkRef-val :lambda-list '(m))
(cl:defmethod setComAsIkRef-val ((m <LoadHumanoidPropertiesSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:setComAsIkRef-val is deprecated.  Use movement_msgs-srv:setComAsIkRef instead.")
  (setComAsIkRef m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadHumanoidPropertiesSrv-request>) ostream)
  "Serializes a message object of type '<LoadHumanoidPropertiesSrv-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'joint) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'endEff) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ikRef) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'calcZMP) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'calcCOM) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'calcInvDyn) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'setIkRef) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'setComAsIkRef) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadHumanoidPropertiesSrv-request>) istream)
  "Deserializes a message object of type '<LoadHumanoidPropertiesSrv-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'joint) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'endEff) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ikRef) istream)
    (cl:setf (cl:slot-value msg 'calcZMP) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'calcCOM) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'calcInvDyn) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'setIkRef) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'setComAsIkRef) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadHumanoidPropertiesSrv-request>)))
  "Returns string type for a service object of type '<LoadHumanoidPropertiesSrv-request>"
  "movement_msgs/LoadHumanoidPropertiesSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadHumanoidPropertiesSrv-request)))
  "Returns string type for a service object of type 'LoadHumanoidPropertiesSrv-request"
  "movement_msgs/LoadHumanoidPropertiesSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadHumanoidPropertiesSrv-request>)))
  "Returns md5sum for a message object of type '<LoadHumanoidPropertiesSrv-request>"
  "3e2b196ffde962aa21d86738ea07bc83")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadHumanoidPropertiesSrv-request)))
  "Returns md5sum for a message object of type 'LoadHumanoidPropertiesSrv-request"
  "3e2b196ffde962aa21d86738ea07bc83")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadHumanoidPropertiesSrv-request>)))
  "Returns full string definition for message of type '<LoadHumanoidPropertiesSrv-request>"
  (cl:format cl:nil "Header                       header~%movement_msgs/JointStateMsg  joint~%movement_msgs/EndEffStateMsg endEff~%geometry_msgs/Point          ikRef~%~%bool                         calcZMP~%bool                         calcCOM~%bool                         calcInvDyn~%bool                         setIkRef~%bool                         setComAsIkRef~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: movement_msgs/JointStateMsg~%Header    header~%float64[] pos~%float64[] vel~%float64[] acc~%float64[] torq~%string  writeCommand~%string        kind~%string        readCommand~%int32         type~%int32         source~%float64       dt~%~%~%================================================================================~%MSG: movement_msgs/EndEffStateMsg~%Header                     header~%movement_msgs/EndEffMsg[]  endEff~%~%================================================================================~%MSG: movement_msgs/EndEffMsg~%geometry_msgs/Point  pos~%geometry_msgs/Point  vel~%geometry_msgs/Point  acc~%geometry_msgs/Point  rot~%int32                type~%int32                flag~%float64              dt~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadHumanoidPropertiesSrv-request)))
  "Returns full string definition for message of type 'LoadHumanoidPropertiesSrv-request"
  (cl:format cl:nil "Header                       header~%movement_msgs/JointStateMsg  joint~%movement_msgs/EndEffStateMsg endEff~%geometry_msgs/Point          ikRef~%~%bool                         calcZMP~%bool                         calcCOM~%bool                         calcInvDyn~%bool                         setIkRef~%bool                         setComAsIkRef~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: movement_msgs/JointStateMsg~%Header    header~%float64[] pos~%float64[] vel~%float64[] acc~%float64[] torq~%string  writeCommand~%string        kind~%string        readCommand~%int32         type~%int32         source~%float64       dt~%~%~%================================================================================~%MSG: movement_msgs/EndEffStateMsg~%Header                     header~%movement_msgs/EndEffMsg[]  endEff~%~%================================================================================~%MSG: movement_msgs/EndEffMsg~%geometry_msgs/Point  pos~%geometry_msgs/Point  vel~%geometry_msgs/Point  acc~%geometry_msgs/Point  rot~%int32                type~%int32                flag~%float64              dt~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadHumanoidPropertiesSrv-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'joint))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'endEff))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ikRef))
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadHumanoidPropertiesSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadHumanoidPropertiesSrv-request
    (cl:cons ':header (header msg))
    (cl:cons ':joint (joint msg))
    (cl:cons ':endEff (endEff msg))
    (cl:cons ':ikRef (ikRef msg))
    (cl:cons ':calcZMP (calcZMP msg))
    (cl:cons ':calcCOM (calcCOM msg))
    (cl:cons ':calcInvDyn (calcInvDyn msg))
    (cl:cons ':setIkRef (setIkRef msg))
    (cl:cons ':setComAsIkRef (setComAsIkRef msg))
))
;//! \htmlinclude LoadHumanoidPropertiesSrv-response.msg.html

(cl:defclass <LoadHumanoidPropertiesSrv-response> (roslisp-msg-protocol:ros-message)
  ((zmpPoint
    :reader zmpPoint
    :initarg :zmpPoint
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (comPoint
    :reader comPoint
    :initarg :comPoint
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (footComPoint
    :reader footComPoint
    :initarg :footComPoint
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (torq
    :reader torq
    :initarg :torq
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass LoadHumanoidPropertiesSrv-response (<LoadHumanoidPropertiesSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadHumanoidPropertiesSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadHumanoidPropertiesSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<LoadHumanoidPropertiesSrv-response> is deprecated: use movement_msgs-srv:LoadHumanoidPropertiesSrv-response instead.")))

(cl:ensure-generic-function 'zmpPoint-val :lambda-list '(m))
(cl:defmethod zmpPoint-val ((m <LoadHumanoidPropertiesSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:zmpPoint-val is deprecated.  Use movement_msgs-srv:zmpPoint instead.")
  (zmpPoint m))

(cl:ensure-generic-function 'comPoint-val :lambda-list '(m))
(cl:defmethod comPoint-val ((m <LoadHumanoidPropertiesSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:comPoint-val is deprecated.  Use movement_msgs-srv:comPoint instead.")
  (comPoint m))

(cl:ensure-generic-function 'footComPoint-val :lambda-list '(m))
(cl:defmethod footComPoint-val ((m <LoadHumanoidPropertiesSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:footComPoint-val is deprecated.  Use movement_msgs-srv:footComPoint instead.")
  (footComPoint m))

(cl:ensure-generic-function 'torq-val :lambda-list '(m))
(cl:defmethod torq-val ((m <LoadHumanoidPropertiesSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:torq-val is deprecated.  Use movement_msgs-srv:torq instead.")
  (torq m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadHumanoidPropertiesSrv-response>) ostream)
  "Serializes a message object of type '<LoadHumanoidPropertiesSrv-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'zmpPoint) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'comPoint) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'footComPoint) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'torq))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'torq))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadHumanoidPropertiesSrv-response>) istream)
  "Deserializes a message object of type '<LoadHumanoidPropertiesSrv-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'zmpPoint) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'comPoint) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'footComPoint) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'torq) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'torq)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadHumanoidPropertiesSrv-response>)))
  "Returns string type for a service object of type '<LoadHumanoidPropertiesSrv-response>"
  "movement_msgs/LoadHumanoidPropertiesSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadHumanoidPropertiesSrv-response)))
  "Returns string type for a service object of type 'LoadHumanoidPropertiesSrv-response"
  "movement_msgs/LoadHumanoidPropertiesSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadHumanoidPropertiesSrv-response>)))
  "Returns md5sum for a message object of type '<LoadHumanoidPropertiesSrv-response>"
  "3e2b196ffde962aa21d86738ea07bc83")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadHumanoidPropertiesSrv-response)))
  "Returns md5sum for a message object of type 'LoadHumanoidPropertiesSrv-response"
  "3e2b196ffde962aa21d86738ea07bc83")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadHumanoidPropertiesSrv-response>)))
  "Returns full string definition for message of type '<LoadHumanoidPropertiesSrv-response>"
  (cl:format cl:nil "~%geometry_msgs/Point  zmpPoint~%geometry_msgs/Point  comPoint~%geometry_msgs/Point  footComPoint~%float64[]            torq~%~%~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadHumanoidPropertiesSrv-response)))
  "Returns full string definition for message of type 'LoadHumanoidPropertiesSrv-response"
  (cl:format cl:nil "~%geometry_msgs/Point  zmpPoint~%geometry_msgs/Point  comPoint~%geometry_msgs/Point  footComPoint~%float64[]            torq~%~%~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadHumanoidPropertiesSrv-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'zmpPoint))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'comPoint))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'footComPoint))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'torq) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadHumanoidPropertiesSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadHumanoidPropertiesSrv-response
    (cl:cons ':zmpPoint (zmpPoint msg))
    (cl:cons ':comPoint (comPoint msg))
    (cl:cons ':footComPoint (footComPoint msg))
    (cl:cons ':torq (torq msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LoadHumanoidPropertiesSrv)))
  'LoadHumanoidPropertiesSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LoadHumanoidPropertiesSrv)))
  'LoadHumanoidPropertiesSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadHumanoidPropertiesSrv)))
  "Returns string type for a service object of type '<LoadHumanoidPropertiesSrv>"
  "movement_msgs/LoadHumanoidPropertiesSrv")