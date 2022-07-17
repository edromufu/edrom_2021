; Auto-generated. Do not edit!


(cl:in-package movement_msgs-msg)


;//! \htmlinclude LipParamsMsg.msg.html

(cl:defclass <LipParamsMsg> (roslisp-msg-protocol:ros-message)
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
   (test_mode
    :reader test_mode
    :initarg :test_mode
    :type cl:boolean
    :initform cl:nil)
   (zCCorr
    :reader zCCorr
    :initarg :zCCorr
    :type cl:float
    :initform 0.0)
   (tS
    :reader tS
    :initarg :tS
    :type cl:float
    :initform 0.0)
   (tD
    :reader tD
    :initarg :tD
    :type cl:float
    :initform 0.0)
   (stepH
    :reader stepH
    :initarg :stepH
    :type cl:float
    :initform 0.0)
   (delayR
    :reader delayR
    :initarg :delayR
    :type cl:float
    :initform 0.0)
   (delayL
    :reader delayL
    :initarg :delayL
    :type cl:float
    :initform 0.0)
   (delayAll
    :reader delayAll
    :initarg :delayAll
    :type cl:float
    :initform 0.0)
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

(cl:defclass LipParamsMsg (<LipParamsMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LipParamsMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LipParamsMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-msg:<LipParamsMsg> is deprecated: use movement_msgs-msg:LipParamsMsg instead.")))

(cl:ensure-generic-function 'first_pose-val :lambda-list '(m))
(cl:defmethod first_pose-val ((m <LipParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:first_pose-val is deprecated.  Use movement_msgs-msg:first_pose instead.")
  (first_pose m))

(cl:ensure-generic-function 'move_head-val :lambda-list '(m))
(cl:defmethod move_head-val ((m <LipParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:move_head-val is deprecated.  Use movement_msgs-msg:move_head instead.")
  (move_head m))

(cl:ensure-generic-function 'walk_flag-val :lambda-list '(m))
(cl:defmethod walk_flag-val ((m <LipParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:walk_flag-val is deprecated.  Use movement_msgs-msg:walk_flag instead.")
  (walk_flag m))

(cl:ensure-generic-function 'test_mode-val :lambda-list '(m))
(cl:defmethod test_mode-val ((m <LipParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:test_mode-val is deprecated.  Use movement_msgs-msg:test_mode instead.")
  (test_mode m))

(cl:ensure-generic-function 'zCCorr-val :lambda-list '(m))
(cl:defmethod zCCorr-val ((m <LipParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:zCCorr-val is deprecated.  Use movement_msgs-msg:zCCorr instead.")
  (zCCorr m))

(cl:ensure-generic-function 'tS-val :lambda-list '(m))
(cl:defmethod tS-val ((m <LipParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:tS-val is deprecated.  Use movement_msgs-msg:tS instead.")
  (tS m))

(cl:ensure-generic-function 'tD-val :lambda-list '(m))
(cl:defmethod tD-val ((m <LipParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:tD-val is deprecated.  Use movement_msgs-msg:tD instead.")
  (tD m))

(cl:ensure-generic-function 'stepH-val :lambda-list '(m))
(cl:defmethod stepH-val ((m <LipParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:stepH-val is deprecated.  Use movement_msgs-msg:stepH instead.")
  (stepH m))

(cl:ensure-generic-function 'delayR-val :lambda-list '(m))
(cl:defmethod delayR-val ((m <LipParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:delayR-val is deprecated.  Use movement_msgs-msg:delayR instead.")
  (delayR m))

(cl:ensure-generic-function 'delayL-val :lambda-list '(m))
(cl:defmethod delayL-val ((m <LipParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:delayL-val is deprecated.  Use movement_msgs-msg:delayL instead.")
  (delayL m))

(cl:ensure-generic-function 'delayAll-val :lambda-list '(m))
(cl:defmethod delayAll-val ((m <LipParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:delayAll-val is deprecated.  Use movement_msgs-msg:delayAll instead.")
  (delayAll m))

(cl:ensure-generic-function 'vx-val :lambda-list '(m))
(cl:defmethod vx-val ((m <LipParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:vx-val is deprecated.  Use movement_msgs-msg:vx instead.")
  (vx m))

(cl:ensure-generic-function 'vy-val :lambda-list '(m))
(cl:defmethod vy-val ((m <LipParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:vy-val is deprecated.  Use movement_msgs-msg:vy instead.")
  (vy m))

(cl:ensure-generic-function 'vz-val :lambda-list '(m))
(cl:defmethod vz-val ((m <LipParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:vz-val is deprecated.  Use movement_msgs-msg:vz instead.")
  (vz m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LipParamsMsg>) ostream)
  "Serializes a message object of type '<LipParamsMsg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'first_pose) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'move_head) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'walk_flag) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'test_mode) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'zCCorr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'tS))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'tD))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'stepH))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'delayR))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'delayL))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'delayAll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LipParamsMsg>) istream)
  "Deserializes a message object of type '<LipParamsMsg>"
    (cl:setf (cl:slot-value msg 'first_pose) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'move_head) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'walk_flag) (cl:not (cl:zerop (cl:read-byte istream))))
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
    (cl:setf (cl:slot-value msg 'zCCorr) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tS) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tD) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'stepH) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'delayR) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'delayL) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'delayAll) (roslisp-utils:decode-double-float-bits bits)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LipParamsMsg>)))
  "Returns string type for a message object of type '<LipParamsMsg>"
  "movement_msgs/LipParamsMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LipParamsMsg)))
  "Returns string type for a message object of type 'LipParamsMsg"
  "movement_msgs/LipParamsMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LipParamsMsg>)))
  "Returns md5sum for a message object of type '<LipParamsMsg>"
  "6a778c748371c895283cbab464bdfc2f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LipParamsMsg)))
  "Returns md5sum for a message object of type 'LipParamsMsg"
  "6a778c748371c895283cbab464bdfc2f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LipParamsMsg>)))
  "Returns full string definition for message of type '<LipParamsMsg>"
  (cl:format cl:nil "bool    first_pose~%bool    move_head~%bool    walk_flag~%bool    test_mode~%float64 zCCorr~%float64 tS~%float64 tD~%float64 stepH~%float64 delayR~%float64 delayL~%float64 delayAll~%float64 vx~%float64 vy~%float64 vz~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LipParamsMsg)))
  "Returns full string definition for message of type 'LipParamsMsg"
  (cl:format cl:nil "bool    first_pose~%bool    move_head~%bool    walk_flag~%bool    test_mode~%float64 zCCorr~%float64 tS~%float64 tD~%float64 stepH~%float64 delayR~%float64 delayL~%float64 delayAll~%float64 vx~%float64 vy~%float64 vz~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LipParamsMsg>))
  (cl:+ 0
     1
     1
     1
     1
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LipParamsMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'LipParamsMsg
    (cl:cons ':first_pose (first_pose msg))
    (cl:cons ':move_head (move_head msg))
    (cl:cons ':walk_flag (walk_flag msg))
    (cl:cons ':test_mode (test_mode msg))
    (cl:cons ':zCCorr (zCCorr msg))
    (cl:cons ':tS (tS msg))
    (cl:cons ':tD (tD msg))
    (cl:cons ':stepH (stepH msg))
    (cl:cons ':delayR (delayR msg))
    (cl:cons ':delayL (delayL msg))
    (cl:cons ':delayAll (delayAll msg))
    (cl:cons ':vx (vx msg))
    (cl:cons ':vy (vy msg))
    (cl:cons ':vz (vz msg))
))
