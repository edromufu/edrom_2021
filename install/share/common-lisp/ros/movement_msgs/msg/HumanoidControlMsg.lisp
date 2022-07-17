; Auto-generated. Do not edit!


(cl:in-package movement_msgs-msg)


;//! \htmlinclude HumanoidControlMsg.msg.html

(cl:defclass <HumanoidControlMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (ctrl_flag
    :reader ctrl_flag
    :initarg :ctrl_flag
    :type cl:boolean
    :initform cl:nil)
   (arm_ctrl_flag
    :reader arm_ctrl_flag
    :initarg :arm_ctrl_flag
    :type cl:boolean
    :initform cl:nil)
   (torso_ctrl_flag
    :reader torso_ctrl_flag
    :initarg :torso_ctrl_flag
    :type cl:boolean
    :initform cl:nil)
   (phase_ctrl_flag
    :reader phase_ctrl_flag
    :initarg :phase_ctrl_flag
    :type cl:boolean
    :initform cl:nil)
   (slope_ctrl_flag
    :reader slope_ctrl_flag
    :initarg :slope_ctrl_flag
    :type cl:boolean
    :initform cl:nil)
   (foot_ctrl_flag
    :reader foot_ctrl_flag
    :initarg :foot_ctrl_flag
    :type cl:boolean
    :initform cl:nil)
   (torsoAddX
    :reader torsoAddX
    :initarg :torsoAddX
    :type cl:float
    :initform 0.0)
   (torsoAddY
    :reader torsoAddY
    :initarg :torsoAddY
    :type cl:float
    :initform 0.0)
   (torsoAddZ
    :reader torsoAddZ
    :initarg :torsoAddZ
    :type cl:float
    :initform 0.0)
   (slope
    :reader slope
    :initarg :slope
    :type cl:float
    :initform 0.0)
   (rFootFac
    :reader rFootFac
    :initarg :rFootFac
    :type movement_msgs-msg:EndEffMsg
    :initform (cl:make-instance 'movement_msgs-msg:EndEffMsg))
   (lFootFac
    :reader lFootFac
    :initarg :lFootFac
    :type movement_msgs-msg:EndEffMsg
    :initform (cl:make-instance 'movement_msgs-msg:EndEffMsg))
   (phaseFac
    :reader phaseFac
    :initarg :phaseFac
    :type cl:float
    :initform 0.0)
   (armAdd
    :reader armAdd
    :initarg :armAdd
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
    :initform 0.0))
)

(cl:defclass HumanoidControlMsg (<HumanoidControlMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HumanoidControlMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HumanoidControlMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-msg:<HumanoidControlMsg> is deprecated: use movement_msgs-msg:HumanoidControlMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:header-val is deprecated.  Use movement_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'ctrl_flag-val :lambda-list '(m))
(cl:defmethod ctrl_flag-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:ctrl_flag-val is deprecated.  Use movement_msgs-msg:ctrl_flag instead.")
  (ctrl_flag m))

(cl:ensure-generic-function 'arm_ctrl_flag-val :lambda-list '(m))
(cl:defmethod arm_ctrl_flag-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:arm_ctrl_flag-val is deprecated.  Use movement_msgs-msg:arm_ctrl_flag instead.")
  (arm_ctrl_flag m))

(cl:ensure-generic-function 'torso_ctrl_flag-val :lambda-list '(m))
(cl:defmethod torso_ctrl_flag-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:torso_ctrl_flag-val is deprecated.  Use movement_msgs-msg:torso_ctrl_flag instead.")
  (torso_ctrl_flag m))

(cl:ensure-generic-function 'phase_ctrl_flag-val :lambda-list '(m))
(cl:defmethod phase_ctrl_flag-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:phase_ctrl_flag-val is deprecated.  Use movement_msgs-msg:phase_ctrl_flag instead.")
  (phase_ctrl_flag m))

(cl:ensure-generic-function 'slope_ctrl_flag-val :lambda-list '(m))
(cl:defmethod slope_ctrl_flag-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:slope_ctrl_flag-val is deprecated.  Use movement_msgs-msg:slope_ctrl_flag instead.")
  (slope_ctrl_flag m))

(cl:ensure-generic-function 'foot_ctrl_flag-val :lambda-list '(m))
(cl:defmethod foot_ctrl_flag-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:foot_ctrl_flag-val is deprecated.  Use movement_msgs-msg:foot_ctrl_flag instead.")
  (foot_ctrl_flag m))

(cl:ensure-generic-function 'torsoAddX-val :lambda-list '(m))
(cl:defmethod torsoAddX-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:torsoAddX-val is deprecated.  Use movement_msgs-msg:torsoAddX instead.")
  (torsoAddX m))

(cl:ensure-generic-function 'torsoAddY-val :lambda-list '(m))
(cl:defmethod torsoAddY-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:torsoAddY-val is deprecated.  Use movement_msgs-msg:torsoAddY instead.")
  (torsoAddY m))

(cl:ensure-generic-function 'torsoAddZ-val :lambda-list '(m))
(cl:defmethod torsoAddZ-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:torsoAddZ-val is deprecated.  Use movement_msgs-msg:torsoAddZ instead.")
  (torsoAddZ m))

(cl:ensure-generic-function 'slope-val :lambda-list '(m))
(cl:defmethod slope-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:slope-val is deprecated.  Use movement_msgs-msg:slope instead.")
  (slope m))

(cl:ensure-generic-function 'rFootFac-val :lambda-list '(m))
(cl:defmethod rFootFac-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:rFootFac-val is deprecated.  Use movement_msgs-msg:rFootFac instead.")
  (rFootFac m))

(cl:ensure-generic-function 'lFootFac-val :lambda-list '(m))
(cl:defmethod lFootFac-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:lFootFac-val is deprecated.  Use movement_msgs-msg:lFootFac instead.")
  (lFootFac m))

(cl:ensure-generic-function 'phaseFac-val :lambda-list '(m))
(cl:defmethod phaseFac-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:phaseFac-val is deprecated.  Use movement_msgs-msg:phaseFac instead.")
  (phaseFac m))

(cl:ensure-generic-function 'armAdd-val :lambda-list '(m))
(cl:defmethod armAdd-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:armAdd-val is deprecated.  Use movement_msgs-msg:armAdd instead.")
  (armAdd m))

(cl:ensure-generic-function 'delayR-val :lambda-list '(m))
(cl:defmethod delayR-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:delayR-val is deprecated.  Use movement_msgs-msg:delayR instead.")
  (delayR m))

(cl:ensure-generic-function 'delayL-val :lambda-list '(m))
(cl:defmethod delayL-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:delayL-val is deprecated.  Use movement_msgs-msg:delayL instead.")
  (delayL m))

(cl:ensure-generic-function 'delayAll-val :lambda-list '(m))
(cl:defmethod delayAll-val ((m <HumanoidControlMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:delayAll-val is deprecated.  Use movement_msgs-msg:delayAll instead.")
  (delayAll m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HumanoidControlMsg>) ostream)
  "Serializes a message object of type '<HumanoidControlMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ctrl_flag) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'arm_ctrl_flag) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'torso_ctrl_flag) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'phase_ctrl_flag) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'slope_ctrl_flag) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'foot_ctrl_flag) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'torsoAddX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'torsoAddY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'torsoAddZ))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'slope))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rFootFac) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'lFootFac) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'phaseFac))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'armAdd))))
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HumanoidControlMsg>) istream)
  "Deserializes a message object of type '<HumanoidControlMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'ctrl_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'arm_ctrl_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'torso_ctrl_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'phase_ctrl_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'slope_ctrl_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'foot_ctrl_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'torsoAddX) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'torsoAddY) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'torsoAddZ) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'slope) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rFootFac) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'lFootFac) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'phaseFac) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'armAdd) (roslisp-utils:decode-double-float-bits bits)))
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HumanoidControlMsg>)))
  "Returns string type for a message object of type '<HumanoidControlMsg>"
  "movement_msgs/HumanoidControlMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HumanoidControlMsg)))
  "Returns string type for a message object of type 'HumanoidControlMsg"
  "movement_msgs/HumanoidControlMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HumanoidControlMsg>)))
  "Returns md5sum for a message object of type '<HumanoidControlMsg>"
  "0b7c6a6b1b062af7f2563f72e33b0aab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HumanoidControlMsg)))
  "Returns md5sum for a message object of type 'HumanoidControlMsg"
  "0b7c6a6b1b062af7f2563f72e33b0aab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HumanoidControlMsg>)))
  "Returns full string definition for message of type '<HumanoidControlMsg>"
  (cl:format cl:nil "Header  header~%bool    ctrl_flag  ~%bool    arm_ctrl_flag~%bool    torso_ctrl_flag ~%bool    phase_ctrl_flag ~%bool    slope_ctrl_flag ~%bool    foot_ctrl_flag ~%~%float64 torsoAddX~%float64 torsoAddY~%float64 torsoAddZ~%~%float64 slope~%~%movement_msgs/EndEffMsg  rFootFac~%movement_msgs/EndEffMsg  lFootFac~%~%float64 phaseFac~%~%~%float64 armAdd~%~%~%float64 delayR~%float64 delayL~%float64 delayAll~%~%~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: movement_msgs/EndEffMsg~%geometry_msgs/Point  pos~%geometry_msgs/Point  vel~%geometry_msgs/Point  acc~%geometry_msgs/Point  rot~%int32                type~%int32                flag~%float64              dt~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HumanoidControlMsg)))
  "Returns full string definition for message of type 'HumanoidControlMsg"
  (cl:format cl:nil "Header  header~%bool    ctrl_flag  ~%bool    arm_ctrl_flag~%bool    torso_ctrl_flag ~%bool    phase_ctrl_flag ~%bool    slope_ctrl_flag ~%bool    foot_ctrl_flag ~%~%float64 torsoAddX~%float64 torsoAddY~%float64 torsoAddZ~%~%float64 slope~%~%movement_msgs/EndEffMsg  rFootFac~%movement_msgs/EndEffMsg  lFootFac~%~%float64 phaseFac~%~%~%float64 armAdd~%~%~%float64 delayR~%float64 delayL~%float64 delayAll~%~%~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: movement_msgs/EndEffMsg~%geometry_msgs/Point  pos~%geometry_msgs/Point  vel~%geometry_msgs/Point  acc~%geometry_msgs/Point  rot~%int32                type~%int32                flag~%float64              dt~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HumanoidControlMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     1
     1
     1
     8
     8
     8
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rFootFac))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'lFootFac))
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HumanoidControlMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'HumanoidControlMsg
    (cl:cons ':header (header msg))
    (cl:cons ':ctrl_flag (ctrl_flag msg))
    (cl:cons ':arm_ctrl_flag (arm_ctrl_flag msg))
    (cl:cons ':torso_ctrl_flag (torso_ctrl_flag msg))
    (cl:cons ':phase_ctrl_flag (phase_ctrl_flag msg))
    (cl:cons ':slope_ctrl_flag (slope_ctrl_flag msg))
    (cl:cons ':foot_ctrl_flag (foot_ctrl_flag msg))
    (cl:cons ':torsoAddX (torsoAddX msg))
    (cl:cons ':torsoAddY (torsoAddY msg))
    (cl:cons ':torsoAddZ (torsoAddZ msg))
    (cl:cons ':slope (slope msg))
    (cl:cons ':rFootFac (rFootFac msg))
    (cl:cons ':lFootFac (lFootFac msg))
    (cl:cons ':phaseFac (phaseFac msg))
    (cl:cons ':armAdd (armAdd msg))
    (cl:cons ':delayR (delayR msg))
    (cl:cons ':delayL (delayL msg))
    (cl:cons ':delayAll (delayAll msg))
))
