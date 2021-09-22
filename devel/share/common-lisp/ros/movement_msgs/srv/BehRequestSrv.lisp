; Auto-generated. Do not edit!


(cl:in-package movement_msgs-srv)


;//! \htmlinclude BehRequestSrv-request.msg.html

(cl:defclass <BehRequestSrv-request> (roslisp-msg-protocol:ros-message)
  ((category
    :reader category
    :initarg :category
    :type cl:string
    :initform "")
   (kind
    :reader kind
    :initarg :kind
    :type cl:string
    :initform ""))
)

(cl:defclass BehRequestSrv-request (<BehRequestSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BehRequestSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BehRequestSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<BehRequestSrv-request> is deprecated: use movement_msgs-srv:BehRequestSrv-request instead.")))

(cl:ensure-generic-function 'category-val :lambda-list '(m))
(cl:defmethod category-val ((m <BehRequestSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:category-val is deprecated.  Use movement_msgs-srv:category instead.")
  (category m))

(cl:ensure-generic-function 'kind-val :lambda-list '(m))
(cl:defmethod kind-val ((m <BehRequestSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:kind-val is deprecated.  Use movement_msgs-srv:kind instead.")
  (kind m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BehRequestSrv-request>) ostream)
  "Serializes a message object of type '<BehRequestSrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'category))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'category))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'kind))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'kind))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BehRequestSrv-request>) istream)
  "Deserializes a message object of type '<BehRequestSrv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'category) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'category) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'kind) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'kind) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BehRequestSrv-request>)))
  "Returns string type for a service object of type '<BehRequestSrv-request>"
  "movement_msgs/BehRequestSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BehRequestSrv-request)))
  "Returns string type for a service object of type 'BehRequestSrv-request"
  "movement_msgs/BehRequestSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BehRequestSrv-request>)))
  "Returns md5sum for a message object of type '<BehRequestSrv-request>"
  "147c59713af21eb742ab556d1988f274")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BehRequestSrv-request)))
  "Returns md5sum for a message object of type 'BehRequestSrv-request"
  "147c59713af21eb742ab556d1988f274")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BehRequestSrv-request>)))
  "Returns full string definition for message of type '<BehRequestSrv-request>"
  (cl:format cl:nil "string category~%string kind~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BehRequestSrv-request)))
  "Returns full string definition for message of type 'BehRequestSrv-request"
  (cl:format cl:nil "string category~%string kind~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BehRequestSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'category))
     4 (cl:length (cl:slot-value msg 'kind))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BehRequestSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'BehRequestSrv-request
    (cl:cons ':category (category msg))
    (cl:cons ':kind (kind msg))
))
;//! \htmlinclude BehRequestSrv-response.msg.html

(cl:defclass <BehRequestSrv-response> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass BehRequestSrv-response (<BehRequestSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BehRequestSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BehRequestSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<BehRequestSrv-response> is deprecated: use movement_msgs-srv:BehRequestSrv-response instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <BehRequestSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:response-val is deprecated.  Use movement_msgs-srv:response instead.")
  (response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BehRequestSrv-response>) ostream)
  "Serializes a message object of type '<BehRequestSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'response) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BehRequestSrv-response>) istream)
  "Deserializes a message object of type '<BehRequestSrv-response>"
    (cl:setf (cl:slot-value msg 'response) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BehRequestSrv-response>)))
  "Returns string type for a service object of type '<BehRequestSrv-response>"
  "movement_msgs/BehRequestSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BehRequestSrv-response)))
  "Returns string type for a service object of type 'BehRequestSrv-response"
  "movement_msgs/BehRequestSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BehRequestSrv-response>)))
  "Returns md5sum for a message object of type '<BehRequestSrv-response>"
  "147c59713af21eb742ab556d1988f274")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BehRequestSrv-response)))
  "Returns md5sum for a message object of type 'BehRequestSrv-response"
  "147c59713af21eb742ab556d1988f274")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BehRequestSrv-response>)))
  "Returns full string definition for message of type '<BehRequestSrv-response>"
  (cl:format cl:nil "~%bool response~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BehRequestSrv-response)))
  "Returns full string definition for message of type 'BehRequestSrv-response"
  (cl:format cl:nil "~%bool response~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BehRequestSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BehRequestSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'BehRequestSrv-response
    (cl:cons ':response (response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'BehRequestSrv)))
  'BehRequestSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'BehRequestSrv)))
  'BehRequestSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BehRequestSrv)))
  "Returns string type for a service object of type '<BehRequestSrv>"
  "movement_msgs/BehRequestSrv")