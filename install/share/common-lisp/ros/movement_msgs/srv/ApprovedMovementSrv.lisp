; Auto-generated. Do not edit!


(cl:in-package movement_msgs-srv)


;//! \htmlinclude ApprovedMovementSrv-request.msg.html

(cl:defclass <ApprovedMovementSrv-request> (roslisp-msg-protocol:ros-message)
  ((approved_movement
    :reader approved_movement
    :initarg :approved_movement
    :type cl:string
    :initform ""))
)

(cl:defclass ApprovedMovementSrv-request (<ApprovedMovementSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ApprovedMovementSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ApprovedMovementSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<ApprovedMovementSrv-request> is deprecated: use movement_msgs-srv:ApprovedMovementSrv-request instead.")))

(cl:ensure-generic-function 'approved_movement-val :lambda-list '(m))
(cl:defmethod approved_movement-val ((m <ApprovedMovementSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:approved_movement-val is deprecated.  Use movement_msgs-srv:approved_movement instead.")
  (approved_movement m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ApprovedMovementSrv-request>) ostream)
  "Serializes a message object of type '<ApprovedMovementSrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'approved_movement))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'approved_movement))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ApprovedMovementSrv-request>) istream)
  "Deserializes a message object of type '<ApprovedMovementSrv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'approved_movement) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'approved_movement) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ApprovedMovementSrv-request>)))
  "Returns string type for a service object of type '<ApprovedMovementSrv-request>"
  "movement_msgs/ApprovedMovementSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ApprovedMovementSrv-request)))
  "Returns string type for a service object of type 'ApprovedMovementSrv-request"
  "movement_msgs/ApprovedMovementSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ApprovedMovementSrv-request>)))
  "Returns md5sum for a message object of type '<ApprovedMovementSrv-request>"
  "96a28d2e667000a662371cc5689381d0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ApprovedMovementSrv-request)))
  "Returns md5sum for a message object of type 'ApprovedMovementSrv-request"
  "96a28d2e667000a662371cc5689381d0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ApprovedMovementSrv-request>)))
  "Returns full string definition for message of type '<ApprovedMovementSrv-request>"
  (cl:format cl:nil "string approved_movement~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ApprovedMovementSrv-request)))
  "Returns full string definition for message of type 'ApprovedMovementSrv-request"
  (cl:format cl:nil "string approved_movement~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ApprovedMovementSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'approved_movement))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ApprovedMovementSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ApprovedMovementSrv-request
    (cl:cons ':approved_movement (approved_movement msg))
))
;//! \htmlinclude ApprovedMovementSrv-response.msg.html

(cl:defclass <ApprovedMovementSrv-response> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ApprovedMovementSrv-response (<ApprovedMovementSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ApprovedMovementSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ApprovedMovementSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<ApprovedMovementSrv-response> is deprecated: use movement_msgs-srv:ApprovedMovementSrv-response instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <ApprovedMovementSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:response-val is deprecated.  Use movement_msgs-srv:response instead.")
  (response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ApprovedMovementSrv-response>) ostream)
  "Serializes a message object of type '<ApprovedMovementSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'response) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ApprovedMovementSrv-response>) istream)
  "Deserializes a message object of type '<ApprovedMovementSrv-response>"
    (cl:setf (cl:slot-value msg 'response) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ApprovedMovementSrv-response>)))
  "Returns string type for a service object of type '<ApprovedMovementSrv-response>"
  "movement_msgs/ApprovedMovementSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ApprovedMovementSrv-response)))
  "Returns string type for a service object of type 'ApprovedMovementSrv-response"
  "movement_msgs/ApprovedMovementSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ApprovedMovementSrv-response>)))
  "Returns md5sum for a message object of type '<ApprovedMovementSrv-response>"
  "96a28d2e667000a662371cc5689381d0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ApprovedMovementSrv-response)))
  "Returns md5sum for a message object of type 'ApprovedMovementSrv-response"
  "96a28d2e667000a662371cc5689381d0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ApprovedMovementSrv-response>)))
  "Returns full string definition for message of type '<ApprovedMovementSrv-response>"
  (cl:format cl:nil "~%bool response~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ApprovedMovementSrv-response)))
  "Returns full string definition for message of type 'ApprovedMovementSrv-response"
  (cl:format cl:nil "~%bool response~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ApprovedMovementSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ApprovedMovementSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ApprovedMovementSrv-response
    (cl:cons ':response (response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ApprovedMovementSrv)))
  'ApprovedMovementSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ApprovedMovementSrv)))
  'ApprovedMovementSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ApprovedMovementSrv)))
  "Returns string type for a service object of type '<ApprovedMovementSrv>"
  "movement_msgs/ApprovedMovementSrv")