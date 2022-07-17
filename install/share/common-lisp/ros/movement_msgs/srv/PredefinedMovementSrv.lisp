; Auto-generated. Do not edit!


(cl:in-package movement_msgs-srv)


;//! \htmlinclude PredefinedMovementSrv-request.msg.html

(cl:defclass <PredefinedMovementSrv-request> (roslisp-msg-protocol:ros-message)
  ((request
    :reader request
    :initarg :request
    :type cl:string
    :initform ""))
)

(cl:defclass PredefinedMovementSrv-request (<PredefinedMovementSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PredefinedMovementSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PredefinedMovementSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<PredefinedMovementSrv-request> is deprecated: use movement_msgs-srv:PredefinedMovementSrv-request instead.")))

(cl:ensure-generic-function 'request-val :lambda-list '(m))
(cl:defmethod request-val ((m <PredefinedMovementSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:request-val is deprecated.  Use movement_msgs-srv:request instead.")
  (request m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PredefinedMovementSrv-request>) ostream)
  "Serializes a message object of type '<PredefinedMovementSrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'request))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'request))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PredefinedMovementSrv-request>) istream)
  "Deserializes a message object of type '<PredefinedMovementSrv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'request) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'request) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PredefinedMovementSrv-request>)))
  "Returns string type for a service object of type '<PredefinedMovementSrv-request>"
  "movement_msgs/PredefinedMovementSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PredefinedMovementSrv-request)))
  "Returns string type for a service object of type 'PredefinedMovementSrv-request"
  "movement_msgs/PredefinedMovementSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PredefinedMovementSrv-request>)))
  "Returns md5sum for a message object of type '<PredefinedMovementSrv-request>"
  "bfd977d15515237025d35499f550165a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PredefinedMovementSrv-request)))
  "Returns md5sum for a message object of type 'PredefinedMovementSrv-request"
  "bfd977d15515237025d35499f550165a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PredefinedMovementSrv-request>)))
  "Returns full string definition for message of type '<PredefinedMovementSrv-request>"
  (cl:format cl:nil "string request~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PredefinedMovementSrv-request)))
  "Returns full string definition for message of type 'PredefinedMovementSrv-request"
  (cl:format cl:nil "string request~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PredefinedMovementSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'request))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PredefinedMovementSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PredefinedMovementSrv-request
    (cl:cons ':request (request msg))
))
;//! \htmlinclude PredefinedMovementSrv-response.msg.html

(cl:defclass <PredefinedMovementSrv-response> (roslisp-msg-protocol:ros-message)
  ((sucess
    :reader sucess
    :initarg :sucess
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PredefinedMovementSrv-response (<PredefinedMovementSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PredefinedMovementSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PredefinedMovementSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<PredefinedMovementSrv-response> is deprecated: use movement_msgs-srv:PredefinedMovementSrv-response instead.")))

(cl:ensure-generic-function 'sucess-val :lambda-list '(m))
(cl:defmethod sucess-val ((m <PredefinedMovementSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:sucess-val is deprecated.  Use movement_msgs-srv:sucess instead.")
  (sucess m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PredefinedMovementSrv-response>) ostream)
  "Serializes a message object of type '<PredefinedMovementSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'sucess) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PredefinedMovementSrv-response>) istream)
  "Deserializes a message object of type '<PredefinedMovementSrv-response>"
    (cl:setf (cl:slot-value msg 'sucess) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PredefinedMovementSrv-response>)))
  "Returns string type for a service object of type '<PredefinedMovementSrv-response>"
  "movement_msgs/PredefinedMovementSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PredefinedMovementSrv-response)))
  "Returns string type for a service object of type 'PredefinedMovementSrv-response"
  "movement_msgs/PredefinedMovementSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PredefinedMovementSrv-response>)))
  "Returns md5sum for a message object of type '<PredefinedMovementSrv-response>"
  "bfd977d15515237025d35499f550165a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PredefinedMovementSrv-response)))
  "Returns md5sum for a message object of type 'PredefinedMovementSrv-response"
  "bfd977d15515237025d35499f550165a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PredefinedMovementSrv-response>)))
  "Returns full string definition for message of type '<PredefinedMovementSrv-response>"
  (cl:format cl:nil "~%bool sucess~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PredefinedMovementSrv-response)))
  "Returns full string definition for message of type 'PredefinedMovementSrv-response"
  (cl:format cl:nil "~%bool sucess~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PredefinedMovementSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PredefinedMovementSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PredefinedMovementSrv-response
    (cl:cons ':sucess (sucess msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PredefinedMovementSrv)))
  'PredefinedMovementSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PredefinedMovementSrv)))
  'PredefinedMovementSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PredefinedMovementSrv)))
  "Returns string type for a service object of type '<PredefinedMovementSrv>"
  "movement_msgs/PredefinedMovementSrv")