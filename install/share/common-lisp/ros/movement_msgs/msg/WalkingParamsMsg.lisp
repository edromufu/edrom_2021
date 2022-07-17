; Auto-generated. Do not edit!


(cl:in-package movement_msgs-msg)


;//! \htmlinclude WalkingParamsMsg.msg.html

(cl:defclass <WalkingParamsMsg> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (theta
    :reader theta
    :initarg :theta
    :type cl:float
    :initform 0.0)
   (walk_on
    :reader walk_on
    :initarg :walk_on
    :type cl:float
    :initform 0.0))
)

(cl:defclass WalkingParamsMsg (<WalkingParamsMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WalkingParamsMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WalkingParamsMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-msg:<WalkingParamsMsg> is deprecated: use movement_msgs-msg:WalkingParamsMsg instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <WalkingParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:x-val is deprecated.  Use movement_msgs-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <WalkingParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:y-val is deprecated.  Use movement_msgs-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'theta-val :lambda-list '(m))
(cl:defmethod theta-val ((m <WalkingParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:theta-val is deprecated.  Use movement_msgs-msg:theta instead.")
  (theta m))

(cl:ensure-generic-function 'walk_on-val :lambda-list '(m))
(cl:defmethod walk_on-val ((m <WalkingParamsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:walk_on-val is deprecated.  Use movement_msgs-msg:walk_on instead.")
  (walk_on m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WalkingParamsMsg>) ostream)
  "Serializes a message object of type '<WalkingParamsMsg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'walk_on))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WalkingParamsMsg>) istream)
  "Deserializes a message object of type '<WalkingParamsMsg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'walk_on) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WalkingParamsMsg>)))
  "Returns string type for a message object of type '<WalkingParamsMsg>"
  "movement_msgs/WalkingParamsMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WalkingParamsMsg)))
  "Returns string type for a message object of type 'WalkingParamsMsg"
  "movement_msgs/WalkingParamsMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WalkingParamsMsg>)))
  "Returns md5sum for a message object of type '<WalkingParamsMsg>"
  "82f4c92fc1b771e24c4524e5ac59893f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WalkingParamsMsg)))
  "Returns md5sum for a message object of type 'WalkingParamsMsg"
  "82f4c92fc1b771e24c4524e5ac59893f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WalkingParamsMsg>)))
  "Returns full string definition for message of type '<WalkingParamsMsg>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 theta~%float32 walk_on~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WalkingParamsMsg)))
  "Returns full string definition for message of type 'WalkingParamsMsg"
  (cl:format cl:nil "float32 x~%float32 y~%float32 theta~%float32 walk_on~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WalkingParamsMsg>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WalkingParamsMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'WalkingParamsMsg
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':theta (theta msg))
    (cl:cons ':walk_on (walk_on msg))
))
