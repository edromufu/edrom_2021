; Auto-generated. Do not edit!


(cl:in-package movement_msgs-srv)


;//! \htmlinclude LipCmdSrv-request.msg.html

(cl:defclass <LipCmdSrv-request> (roslisp-msg-protocol:ros-message)
  ((first_pose
    :reader first_pose
    :initarg :first_pose
    :type cl:boolean
    :initform cl:nil)
   (move_head
    :reader move_head
    :initarg :move_head
    :type cl:boolean
    :initform cl:nil)
   (walk_flag
    :reader walk_flag
    :initarg :walk_flag
    :type cl:boolean
    :initform cl:nil)
   (reset_walk
    :reader reset_walk
    :initarg :reset_walk
    :type cl:boolean
    :initform cl:nil)
   (test_mode
    :reader test_mode
    :initarg :test_mode
    :type cl:boolean
    :initform cl:nil)
   (vx
    :reader vx
    :initarg :vx
    :type cl:float
    :initform 0.0)
   (vy
    :reader vy
    :initarg :vy
    :type cl:float
    :initform 0.0)
   (vz
    :reader vz
    :initarg :vz
    :type cl:float
    :initform 0.0))
)

(cl:defclass LipCmdSrv-request (<LipCmdSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LipCmdSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LipCmdSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<LipCmdSrv-request> is deprecated: use movement_msgs-srv:LipCmdSrv-request instead.")))

(cl:ensure-generic-function 'first_pose-val :lambda-list '(m))
(cl:defmethod first_pose-val ((m <LipCmdSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:first_pose-val is deprecated.  Use movement_msgs-srv:first_pose instead.")
  (first_pose m))

(cl:ensure-generic-function 'move_head-val :lambda-list '(m))
(cl:defmethod move_head-val ((m <LipCmdSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:move_head-val is deprecated.  Use movement_msgs-srv:move_head instead.")
  (move_head m))

(cl:ensure-generic-function 'walk_flag-val :lambda-list '(m))
(cl:defmethod walk_flag-val ((m <LipCmdSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:walk_flag-val is deprecated.  Use movement_msgs-srv:walk_flag instead.")
  (walk_flag m))

(cl:ensure-generic-function 'reset_walk-val :lambda-list '(m))
(cl:defmethod reset_walk-val ((m <LipCmdSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:reset_walk-val is deprecated.  Use movement_msgs-srv:reset_walk instead.")
  (reset_walk m))

(cl:ensure-generic-function 'test_mode-val :lambda-list '(m))
(cl:defmethod test_mode-val ((m <LipCmdSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:test_mode-val is deprecated.  Use movement_msgs-srv:test_mode instead.")
  (test_mode m))

(cl:ensure-generic-function 'vx-val :lambda-list '(m))
(cl:defmethod vx-val ((m <LipCmdSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:vx-val is deprecated.  Use movement_msgs-srv:vx instead.")
  (vx m))

(cl:ensure-generic-function 'vy-val :lambda-list '(m))
(cl:defmethod vy-val ((m <LipCmdSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:vy-val is deprecated.  Use movement_msgs-srv:vy instead.")
  (vy m))

(cl:ensure-generic-function 'vz-val :lambda-list '(m))
(cl:defmethod vz-val ((m <LipCmdSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:vz-val is deprecated.  Use movement_msgs-srv:vz instead.")
  (vz m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LipCmdSrv-request>) ostream)
  "Serializes a message object of type '<LipCmdSrv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'first_pose) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'move_head) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'walk_flag) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reset_walk) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'test_mode) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LipCmdSrv-request>) istream)
  "Deserializes a message object of type '<LipCmdSrv-request>"
    (cl:setf (cl:slot-value msg 'first_pose) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'move_head) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'walk_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'reset_walk) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'test_mode) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vx) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vy) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vz) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LipCmdSrv-request>)))
  "Returns string type for a service object of type '<LipCmdSrv-request>"
  "movement_msgs/LipCmdSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LipCmdSrv-request)))
  "Returns string type for a service object of type 'LipCmdSrv-request"
  "movement_msgs/LipCmdSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LipCmdSrv-request>)))
  "Returns md5sum for a message object of type '<LipCmdSrv-request>"
  "4433778752b474643548f0d3ce287ab0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LipCmdSrv-request)))
  "Returns md5sum for a message object of type 'LipCmdSrv-request"
  "4433778752b474643548f0d3ce287ab0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LipCmdSrv-request>)))
  "Returns full string definition for message of type '<LipCmdSrv-request>"
  (cl:format cl:nil "bool    first_pose~%bool    move_head~%bool    walk_flag~%bool    reset_walk ~%bool    test_mode~%float64 vx~%float64 vy~%float64 vz~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LipCmdSrv-request)))
  "Returns full string definition for message of type 'LipCmdSrv-request"
  (cl:format cl:nil "bool    first_pose~%bool    move_head~%bool    walk_flag~%bool    reset_walk ~%bool    test_mode~%float64 vx~%float64 vy~%float64 vz~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LipCmdSrv-request>))
  (cl:+ 0
     1
     1
     1
     1
     1
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LipCmdSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LipCmdSrv-request
    (cl:cons ':first_pose (first_pose msg))
    (cl:cons ':move_head (move_head msg))
    (cl:cons ':walk_flag (walk_flag msg))
    (cl:cons ':reset_walk (reset_walk msg))
    (cl:cons ':test_mode (test_mode msg))
    (cl:cons ':vx (vx msg))
    (cl:cons ':vy (vy msg))
    (cl:cons ':vz (vz msg))
))
;//! \htmlinclude LipCmdSrv-response.msg.html

(cl:defclass <LipCmdSrv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass LipCmdSrv-response (<LipCmdSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LipCmdSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LipCmdSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<LipCmdSrv-response> is deprecated: use movement_msgs-srv:LipCmdSrv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LipCmdSrv-response>) ostream)
  "Serializes a message object of type '<LipCmdSrv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LipCmdSrv-response>) istream)
  "Deserializes a message object of type '<LipCmdSrv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LipCmdSrv-response>)))
  "Returns string type for a service object of type '<LipCmdSrv-response>"
  "movement_msgs/LipCmdSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LipCmdSrv-response)))
  "Returns string type for a service object of type 'LipCmdSrv-response"
  "movement_msgs/LipCmdSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LipCmdSrv-response>)))
  "Returns md5sum for a message object of type '<LipCmdSrv-response>"
  "4433778752b474643548f0d3ce287ab0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LipCmdSrv-response)))
  "Returns md5sum for a message object of type 'LipCmdSrv-response"
  "4433778752b474643548f0d3ce287ab0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LipCmdSrv-response>)))
  "Returns full string definition for message of type '<LipCmdSrv-response>"
  (cl:format cl:nil "~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LipCmdSrv-response)))
  "Returns full string definition for message of type 'LipCmdSrv-response"
  (cl:format cl:nil "~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LipCmdSrv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LipCmdSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LipCmdSrv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LipCmdSrv)))
  'LipCmdSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LipCmdSrv)))
  'LipCmdSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LipCmdSrv)))
  "Returns string type for a service object of type '<LipCmdSrv>"
  "movement_msgs/LipCmdSrv")