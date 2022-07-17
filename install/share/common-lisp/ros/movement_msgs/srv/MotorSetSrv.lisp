; Auto-generated. Do not edit!


(cl:in-package movement_msgs-srv)


;//! \htmlinclude MotorSetSrv-request.msg.html

(cl:defclass <MotorSetSrv-request> (roslisp-msg-protocol:ros-message)
  ((toGazebo
    :reader toGazebo
    :initarg :toGazebo
    :type cl:boolean
    :initform cl:nil)
   (toRobot
    :reader toRobot
    :initarg :toRobot
    :type cl:boolean
    :initform cl:nil)
   (page
    :reader page
    :initarg :page
    :type cl:string
    :initform "")
   (pose
    :reader pose
    :initarg :pose
    :type cl:string
    :initform ""))
)

(cl:defclass MotorSetSrv-request (<MotorSetSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorSetSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorSetSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<MotorSetSrv-request> is deprecated: use movement_msgs-srv:MotorSetSrv-request instead.")))

(cl:ensure-generic-function 'toGazebo-val :lambda-list '(m))
(cl:defmethod toGazebo-val ((m <MotorSetSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:toGazebo-val is deprecated.  Use movement_msgs-srv:toGazebo instead.")
  (toGazebo m))

(cl:ensure-generic-function 'toRobot-val :lambda-list '(m))
(cl:defmethod toRobot-val ((m <MotorSetSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:toRobot-val is deprecated.  Use movement_msgs-srv:toRobot instead.")
  (toRobot m))

(cl:ensure-generic-function 'page-val :lambda-list '(m))
(cl:defmethod page-val ((m <MotorSetSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:page-val is deprecated.  Use movement_msgs-srv:page instead.")
  (page m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <MotorSetSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:pose-val is deprecated.  Use movement_msgs-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorSetSrv-request>) ostream)
  "Serializes a message object of type '<MotorSetSrv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'toGazebo) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'toRobot) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'page))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'page))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'pose))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'pose))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorSetSrv-request>) istream)
  "Deserializes a message object of type '<MotorSetSrv-request>"
    (cl:setf (cl:slot-value msg 'toGazebo) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'toRobot) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'page) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'page) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pose) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'pose) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorSetSrv-request>)))
  "Returns string type for a service object of type '<MotorSetSrv-request>"
  "movement_msgs/MotorSetSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorSetSrv-request)))
  "Returns string type for a service object of type 'MotorSetSrv-request"
  "movement_msgs/MotorSetSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorSetSrv-request>)))
  "Returns md5sum for a message object of type '<MotorSetSrv-request>"
  "ec1859e255b743457ecbab4cc3de4b47")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorSetSrv-request)))
  "Returns md5sum for a message object of type 'MotorSetSrv-request"
  "ec1859e255b743457ecbab4cc3de4b47")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorSetSrv-request>)))
  "Returns full string definition for message of type '<MotorSetSrv-request>"
  (cl:format cl:nil "bool   toGazebo~%bool   toRobot~%string page~%string pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorSetSrv-request)))
  "Returns full string definition for message of type 'MotorSetSrv-request"
  (cl:format cl:nil "bool   toGazebo~%bool   toRobot~%string page~%string pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorSetSrv-request>))
  (cl:+ 0
     1
     1
     4 (cl:length (cl:slot-value msg 'page))
     4 (cl:length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorSetSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorSetSrv-request
    (cl:cons ':toGazebo (toGazebo msg))
    (cl:cons ':toRobot (toRobot msg))
    (cl:cons ':page (page msg))
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude MotorSetSrv-response.msg.html

(cl:defclass <MotorSetSrv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass MotorSetSrv-response (<MotorSetSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorSetSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorSetSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<MotorSetSrv-response> is deprecated: use movement_msgs-srv:MotorSetSrv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorSetSrv-response>) ostream)
  "Serializes a message object of type '<MotorSetSrv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorSetSrv-response>) istream)
  "Deserializes a message object of type '<MotorSetSrv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorSetSrv-response>)))
  "Returns string type for a service object of type '<MotorSetSrv-response>"
  "movement_msgs/MotorSetSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorSetSrv-response)))
  "Returns string type for a service object of type 'MotorSetSrv-response"
  "movement_msgs/MotorSetSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorSetSrv-response>)))
  "Returns md5sum for a message object of type '<MotorSetSrv-response>"
  "ec1859e255b743457ecbab4cc3de4b47")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorSetSrv-response)))
  "Returns md5sum for a message object of type 'MotorSetSrv-response"
  "ec1859e255b743457ecbab4cc3de4b47")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorSetSrv-response>)))
  "Returns full string definition for message of type '<MotorSetSrv-response>"
  (cl:format cl:nil "~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorSetSrv-response)))
  "Returns full string definition for message of type 'MotorSetSrv-response"
  (cl:format cl:nil "~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorSetSrv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorSetSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorSetSrv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MotorSetSrv)))
  'MotorSetSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MotorSetSrv)))
  'MotorSetSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorSetSrv)))
  "Returns string type for a service object of type '<MotorSetSrv>"
  "movement_msgs/MotorSetSrv")