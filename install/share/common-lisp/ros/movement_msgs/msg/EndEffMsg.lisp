; Auto-generated. Do not edit!


(cl:in-package movement_msgs-msg)


;//! \htmlinclude EndEffMsg.msg.html

(cl:defclass <EndEffMsg> (roslisp-msg-protocol:ros-message)
  ((pos
    :reader pos
    :initarg :pos
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (vel
    :reader vel
    :initarg :vel
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (acc
    :reader acc
    :initarg :acc
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (rot
    :reader rot
    :initarg :rot
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (type
    :reader type
    :initarg :type
    :type cl:integer
    :initform 0)
   (flag
    :reader flag
    :initarg :flag
    :type cl:integer
    :initform 0)
   (dt
    :reader dt
    :initarg :dt
    :type cl:float
    :initform 0.0))
)

(cl:defclass EndEffMsg (<EndEffMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EndEffMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EndEffMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-msg:<EndEffMsg> is deprecated: use movement_msgs-msg:EndEffMsg instead.")))

(cl:ensure-generic-function 'pos-val :lambda-list '(m))
(cl:defmethod pos-val ((m <EndEffMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:pos-val is deprecated.  Use movement_msgs-msg:pos instead.")
  (pos m))

(cl:ensure-generic-function 'vel-val :lambda-list '(m))
(cl:defmethod vel-val ((m <EndEffMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:vel-val is deprecated.  Use movement_msgs-msg:vel instead.")
  (vel m))

(cl:ensure-generic-function 'acc-val :lambda-list '(m))
(cl:defmethod acc-val ((m <EndEffMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:acc-val is deprecated.  Use movement_msgs-msg:acc instead.")
  (acc m))

(cl:ensure-generic-function 'rot-val :lambda-list '(m))
(cl:defmethod rot-val ((m <EndEffMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:rot-val is deprecated.  Use movement_msgs-msg:rot instead.")
  (rot m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <EndEffMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:type-val is deprecated.  Use movement_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'flag-val :lambda-list '(m))
(cl:defmethod flag-val ((m <EndEffMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:flag-val is deprecated.  Use movement_msgs-msg:flag instead.")
  (flag m))

(cl:ensure-generic-function 'dt-val :lambda-list '(m))
(cl:defmethod dt-val ((m <EndEffMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:dt-val is deprecated.  Use movement_msgs-msg:dt instead.")
  (dt m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EndEffMsg>) ostream)
  "Serializes a message object of type '<EndEffMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pos) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'vel) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'acc) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rot) ostream)
  (cl:let* ((signed (cl:slot-value msg 'type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'flag)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dt))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EndEffMsg>) istream)
  "Deserializes a message object of type '<EndEffMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pos) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'vel) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'acc) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rot) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'flag) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dt) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EndEffMsg>)))
  "Returns string type for a message object of type '<EndEffMsg>"
  "movement_msgs/EndEffMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EndEffMsg)))
  "Returns string type for a message object of type 'EndEffMsg"
  "movement_msgs/EndEffMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EndEffMsg>)))
  "Returns md5sum for a message object of type '<EndEffMsg>"
  "25f406f2d522d107819391a084c12896")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EndEffMsg)))
  "Returns md5sum for a message object of type 'EndEffMsg"
  "25f406f2d522d107819391a084c12896")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EndEffMsg>)))
  "Returns full string definition for message of type '<EndEffMsg>"
  (cl:format cl:nil "geometry_msgs/Point  pos~%geometry_msgs/Point  vel~%geometry_msgs/Point  acc~%geometry_msgs/Point  rot~%int32                type~%int32                flag~%float64              dt~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EndEffMsg)))
  "Returns full string definition for message of type 'EndEffMsg"
  (cl:format cl:nil "geometry_msgs/Point  pos~%geometry_msgs/Point  vel~%geometry_msgs/Point  acc~%geometry_msgs/Point  rot~%int32                type~%int32                flag~%float64              dt~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EndEffMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pos))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'vel))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'acc))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rot))
     4
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EndEffMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'EndEffMsg
    (cl:cons ':pos (pos msg))
    (cl:cons ':vel (vel msg))
    (cl:cons ':acc (acc msg))
    (cl:cons ':rot (rot msg))
    (cl:cons ':type (type msg))
    (cl:cons ':flag (flag msg))
    (cl:cons ':dt (dt msg))
))
