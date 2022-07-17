; Auto-generated. Do not edit!


(cl:in-package movement_msgs-srv)


;//! \htmlinclude MovementStatesSrv-request.msg.html

(cl:defclass <MovementStatesSrv-request> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type cl:string
    :initform ""))
)

(cl:defclass MovementStatesSrv-request (<MovementStatesSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovementStatesSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovementStatesSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<MovementStatesSrv-request> is deprecated: use movement_msgs-srv:MovementStatesSrv-request instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <MovementStatesSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:state-val is deprecated.  Use movement_msgs-srv:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovementStatesSrv-request>) ostream)
  "Serializes a message object of type '<MovementStatesSrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'state))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovementStatesSrv-request>) istream)
  "Deserializes a message object of type '<MovementStatesSrv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'state) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovementStatesSrv-request>)))
  "Returns string type for a service object of type '<MovementStatesSrv-request>"
  "movement_msgs/MovementStatesSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovementStatesSrv-request)))
  "Returns string type for a service object of type 'MovementStatesSrv-request"
  "movement_msgs/MovementStatesSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovementStatesSrv-request>)))
  "Returns md5sum for a message object of type '<MovementStatesSrv-request>"
  "745fac47da8f3252744504f4a4bc2fe8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovementStatesSrv-request)))
  "Returns md5sum for a message object of type 'MovementStatesSrv-request"
  "745fac47da8f3252744504f4a4bc2fe8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovementStatesSrv-request>)))
  "Returns full string definition for message of type '<MovementStatesSrv-request>"
  (cl:format cl:nil "string state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovementStatesSrv-request)))
  "Returns full string definition for message of type 'MovementStatesSrv-request"
  (cl:format cl:nil "string state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovementStatesSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovementStatesSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MovementStatesSrv-request
    (cl:cons ':state (state msg))
))
;//! \htmlinclude MovementStatesSrv-response.msg.html

(cl:defclass <MovementStatesSrv-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MovementStatesSrv-response (<MovementStatesSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovementStatesSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovementStatesSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<MovementStatesSrv-response> is deprecated: use movement_msgs-srv:MovementStatesSrv-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <MovementStatesSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:status-val is deprecated.  Use movement_msgs-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovementStatesSrv-response>) ostream)
  "Serializes a message object of type '<MovementStatesSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovementStatesSrv-response>) istream)
  "Deserializes a message object of type '<MovementStatesSrv-response>"
    (cl:setf (cl:slot-value msg 'status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovementStatesSrv-response>)))
  "Returns string type for a service object of type '<MovementStatesSrv-response>"
  "movement_msgs/MovementStatesSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovementStatesSrv-response)))
  "Returns string type for a service object of type 'MovementStatesSrv-response"
  "movement_msgs/MovementStatesSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovementStatesSrv-response>)))
  "Returns md5sum for a message object of type '<MovementStatesSrv-response>"
  "745fac47da8f3252744504f4a4bc2fe8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovementStatesSrv-response)))
  "Returns md5sum for a message object of type 'MovementStatesSrv-response"
  "745fac47da8f3252744504f4a4bc2fe8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovementStatesSrv-response>)))
  "Returns full string definition for message of type '<MovementStatesSrv-response>"
  (cl:format cl:nil "bool status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovementStatesSrv-response)))
  "Returns full string definition for message of type 'MovementStatesSrv-response"
  (cl:format cl:nil "bool status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovementStatesSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovementStatesSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MovementStatesSrv-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MovementStatesSrv)))
  'MovementStatesSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MovementStatesSrv)))
  'MovementStatesSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovementStatesSrv)))
  "Returns string type for a service object of type '<MovementStatesSrv>"
  "movement_msgs/MovementStatesSrv")