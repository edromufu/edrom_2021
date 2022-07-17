; Auto-generated. Do not edit!


(cl:in-package movement_msgs-msg)


;//! \htmlinclude MotorDatasMsg.msg.html

(cl:defclass <MotorDatasMsg> (roslisp-msg-protocol:ros-message)
  ((left_hip_yaw
    :reader left_hip_yaw
    :initarg :left_hip_yaw
    :type cl:float
    :initform 0.0)
   (left_hip_pitch
    :reader left_hip_pitch
    :initarg :left_hip_pitch
    :type cl:float
    :initform 0.0)
   (left_hip_roll
    :reader left_hip_roll
    :initarg :left_hip_roll
    :type cl:float
    :initform 0.0)
   (left_knee
    :reader left_knee
    :initarg :left_knee
    :type cl:float
    :initform 0.0)
   (left_ankle_pitch
    :reader left_ankle_pitch
    :initarg :left_ankle_pitch
    :type cl:float
    :initform 0.0)
   (left_ankle_roll
    :reader left_ankle_roll
    :initarg :left_ankle_roll
    :type cl:float
    :initform 0.0)
   (right_hip_yaw
    :reader right_hip_yaw
    :initarg :right_hip_yaw
    :type cl:float
    :initform 0.0)
   (right_hip_pitch
    :reader right_hip_pitch
    :initarg :right_hip_pitch
    :type cl:float
    :initform 0.0)
   (right_hip_roll
    :reader right_hip_roll
    :initarg :right_hip_roll
    :type cl:float
    :initform 0.0)
   (right_knee
    :reader right_knee
    :initarg :right_knee
    :type cl:float
    :initform 0.0)
   (right_ankle_pitch
    :reader right_ankle_pitch
    :initarg :right_ankle_pitch
    :type cl:float
    :initform 0.0)
   (right_ankle_roll
    :reader right_ankle_roll
    :initarg :right_ankle_roll
    :type cl:float
    :initform 0.0))
)

(cl:defclass MotorDatasMsg (<MotorDatasMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorDatasMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorDatasMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-msg:<MotorDatasMsg> is deprecated: use movement_msgs-msg:MotorDatasMsg instead.")))

(cl:ensure-generic-function 'left_hip_yaw-val :lambda-list '(m))
(cl:defmethod left_hip_yaw-val ((m <MotorDatasMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:left_hip_yaw-val is deprecated.  Use movement_msgs-msg:left_hip_yaw instead.")
  (left_hip_yaw m))

(cl:ensure-generic-function 'left_hip_pitch-val :lambda-list '(m))
(cl:defmethod left_hip_pitch-val ((m <MotorDatasMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:left_hip_pitch-val is deprecated.  Use movement_msgs-msg:left_hip_pitch instead.")
  (left_hip_pitch m))

(cl:ensure-generic-function 'left_hip_roll-val :lambda-list '(m))
(cl:defmethod left_hip_roll-val ((m <MotorDatasMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:left_hip_roll-val is deprecated.  Use movement_msgs-msg:left_hip_roll instead.")
  (left_hip_roll m))

(cl:ensure-generic-function 'left_knee-val :lambda-list '(m))
(cl:defmethod left_knee-val ((m <MotorDatasMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:left_knee-val is deprecated.  Use movement_msgs-msg:left_knee instead.")
  (left_knee m))

(cl:ensure-generic-function 'left_ankle_pitch-val :lambda-list '(m))
(cl:defmethod left_ankle_pitch-val ((m <MotorDatasMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:left_ankle_pitch-val is deprecated.  Use movement_msgs-msg:left_ankle_pitch instead.")
  (left_ankle_pitch m))

(cl:ensure-generic-function 'left_ankle_roll-val :lambda-list '(m))
(cl:defmethod left_ankle_roll-val ((m <MotorDatasMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:left_ankle_roll-val is deprecated.  Use movement_msgs-msg:left_ankle_roll instead.")
  (left_ankle_roll m))

(cl:ensure-generic-function 'right_hip_yaw-val :lambda-list '(m))
(cl:defmethod right_hip_yaw-val ((m <MotorDatasMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:right_hip_yaw-val is deprecated.  Use movement_msgs-msg:right_hip_yaw instead.")
  (right_hip_yaw m))

(cl:ensure-generic-function 'right_hip_pitch-val :lambda-list '(m))
(cl:defmethod right_hip_pitch-val ((m <MotorDatasMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:right_hip_pitch-val is deprecated.  Use movement_msgs-msg:right_hip_pitch instead.")
  (right_hip_pitch m))

(cl:ensure-generic-function 'right_hip_roll-val :lambda-list '(m))
(cl:defmethod right_hip_roll-val ((m <MotorDatasMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:right_hip_roll-val is deprecated.  Use movement_msgs-msg:right_hip_roll instead.")
  (right_hip_roll m))

(cl:ensure-generic-function 'right_knee-val :lambda-list '(m))
(cl:defmethod right_knee-val ((m <MotorDatasMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:right_knee-val is deprecated.  Use movement_msgs-msg:right_knee instead.")
  (right_knee m))

(cl:ensure-generic-function 'right_ankle_pitch-val :lambda-list '(m))
(cl:defmethod right_ankle_pitch-val ((m <MotorDatasMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:right_ankle_pitch-val is deprecated.  Use movement_msgs-msg:right_ankle_pitch instead.")
  (right_ankle_pitch m))

(cl:ensure-generic-function 'right_ankle_roll-val :lambda-list '(m))
(cl:defmethod right_ankle_roll-val ((m <MotorDatasMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:right_ankle_roll-val is deprecated.  Use movement_msgs-msg:right_ankle_roll instead.")
  (right_ankle_roll m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorDatasMsg>) ostream)
  "Serializes a message object of type '<MotorDatasMsg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_hip_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_hip_pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_hip_roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_knee))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_ankle_pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_ankle_roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'right_hip_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'right_hip_pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'right_hip_roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'right_knee))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'right_ankle_pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'right_ankle_roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorDatasMsg>) istream)
  "Deserializes a message object of type '<MotorDatasMsg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_hip_yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_hip_pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_hip_roll) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_knee) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_ankle_pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_ankle_roll) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_hip_yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_hip_pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_hip_roll) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_knee) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_ankle_pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_ankle_roll) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorDatasMsg>)))
  "Returns string type for a message object of type '<MotorDatasMsg>"
  "movement_msgs/MotorDatasMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorDatasMsg)))
  "Returns string type for a message object of type 'MotorDatasMsg"
  "movement_msgs/MotorDatasMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorDatasMsg>)))
  "Returns md5sum for a message object of type '<MotorDatasMsg>"
  "a20165a6a0e94f4795ab484f0c0e748e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorDatasMsg)))
  "Returns md5sum for a message object of type 'MotorDatasMsg"
  "a20165a6a0e94f4795ab484f0c0e748e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorDatasMsg>)))
  "Returns full string definition for message of type '<MotorDatasMsg>"
  (cl:format cl:nil "float32 left_hip_yaw~%float32 left_hip_pitch~%float32 left_hip_roll~%float32 left_knee~%float32 left_ankle_pitch~%float32 left_ankle_roll~%float32 right_hip_yaw~%float32 right_hip_pitch~%float32 right_hip_roll~%float32 right_knee~%float32 right_ankle_pitch~%float32 right_ankle_roll~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorDatasMsg)))
  "Returns full string definition for message of type 'MotorDatasMsg"
  (cl:format cl:nil "float32 left_hip_yaw~%float32 left_hip_pitch~%float32 left_hip_roll~%float32 left_knee~%float32 left_ankle_pitch~%float32 left_ankle_roll~%float32 right_hip_yaw~%float32 right_hip_pitch~%float32 right_hip_roll~%float32 right_knee~%float32 right_ankle_pitch~%float32 right_ankle_roll~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorDatasMsg>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorDatasMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorDatasMsg
    (cl:cons ':left_hip_yaw (left_hip_yaw msg))
    (cl:cons ':left_hip_pitch (left_hip_pitch msg))
    (cl:cons ':left_hip_roll (left_hip_roll msg))
    (cl:cons ':left_knee (left_knee msg))
    (cl:cons ':left_ankle_pitch (left_ankle_pitch msg))
    (cl:cons ':left_ankle_roll (left_ankle_roll msg))
    (cl:cons ':right_hip_yaw (right_hip_yaw msg))
    (cl:cons ':right_hip_pitch (right_hip_pitch msg))
    (cl:cons ':right_hip_roll (right_hip_roll msg))
    (cl:cons ':right_knee (right_knee msg))
    (cl:cons ':right_ankle_pitch (right_ankle_pitch msg))
    (cl:cons ':right_ankle_roll (right_ankle_roll msg))
))
