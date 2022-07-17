; Auto-generated. Do not edit!


(cl:in-package movement_msgs-srv)


;//! \htmlinclude CommandToOpenCMSrv-request.msg.html

(cl:defclass <CommandToOpenCMSrv-request> (roslisp-msg-protocol:ros-message)
  ((opencm_command
    :reader opencm_command
    :initarg :opencm_command
    :type cl:fixnum
    :initform 0))
)

(cl:defclass CommandToOpenCMSrv-request (<CommandToOpenCMSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CommandToOpenCMSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CommandToOpenCMSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<CommandToOpenCMSrv-request> is deprecated: use movement_msgs-srv:CommandToOpenCMSrv-request instead.")))

(cl:ensure-generic-function 'opencm_command-val :lambda-list '(m))
(cl:defmethod opencm_command-val ((m <CommandToOpenCMSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:opencm_command-val is deprecated.  Use movement_msgs-srv:opencm_command instead.")
  (opencm_command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CommandToOpenCMSrv-request>) ostream)
  "Serializes a message object of type '<CommandToOpenCMSrv-request>"
  (cl:let* ((signed (cl:slot-value msg 'opencm_command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CommandToOpenCMSrv-request>) istream)
  "Deserializes a message object of type '<CommandToOpenCMSrv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'opencm_command) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CommandToOpenCMSrv-request>)))
  "Returns string type for a service object of type '<CommandToOpenCMSrv-request>"
  "movement_msgs/CommandToOpenCMSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CommandToOpenCMSrv-request)))
  "Returns string type for a service object of type 'CommandToOpenCMSrv-request"
  "movement_msgs/CommandToOpenCMSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CommandToOpenCMSrv-request>)))
  "Returns md5sum for a message object of type '<CommandToOpenCMSrv-request>"
  "006dfbee25aeee1268324ecc4e306ddb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CommandToOpenCMSrv-request)))
  "Returns md5sum for a message object of type 'CommandToOpenCMSrv-request"
  "006dfbee25aeee1268324ecc4e306ddb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CommandToOpenCMSrv-request>)))
  "Returns full string definition for message of type '<CommandToOpenCMSrv-request>"
  (cl:format cl:nil "int16 opencm_command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CommandToOpenCMSrv-request)))
  "Returns full string definition for message of type 'CommandToOpenCMSrv-request"
  (cl:format cl:nil "int16 opencm_command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CommandToOpenCMSrv-request>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CommandToOpenCMSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CommandToOpenCMSrv-request
    (cl:cons ':opencm_command (opencm_command msg))
))
;//! \htmlinclude CommandToOpenCMSrv-response.msg.html

(cl:defclass <CommandToOpenCMSrv-response> (roslisp-msg-protocol:ros-message)
  ((command_executed
    :reader command_executed
    :initarg :command_executed
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass CommandToOpenCMSrv-response (<CommandToOpenCMSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CommandToOpenCMSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CommandToOpenCMSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<CommandToOpenCMSrv-response> is deprecated: use movement_msgs-srv:CommandToOpenCMSrv-response instead.")))

(cl:ensure-generic-function 'command_executed-val :lambda-list '(m))
(cl:defmethod command_executed-val ((m <CommandToOpenCMSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:command_executed-val is deprecated.  Use movement_msgs-srv:command_executed instead.")
  (command_executed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CommandToOpenCMSrv-response>) ostream)
  "Serializes a message object of type '<CommandToOpenCMSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'command_executed) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CommandToOpenCMSrv-response>) istream)
  "Deserializes a message object of type '<CommandToOpenCMSrv-response>"
    (cl:setf (cl:slot-value msg 'command_executed) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CommandToOpenCMSrv-response>)))
  "Returns string type for a service object of type '<CommandToOpenCMSrv-response>"
  "movement_msgs/CommandToOpenCMSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CommandToOpenCMSrv-response)))
  "Returns string type for a service object of type 'CommandToOpenCMSrv-response"
  "movement_msgs/CommandToOpenCMSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CommandToOpenCMSrv-response>)))
  "Returns md5sum for a message object of type '<CommandToOpenCMSrv-response>"
  "006dfbee25aeee1268324ecc4e306ddb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CommandToOpenCMSrv-response)))
  "Returns md5sum for a message object of type 'CommandToOpenCMSrv-response"
  "006dfbee25aeee1268324ecc4e306ddb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CommandToOpenCMSrv-response>)))
  "Returns full string definition for message of type '<CommandToOpenCMSrv-response>"
  (cl:format cl:nil "bool command_executed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CommandToOpenCMSrv-response)))
  "Returns full string definition for message of type 'CommandToOpenCMSrv-response"
  (cl:format cl:nil "bool command_executed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CommandToOpenCMSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CommandToOpenCMSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CommandToOpenCMSrv-response
    (cl:cons ':command_executed (command_executed msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CommandToOpenCMSrv)))
  'CommandToOpenCMSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CommandToOpenCMSrv)))
  'CommandToOpenCMSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CommandToOpenCMSrv)))
  "Returns string type for a service object of type '<CommandToOpenCMSrv>"
  "movement_msgs/CommandToOpenCMSrv")