; Auto-generated. Do not edit!


(cl:in-package movement_msgs-srv)


;//! \htmlinclude DynamixelCreatorSrv-request.msg.html

(cl:defclass <DynamixelCreatorSrv-request> (roslisp-msg-protocol:ros-message)
  ((torque
    :reader torque
    :initarg :torque
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil))
   (wish
    :reader wish
    :initarg :wish
    :type cl:string
    :initform ""))
)

(cl:defclass DynamixelCreatorSrv-request (<DynamixelCreatorSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DynamixelCreatorSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DynamixelCreatorSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<DynamixelCreatorSrv-request> is deprecated: use movement_msgs-srv:DynamixelCreatorSrv-request instead.")))

(cl:ensure-generic-function 'torque-val :lambda-list '(m))
(cl:defmethod torque-val ((m <DynamixelCreatorSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:torque-val is deprecated.  Use movement_msgs-srv:torque instead.")
  (torque m))

(cl:ensure-generic-function 'wish-val :lambda-list '(m))
(cl:defmethod wish-val ((m <DynamixelCreatorSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:wish-val is deprecated.  Use movement_msgs-srv:wish instead.")
  (wish m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DynamixelCreatorSrv-request>) ostream)
  "Serializes a message object of type '<DynamixelCreatorSrv-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'torque))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'torque))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'wish))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'wish))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DynamixelCreatorSrv-request>) istream)
  "Deserializes a message object of type '<DynamixelCreatorSrv-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'torque) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'torque)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wish) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'wish) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DynamixelCreatorSrv-request>)))
  "Returns string type for a service object of type '<DynamixelCreatorSrv-request>"
  "movement_msgs/DynamixelCreatorSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DynamixelCreatorSrv-request)))
  "Returns string type for a service object of type 'DynamixelCreatorSrv-request"
  "movement_msgs/DynamixelCreatorSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DynamixelCreatorSrv-request>)))
  "Returns md5sum for a message object of type '<DynamixelCreatorSrv-request>"
  "afc4a102e69ac104a3346382d7f6e9b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DynamixelCreatorSrv-request)))
  "Returns md5sum for a message object of type 'DynamixelCreatorSrv-request"
  "afc4a102e69ac104a3346382d7f6e9b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DynamixelCreatorSrv-request>)))
  "Returns full string definition for message of type '<DynamixelCreatorSrv-request>"
  (cl:format cl:nil "bool[] torque~%string wish ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DynamixelCreatorSrv-request)))
  "Returns full string definition for message of type 'DynamixelCreatorSrv-request"
  (cl:format cl:nil "bool[] torque~%string wish ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DynamixelCreatorSrv-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'torque) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:length (cl:slot-value msg 'wish))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DynamixelCreatorSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DynamixelCreatorSrv-request
    (cl:cons ':torque (torque msg))
    (cl:cons ':wish (wish msg))
))
;//! \htmlinclude DynamixelCreatorSrv-response.msg.html

(cl:defclass <DynamixelCreatorSrv-response> (roslisp-msg-protocol:ros-message)
  ((feedbackPosition
    :reader feedbackPosition
    :initarg :feedbackPosition
    :type (cl:vector cl:float)
   :initform (cl:make-array 20 :element-type 'cl:float :initial-element 0.0))
   (feedbackTorque
    :reader feedbackTorque
    :initarg :feedbackTorque
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 20 :element-type 'cl:boolean :initial-element cl:nil))
   (feedbackVcc
    :reader feedbackVcc
    :initarg :feedbackVcc
    :type (cl:vector cl:float)
   :initform (cl:make-array 20 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass DynamixelCreatorSrv-response (<DynamixelCreatorSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DynamixelCreatorSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DynamixelCreatorSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<DynamixelCreatorSrv-response> is deprecated: use movement_msgs-srv:DynamixelCreatorSrv-response instead.")))

(cl:ensure-generic-function 'feedbackPosition-val :lambda-list '(m))
(cl:defmethod feedbackPosition-val ((m <DynamixelCreatorSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:feedbackPosition-val is deprecated.  Use movement_msgs-srv:feedbackPosition instead.")
  (feedbackPosition m))

(cl:ensure-generic-function 'feedbackTorque-val :lambda-list '(m))
(cl:defmethod feedbackTorque-val ((m <DynamixelCreatorSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:feedbackTorque-val is deprecated.  Use movement_msgs-srv:feedbackTorque instead.")
  (feedbackTorque m))

(cl:ensure-generic-function 'feedbackVcc-val :lambda-list '(m))
(cl:defmethod feedbackVcc-val ((m <DynamixelCreatorSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:feedbackVcc-val is deprecated.  Use movement_msgs-srv:feedbackVcc instead.")
  (feedbackVcc m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DynamixelCreatorSrv-response>) ostream)
  "Serializes a message object of type '<DynamixelCreatorSrv-response>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'feedbackPosition))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'feedbackTorque))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'feedbackVcc))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DynamixelCreatorSrv-response>) istream)
  "Deserializes a message object of type '<DynamixelCreatorSrv-response>"
  (cl:setf (cl:slot-value msg 'feedbackPosition) (cl:make-array 20))
  (cl:let ((vals (cl:slot-value msg 'feedbackPosition)))
    (cl:dotimes (i 20)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'feedbackTorque) (cl:make-array 20))
  (cl:let ((vals (cl:slot-value msg 'feedbackTorque)))
    (cl:dotimes (i 20)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream))))))
  (cl:setf (cl:slot-value msg 'feedbackVcc) (cl:make-array 20))
  (cl:let ((vals (cl:slot-value msg 'feedbackVcc)))
    (cl:dotimes (i 20)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DynamixelCreatorSrv-response>)))
  "Returns string type for a service object of type '<DynamixelCreatorSrv-response>"
  "movement_msgs/DynamixelCreatorSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DynamixelCreatorSrv-response)))
  "Returns string type for a service object of type 'DynamixelCreatorSrv-response"
  "movement_msgs/DynamixelCreatorSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DynamixelCreatorSrv-response>)))
  "Returns md5sum for a message object of type '<DynamixelCreatorSrv-response>"
  "afc4a102e69ac104a3346382d7f6e9b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DynamixelCreatorSrv-response)))
  "Returns md5sum for a message object of type 'DynamixelCreatorSrv-response"
  "afc4a102e69ac104a3346382d7f6e9b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DynamixelCreatorSrv-response>)))
  "Returns full string definition for message of type '<DynamixelCreatorSrv-response>"
  (cl:format cl:nil "float64[20] feedbackPosition~%bool[20] feedbackTorque~%float64[20] feedbackVcc~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DynamixelCreatorSrv-response)))
  "Returns full string definition for message of type 'DynamixelCreatorSrv-response"
  (cl:format cl:nil "float64[20] feedbackPosition~%bool[20] feedbackTorque~%float64[20] feedbackVcc~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DynamixelCreatorSrv-response>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'feedbackPosition) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'feedbackTorque) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'feedbackVcc) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DynamixelCreatorSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DynamixelCreatorSrv-response
    (cl:cons ':feedbackPosition (feedbackPosition msg))
    (cl:cons ':feedbackTorque (feedbackTorque msg))
    (cl:cons ':feedbackVcc (feedbackVcc msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DynamixelCreatorSrv)))
  'DynamixelCreatorSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DynamixelCreatorSrv)))
  'DynamixelCreatorSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DynamixelCreatorSrv)))
  "Returns string type for a service object of type '<DynamixelCreatorSrv>"
  "movement_msgs/DynamixelCreatorSrv")