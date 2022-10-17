; Auto-generated. Do not edit!


(cl:in-package behaviour_msgs-srv)


;//! \htmlinclude service_page-request.msg.html

(cl:defclass <service_page-request> (roslisp-msg-protocol:ros-message)
  ((page
    :reader page
    :initarg :page
    :type cl:string
    :initform ""))
)

(cl:defclass service_page-request (<service_page-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <service_page-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'service_page-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name behaviour_msgs-srv:<service_page-request> is deprecated: use behaviour_msgs-srv:service_page-request instead.")))

(cl:ensure-generic-function 'page-val :lambda-list '(m))
(cl:defmethod page-val ((m <service_page-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader behaviour_msgs-srv:page-val is deprecated.  Use behaviour_msgs-srv:page instead.")
  (page m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <service_page-request>) ostream)
  "Serializes a message object of type '<service_page-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'page))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'page))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <service_page-request>) istream)
  "Deserializes a message object of type '<service_page-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'page) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'page) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<service_page-request>)))
  "Returns string type for a service object of type '<service_page-request>"
  "behaviour_msgs/service_pageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'service_page-request)))
  "Returns string type for a service object of type 'service_page-request"
  "behaviour_msgs/service_pageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<service_page-request>)))
  "Returns md5sum for a message object of type '<service_page-request>"
  "e13299641855e63d2249efe085c03277")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'service_page-request)))
  "Returns md5sum for a message object of type 'service_page-request"
  "e13299641855e63d2249efe085c03277")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<service_page-request>)))
  "Returns full string definition for message of type '<service_page-request>"
  (cl:format cl:nil "string page~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'service_page-request)))
  "Returns full string definition for message of type 'service_page-request"
  (cl:format cl:nil "string page~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <service_page-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'page))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <service_page-request>))
  "Converts a ROS message object to a list"
  (cl:list 'service_page-request
    (cl:cons ':page (page msg))
))
;//! \htmlinclude service_page-response.msg.html

(cl:defclass <service_page-response> (roslisp-msg-protocol:ros-message)
  ((confirmation
    :reader confirmation
    :initarg :confirmation
    :type cl:string
    :initform ""))
)

(cl:defclass service_page-response (<service_page-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <service_page-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'service_page-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name behaviour_msgs-srv:<service_page-response> is deprecated: use behaviour_msgs-srv:service_page-response instead.")))

(cl:ensure-generic-function 'confirmation-val :lambda-list '(m))
(cl:defmethod confirmation-val ((m <service_page-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader behaviour_msgs-srv:confirmation-val is deprecated.  Use behaviour_msgs-srv:confirmation instead.")
  (confirmation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <service_page-response>) ostream)
  "Serializes a message object of type '<service_page-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'confirmation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'confirmation))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <service_page-response>) istream)
  "Deserializes a message object of type '<service_page-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<service_page-response>)))
  "Returns string type for a service object of type '<service_page-response>"
  "behaviour_msgs/service_pageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'service_page-response)))
  "Returns string type for a service object of type 'service_page-response"
  "behaviour_msgs/service_pageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<service_page-response>)))
  "Returns md5sum for a message object of type '<service_page-response>"
  "e13299641855e63d2249efe085c03277")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'service_page-response)))
  "Returns md5sum for a message object of type 'service_page-response"
  "e13299641855e63d2249efe085c03277")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<service_page-response>)))
  "Returns full string definition for message of type '<service_page-response>"
  (cl:format cl:nil "string confirmation~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'service_page-response)))
  "Returns full string definition for message of type 'service_page-response"
  (cl:format cl:nil "string confirmation~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <service_page-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'confirmation))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <service_page-response>))
  "Converts a ROS message object to a list"
  (cl:list 'service_page-response
    (cl:cons ':confirmation (confirmation msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'service_page)))
  'service_page-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'service_page)))
  'service_page-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'service_page)))
  "Returns string type for a service object of type '<service_page>"
  "behaviour_msgs/service_page")