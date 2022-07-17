; Auto-generated. Do not edit!


(cl:in-package movement_msgs-srv)


;//! \htmlinclude MovementSrv-request.msg.html

(cl:defclass <MovementSrv-request> (roslisp-msg-protocol:ros-message)
  ((page
    :reader page
    :initarg :page
    :type cl:string
    :initform ""))
)

(cl:defclass MovementSrv-request (<MovementSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovementSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovementSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<MovementSrv-request> is deprecated: use movement_msgs-srv:MovementSrv-request instead.")))

(cl:ensure-generic-function 'page-val :lambda-list '(m))
(cl:defmethod page-val ((m <MovementSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:page-val is deprecated.  Use movement_msgs-srv:page instead.")
  (page m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovementSrv-request>) ostream)
  "Serializes a message object of type '<MovementSrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'page))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'page))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovementSrv-request>) istream)
  "Deserializes a message object of type '<MovementSrv-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovementSrv-request>)))
  "Returns string type for a service object of type '<MovementSrv-request>"
  "movement_msgs/MovementSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovementSrv-request)))
  "Returns string type for a service object of type 'MovementSrv-request"
  "movement_msgs/MovementSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovementSrv-request>)))
  "Returns md5sum for a message object of type '<MovementSrv-request>"
  "4c660c3667764df7d0c43d544ef98351")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovementSrv-request)))
  "Returns md5sum for a message object of type 'MovementSrv-request"
  "4c660c3667764df7d0c43d544ef98351")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovementSrv-request>)))
  "Returns full string definition for message of type '<MovementSrv-request>"
  (cl:format cl:nil "string 		     page~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovementSrv-request)))
  "Returns full string definition for message of type 'MovementSrv-request"
  (cl:format cl:nil "string 		     page~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovementSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'page))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovementSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MovementSrv-request
    (cl:cons ':page (page msg))
))
;//! \htmlinclude MovementSrv-response.msg.html

(cl:defclass <MovementSrv-response> (roslisp-msg-protocol:ros-message)
  ((confirmation
    :reader confirmation
    :initarg :confirmation
    :type cl:string
    :initform "")
   (path
    :reader path
    :initarg :path
    :type cl:string
    :initform ""))
)

(cl:defclass MovementSrv-response (<MovementSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovementSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovementSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<MovementSrv-response> is deprecated: use movement_msgs-srv:MovementSrv-response instead.")))

(cl:ensure-generic-function 'confirmation-val :lambda-list '(m))
(cl:defmethod confirmation-val ((m <MovementSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:confirmation-val is deprecated.  Use movement_msgs-srv:confirmation instead.")
  (confirmation m))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <MovementSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:path-val is deprecated.  Use movement_msgs-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovementSrv-response>) ostream)
  "Serializes a message object of type '<MovementSrv-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'confirmation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'confirmation))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovementSrv-response>) istream)
  "Deserializes a message object of type '<MovementSrv-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'confirmation) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'confirmation) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovementSrv-response>)))
  "Returns string type for a service object of type '<MovementSrv-response>"
  "movement_msgs/MovementSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovementSrv-response)))
  "Returns string type for a service object of type 'MovementSrv-response"
  "movement_msgs/MovementSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovementSrv-response>)))
  "Returns md5sum for a message object of type '<MovementSrv-response>"
  "4c660c3667764df7d0c43d544ef98351")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovementSrv-response)))
  "Returns md5sum for a message object of type 'MovementSrv-response"
  "4c660c3667764df7d0c43d544ef98351")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovementSrv-response>)))
  "Returns full string definition for message of type '<MovementSrv-response>"
  (cl:format cl:nil "string 		     confirmation~%string			     path~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovementSrv-response)))
  "Returns full string definition for message of type 'MovementSrv-response"
  (cl:format cl:nil "string 		     confirmation~%string			     path~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovementSrv-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'confirmation))
     4 (cl:length (cl:slot-value msg 'path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovementSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MovementSrv-response
    (cl:cons ':confirmation (confirmation msg))
    (cl:cons ':path (path msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MovementSrv)))
  'MovementSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MovementSrv)))
  'MovementSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovementSrv)))
  "Returns string type for a service object of type '<MovementSrv>"
  "movement_msgs/MovementSrv")