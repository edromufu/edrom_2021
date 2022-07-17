; Auto-generated. Do not edit!


(cl:in-package movement_msgs-srv)


;//! \htmlinclude LipCtrlSrv-request.msg.html

(cl:defclass <LipCtrlSrv-request> (roslisp-msg-protocol:ros-message)
  ((walk_ctrl
    :reader walk_ctrl
    :initarg :walk_ctrl
    :type cl:boolean
    :initform cl:nil)
   (delayR
    :reader delayR
    :initarg :delayR
    :type cl:float
    :initform 0.0)
   (delayL
    :reader delayL
    :initarg :delayL
    :type cl:float
    :initform 0.0)
   (delayAll
    :reader delayAll
    :initarg :delayAll
    :type cl:float
    :initform 0.0))
)

(cl:defclass LipCtrlSrv-request (<LipCtrlSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LipCtrlSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LipCtrlSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<LipCtrlSrv-request> is deprecated: use movement_msgs-srv:LipCtrlSrv-request instead.")))

(cl:ensure-generic-function 'walk_ctrl-val :lambda-list '(m))
(cl:defmethod walk_ctrl-val ((m <LipCtrlSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:walk_ctrl-val is deprecated.  Use movement_msgs-srv:walk_ctrl instead.")
  (walk_ctrl m))

(cl:ensure-generic-function 'delayR-val :lambda-list '(m))
(cl:defmethod delayR-val ((m <LipCtrlSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:delayR-val is deprecated.  Use movement_msgs-srv:delayR instead.")
  (delayR m))

(cl:ensure-generic-function 'delayL-val :lambda-list '(m))
(cl:defmethod delayL-val ((m <LipCtrlSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:delayL-val is deprecated.  Use movement_msgs-srv:delayL instead.")
  (delayL m))

(cl:ensure-generic-function 'delayAll-val :lambda-list '(m))
(cl:defmethod delayAll-val ((m <LipCtrlSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:delayAll-val is deprecated.  Use movement_msgs-srv:delayAll instead.")
  (delayAll m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LipCtrlSrv-request>) ostream)
  "Serializes a message object of type '<LipCtrlSrv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'walk_ctrl) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'delayR))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'delayL))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'delayAll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LipCtrlSrv-request>) istream)
  "Deserializes a message object of type '<LipCtrlSrv-request>"
    (cl:setf (cl:slot-value msg 'walk_ctrl) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'delayR) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'delayL) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'delayAll) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LipCtrlSrv-request>)))
  "Returns string type for a service object of type '<LipCtrlSrv-request>"
  "movement_msgs/LipCtrlSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LipCtrlSrv-request)))
  "Returns string type for a service object of type 'LipCtrlSrv-request"
  "movement_msgs/LipCtrlSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LipCtrlSrv-request>)))
  "Returns md5sum for a message object of type '<LipCtrlSrv-request>"
  "19f7b1da62232e35c765032ea5c2cdaa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LipCtrlSrv-request)))
  "Returns md5sum for a message object of type 'LipCtrlSrv-request"
  "19f7b1da62232e35c765032ea5c2cdaa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LipCtrlSrv-request>)))
  "Returns full string definition for message of type '<LipCtrlSrv-request>"
  (cl:format cl:nil "bool    walk_ctrl  #true for walking, false to stop~%float64 delayR~%float64 delayL~%float64 delayAll~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LipCtrlSrv-request)))
  "Returns full string definition for message of type 'LipCtrlSrv-request"
  (cl:format cl:nil "bool    walk_ctrl  #true for walking, false to stop~%float64 delayR~%float64 delayL~%float64 delayAll~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LipCtrlSrv-request>))
  (cl:+ 0
     1
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LipCtrlSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LipCtrlSrv-request
    (cl:cons ':walk_ctrl (walk_ctrl msg))
    (cl:cons ':delayR (delayR msg))
    (cl:cons ':delayL (delayL msg))
    (cl:cons ':delayAll (delayAll msg))
))
;//! \htmlinclude LipCtrlSrv-response.msg.html

(cl:defclass <LipCtrlSrv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass LipCtrlSrv-response (<LipCtrlSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LipCtrlSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LipCtrlSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<LipCtrlSrv-response> is deprecated: use movement_msgs-srv:LipCtrlSrv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LipCtrlSrv-response>) ostream)
  "Serializes a message object of type '<LipCtrlSrv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LipCtrlSrv-response>) istream)
  "Deserializes a message object of type '<LipCtrlSrv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LipCtrlSrv-response>)))
  "Returns string type for a service object of type '<LipCtrlSrv-response>"
  "movement_msgs/LipCtrlSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LipCtrlSrv-response)))
  "Returns string type for a service object of type 'LipCtrlSrv-response"
  "movement_msgs/LipCtrlSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LipCtrlSrv-response>)))
  "Returns md5sum for a message object of type '<LipCtrlSrv-response>"
  "19f7b1da62232e35c765032ea5c2cdaa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LipCtrlSrv-response)))
  "Returns md5sum for a message object of type 'LipCtrlSrv-response"
  "19f7b1da62232e35c765032ea5c2cdaa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LipCtrlSrv-response>)))
  "Returns full string definition for message of type '<LipCtrlSrv-response>"
  (cl:format cl:nil "~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LipCtrlSrv-response)))
  "Returns full string definition for message of type 'LipCtrlSrv-response"
  (cl:format cl:nil "~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LipCtrlSrv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LipCtrlSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LipCtrlSrv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LipCtrlSrv)))
  'LipCtrlSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LipCtrlSrv)))
  'LipCtrlSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LipCtrlSrv)))
  "Returns string type for a service object of type '<LipCtrlSrv>"
  "movement_msgs/LipCtrlSrv")