; Auto-generated. Do not edit!


(cl:in-package behaviour_msgs-srv)


;//! \htmlinclude yamlTransitionSrv-request.msg.html

(cl:defclass <yamlTransitionSrv-request> (roslisp-msg-protocol:ros-message)
  ((decision
    :reader decision
    :initarg :decision
    :type cl:string
    :initform ""))
)

(cl:defclass yamlTransitionSrv-request (<yamlTransitionSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <yamlTransitionSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'yamlTransitionSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name behaviour_msgs-srv:<yamlTransitionSrv-request> is deprecated: use behaviour_msgs-srv:yamlTransitionSrv-request instead.")))

(cl:ensure-generic-function 'decision-val :lambda-list '(m))
(cl:defmethod decision-val ((m <yamlTransitionSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader behaviour_msgs-srv:decision-val is deprecated.  Use behaviour_msgs-srv:decision instead.")
  (decision m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <yamlTransitionSrv-request>) ostream)
  "Serializes a message object of type '<yamlTransitionSrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'decision))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'decision))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <yamlTransitionSrv-request>) istream)
  "Deserializes a message object of type '<yamlTransitionSrv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'decision) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'decision) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<yamlTransitionSrv-request>)))
  "Returns string type for a service object of type '<yamlTransitionSrv-request>"
  "behaviour_msgs/yamlTransitionSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'yamlTransitionSrv-request)))
  "Returns string type for a service object of type 'yamlTransitionSrv-request"
  "behaviour_msgs/yamlTransitionSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<yamlTransitionSrv-request>)))
  "Returns md5sum for a message object of type '<yamlTransitionSrv-request>"
  "74ae6a711767847beb795a6d289ea68e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'yamlTransitionSrv-request)))
  "Returns md5sum for a message object of type 'yamlTransitionSrv-request"
  "74ae6a711767847beb795a6d289ea68e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<yamlTransitionSrv-request>)))
  "Returns full string definition for message of type '<yamlTransitionSrv-request>"
  (cl:format cl:nil "string decision~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'yamlTransitionSrv-request)))
  "Returns full string definition for message of type 'yamlTransitionSrv-request"
  (cl:format cl:nil "string decision~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <yamlTransitionSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'decision))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <yamlTransitionSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'yamlTransitionSrv-request
    (cl:cons ':decision (decision msg))
))
;//! \htmlinclude yamlTransitionSrv-response.msg.html

(cl:defclass <yamlTransitionSrv-response> (roslisp-msg-protocol:ros-message)
  ((confirmation
    :reader confirmation
    :initarg :confirmation
    :type cl:string
    :initform ""))
)

(cl:defclass yamlTransitionSrv-response (<yamlTransitionSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <yamlTransitionSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'yamlTransitionSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name behaviour_msgs-srv:<yamlTransitionSrv-response> is deprecated: use behaviour_msgs-srv:yamlTransitionSrv-response instead.")))

(cl:ensure-generic-function 'confirmation-val :lambda-list '(m))
(cl:defmethod confirmation-val ((m <yamlTransitionSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader behaviour_msgs-srv:confirmation-val is deprecated.  Use behaviour_msgs-srv:confirmation instead.")
  (confirmation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <yamlTransitionSrv-response>) ostream)
  "Serializes a message object of type '<yamlTransitionSrv-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'confirmation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'confirmation))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <yamlTransitionSrv-response>) istream)
  "Deserializes a message object of type '<yamlTransitionSrv-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'confirmation) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'confirmation) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<yamlTransitionSrv-response>)))
  "Returns string type for a service object of type '<yamlTransitionSrv-response>"
  "behaviour_msgs/yamlTransitionSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'yamlTransitionSrv-response)))
  "Returns string type for a service object of type 'yamlTransitionSrv-response"
  "behaviour_msgs/yamlTransitionSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<yamlTransitionSrv-response>)))
  "Returns md5sum for a message object of type '<yamlTransitionSrv-response>"
  "74ae6a711767847beb795a6d289ea68e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'yamlTransitionSrv-response)))
  "Returns md5sum for a message object of type 'yamlTransitionSrv-response"
  "74ae6a711767847beb795a6d289ea68e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<yamlTransitionSrv-response>)))
  "Returns full string definition for message of type '<yamlTransitionSrv-response>"
  (cl:format cl:nil "string confirmation~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'yamlTransitionSrv-response)))
  "Returns full string definition for message of type 'yamlTransitionSrv-response"
  (cl:format cl:nil "string confirmation~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <yamlTransitionSrv-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'confirmation))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <yamlTransitionSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'yamlTransitionSrv-response
    (cl:cons ':confirmation (confirmation msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'yamlTransitionSrv)))
  'yamlTransitionSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'yamlTransitionSrv)))
  'yamlTransitionSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'yamlTransitionSrv)))
  "Returns string type for a service object of type '<yamlTransitionSrv>"
  "behaviour_msgs/yamlTransitionSrv")