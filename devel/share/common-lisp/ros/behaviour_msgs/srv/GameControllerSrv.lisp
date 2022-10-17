; Auto-generated. Do not edit!


(cl:in-package behaviour_msgs-srv)


;//! \htmlinclude GameControllerSrv-request.msg.html

(cl:defclass <GameControllerSrv-request> (roslisp-msg-protocol:ros-message)
  ((host
    :reader host
    :initarg :host
    :type cl:string
    :initform "")
   (port
    :reader port
    :initarg :port
    :type cl:integer
    :initform 0))
)

(cl:defclass GameControllerSrv-request (<GameControllerSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GameControllerSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GameControllerSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name behaviour_msgs-srv:<GameControllerSrv-request> is deprecated: use behaviour_msgs-srv:GameControllerSrv-request instead.")))

(cl:ensure-generic-function 'host-val :lambda-list '(m))
(cl:defmethod host-val ((m <GameControllerSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader behaviour_msgs-srv:host-val is deprecated.  Use behaviour_msgs-srv:host instead.")
  (host m))

(cl:ensure-generic-function 'port-val :lambda-list '(m))
(cl:defmethod port-val ((m <GameControllerSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader behaviour_msgs-srv:port-val is deprecated.  Use behaviour_msgs-srv:port instead.")
  (port m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GameControllerSrv-request>) ostream)
  "Serializes a message object of type '<GameControllerSrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'host))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'host))
  (cl:let* ((signed (cl:slot-value msg 'port)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GameControllerSrv-request>) istream)
  "Deserializes a message object of type '<GameControllerSrv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'host) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'host) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'port) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GameControllerSrv-request>)))
  "Returns string type for a service object of type '<GameControllerSrv-request>"
  "behaviour_msgs/GameControllerSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GameControllerSrv-request)))
  "Returns string type for a service object of type 'GameControllerSrv-request"
  "behaviour_msgs/GameControllerSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GameControllerSrv-request>)))
  "Returns md5sum for a message object of type '<GameControllerSrv-request>"
  "55932133259e8c3335a553618447da45")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GameControllerSrv-request)))
  "Returns md5sum for a message object of type 'GameControllerSrv-request"
  "55932133259e8c3335a553618447da45")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GameControllerSrv-request>)))
  "Returns full string definition for message of type '<GameControllerSrv-request>"
  (cl:format cl:nil "string host~%int32 port~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GameControllerSrv-request)))
  "Returns full string definition for message of type 'GameControllerSrv-request"
  (cl:format cl:nil "string host~%int32 port~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GameControllerSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'host))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GameControllerSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GameControllerSrv-request
    (cl:cons ':host (host msg))
    (cl:cons ':port (port msg))
))
;//! \htmlinclude GameControllerSrv-response.msg.html

(cl:defclass <GameControllerSrv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GameControllerSrv-response (<GameControllerSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GameControllerSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GameControllerSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name behaviour_msgs-srv:<GameControllerSrv-response> is deprecated: use behaviour_msgs-srv:GameControllerSrv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GameControllerSrv-response>) ostream)
  "Serializes a message object of type '<GameControllerSrv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GameControllerSrv-response>) istream)
  "Deserializes a message object of type '<GameControllerSrv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GameControllerSrv-response>)))
  "Returns string type for a service object of type '<GameControllerSrv-response>"
  "behaviour_msgs/GameControllerSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GameControllerSrv-response)))
  "Returns string type for a service object of type 'GameControllerSrv-response"
  "behaviour_msgs/GameControllerSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GameControllerSrv-response>)))
  "Returns md5sum for a message object of type '<GameControllerSrv-response>"
  "55932133259e8c3335a553618447da45")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GameControllerSrv-response)))
  "Returns md5sum for a message object of type 'GameControllerSrv-response"
  "55932133259e8c3335a553618447da45")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GameControllerSrv-response>)))
  "Returns full string definition for message of type '<GameControllerSrv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GameControllerSrv-response)))
  "Returns full string definition for message of type 'GameControllerSrv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GameControllerSrv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GameControllerSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GameControllerSrv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GameControllerSrv)))
  'GameControllerSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GameControllerSrv)))
  'GameControllerSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GameControllerSrv)))
  "Returns string type for a service object of type '<GameControllerSrv>"
  "behaviour_msgs/GameControllerSrv")