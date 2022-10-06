; Auto-generated. Do not edit!


(cl:in-package movement_msgs-msg)


;//! \htmlinclude BehRequestInterface.msg.html

(cl:defclass <BehRequestInterface> (roslisp-msg-protocol:ros-message)
  ((required_movement
    :reader required_movement
    :initarg :required_movement
    :type cl:string
    :initform "")
   (required_status
    :reader required_status
    :initarg :required_status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass BehRequestInterface (<BehRequestInterface>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BehRequestInterface>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BehRequestInterface)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-msg:<BehRequestInterface> is deprecated: use movement_msgs-msg:BehRequestInterface instead.")))

(cl:ensure-generic-function 'required_movement-val :lambda-list '(m))
(cl:defmethod required_movement-val ((m <BehRequestInterface>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:required_movement-val is deprecated.  Use movement_msgs-msg:required_movement instead.")
  (required_movement m))

(cl:ensure-generic-function 'required_status-val :lambda-list '(m))
(cl:defmethod required_status-val ((m <BehRequestInterface>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:required_status-val is deprecated.  Use movement_msgs-msg:required_status instead.")
  (required_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BehRequestInterface>) ostream)
  "Serializes a message object of type '<BehRequestInterface>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'required_movement))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'required_movement))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'required_status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BehRequestInterface>) istream)
  "Deserializes a message object of type '<BehRequestInterface>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'required_movement) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'required_movement) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'required_status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BehRequestInterface>)))
  "Returns string type for a message object of type '<BehRequestInterface>"
  "movement_msgs/BehRequestInterface")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BehRequestInterface)))
  "Returns string type for a message object of type 'BehRequestInterface"
  "movement_msgs/BehRequestInterface")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BehRequestInterface>)))
  "Returns md5sum for a message object of type '<BehRequestInterface>"
  "a8e8e1d113594f935b637fde0165e779")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BehRequestInterface)))
  "Returns md5sum for a message object of type 'BehRequestInterface"
  "a8e8e1d113594f935b637fde0165e779")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BehRequestInterface>)))
  "Returns full string definition for message of type '<BehRequestInterface>"
  (cl:format cl:nil "string required_movement~%bool required_status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BehRequestInterface)))
  "Returns full string definition for message of type 'BehRequestInterface"
  (cl:format cl:nil "string required_movement~%bool required_status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BehRequestInterface>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'required_movement))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BehRequestInterface>))
  "Converts a ROS message object to a list"
  (cl:list 'BehRequestInterface
    (cl:cons ':required_movement (required_movement msg))
    (cl:cons ':required_status (required_status msg))
))
