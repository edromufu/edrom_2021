; Auto-generated. Do not edit!


(cl:in-package movement_msgs-srv)


;//! \htmlinclude WalkCreatorRequestSrv-request.msg.html

(cl:defclass <WalkCreatorRequestSrv-request> (roslisp-msg-protocol:ros-message)
  ((enabledGain
    :reader enabledGain
    :initarg :enabledGain
    :type cl:integer
    :initform 0)
   (stepGain
    :reader stepGain
    :initarg :stepGain
    :type cl:float
    :initform 0.0)
   (lateralGain
    :reader lateralGain
    :initarg :lateralGain
    :type cl:float
    :initform 0.0)
   (turnGain
    :reader turnGain
    :initarg :turnGain
    :type cl:float
    :initform 0.0))
)

(cl:defclass WalkCreatorRequestSrv-request (<WalkCreatorRequestSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WalkCreatorRequestSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WalkCreatorRequestSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<WalkCreatorRequestSrv-request> is deprecated: use movement_msgs-srv:WalkCreatorRequestSrv-request instead.")))

(cl:ensure-generic-function 'enabledGain-val :lambda-list '(m))
(cl:defmethod enabledGain-val ((m <WalkCreatorRequestSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:enabledGain-val is deprecated.  Use movement_msgs-srv:enabledGain instead.")
  (enabledGain m))

(cl:ensure-generic-function 'stepGain-val :lambda-list '(m))
(cl:defmethod stepGain-val ((m <WalkCreatorRequestSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:stepGain-val is deprecated.  Use movement_msgs-srv:stepGain instead.")
  (stepGain m))

(cl:ensure-generic-function 'lateralGain-val :lambda-list '(m))
(cl:defmethod lateralGain-val ((m <WalkCreatorRequestSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:lateralGain-val is deprecated.  Use movement_msgs-srv:lateralGain instead.")
  (lateralGain m))

(cl:ensure-generic-function 'turnGain-val :lambda-list '(m))
(cl:defmethod turnGain-val ((m <WalkCreatorRequestSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:turnGain-val is deprecated.  Use movement_msgs-srv:turnGain instead.")
  (turnGain m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WalkCreatorRequestSrv-request>) ostream)
  "Serializes a message object of type '<WalkCreatorRequestSrv-request>"
  (cl:let* ((signed (cl:slot-value msg 'enabledGain)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'stepGain))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lateralGain))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'turnGain))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WalkCreatorRequestSrv-request>) istream)
  "Deserializes a message object of type '<WalkCreatorRequestSrv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'enabledGain) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'stepGain) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lateralGain) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'turnGain) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WalkCreatorRequestSrv-request>)))
  "Returns string type for a service object of type '<WalkCreatorRequestSrv-request>"
  "movement_msgs/WalkCreatorRequestSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WalkCreatorRequestSrv-request)))
  "Returns string type for a service object of type 'WalkCreatorRequestSrv-request"
  "movement_msgs/WalkCreatorRequestSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WalkCreatorRequestSrv-request>)))
  "Returns md5sum for a message object of type '<WalkCreatorRequestSrv-request>"
  "2ef0cc05178b854a3a3baabade41abc2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WalkCreatorRequestSrv-request)))
  "Returns md5sum for a message object of type 'WalkCreatorRequestSrv-request"
  "2ef0cc05178b854a3a3baabade41abc2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WalkCreatorRequestSrv-request>)))
  "Returns full string definition for message of type '<WalkCreatorRequestSrv-request>"
  (cl:format cl:nil "int32   enabledGain~%float32 stepGain~%float32 lateralGain~%float32 turnGain~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WalkCreatorRequestSrv-request)))
  "Returns full string definition for message of type 'WalkCreatorRequestSrv-request"
  (cl:format cl:nil "int32   enabledGain~%float32 stepGain~%float32 lateralGain~%float32 turnGain~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WalkCreatorRequestSrv-request>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WalkCreatorRequestSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'WalkCreatorRequestSrv-request
    (cl:cons ':enabledGain (enabledGain msg))
    (cl:cons ':stepGain (stepGain msg))
    (cl:cons ':lateralGain (lateralGain msg))
    (cl:cons ':turnGain (turnGain msg))
))
;//! \htmlinclude WalkCreatorRequestSrv-response.msg.html

(cl:defclass <WalkCreatorRequestSrv-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass WalkCreatorRequestSrv-response (<WalkCreatorRequestSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WalkCreatorRequestSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WalkCreatorRequestSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<WalkCreatorRequestSrv-response> is deprecated: use movement_msgs-srv:WalkCreatorRequestSrv-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <WalkCreatorRequestSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:success-val is deprecated.  Use movement_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WalkCreatorRequestSrv-response>) ostream)
  "Serializes a message object of type '<WalkCreatorRequestSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WalkCreatorRequestSrv-response>) istream)
  "Deserializes a message object of type '<WalkCreatorRequestSrv-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WalkCreatorRequestSrv-response>)))
  "Returns string type for a service object of type '<WalkCreatorRequestSrv-response>"
  "movement_msgs/WalkCreatorRequestSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WalkCreatorRequestSrv-response)))
  "Returns string type for a service object of type 'WalkCreatorRequestSrv-response"
  "movement_msgs/WalkCreatorRequestSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WalkCreatorRequestSrv-response>)))
  "Returns md5sum for a message object of type '<WalkCreatorRequestSrv-response>"
  "2ef0cc05178b854a3a3baabade41abc2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WalkCreatorRequestSrv-response)))
  "Returns md5sum for a message object of type 'WalkCreatorRequestSrv-response"
  "2ef0cc05178b854a3a3baabade41abc2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WalkCreatorRequestSrv-response>)))
  "Returns full string definition for message of type '<WalkCreatorRequestSrv-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WalkCreatorRequestSrv-response)))
  "Returns full string definition for message of type 'WalkCreatorRequestSrv-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WalkCreatorRequestSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WalkCreatorRequestSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'WalkCreatorRequestSrv-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'WalkCreatorRequestSrv)))
  'WalkCreatorRequestSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'WalkCreatorRequestSrv)))
  'WalkCreatorRequestSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WalkCreatorRequestSrv)))
  "Returns string type for a service object of type '<WalkCreatorRequestSrv>"
  "movement_msgs/WalkCreatorRequestSrv")