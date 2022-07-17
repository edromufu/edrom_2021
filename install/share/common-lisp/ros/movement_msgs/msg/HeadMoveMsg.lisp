; Auto-generated. Do not edit!


(cl:in-package movement_msgs-msg)


;//! \htmlinclude HeadMoveMsg.msg.html

(cl:defclass <HeadMoveMsg> (roslisp-msg-protocol:ros-message)
  ((xMove
    :reader xMove
    :initarg :xMove
    :type cl:integer
    :initform 0)
   (yMove
    :reader yMove
    :initarg :yMove
    :type cl:integer
    :initform 0)
   (pos
    :reader pos
    :initarg :pos
    :type cl:fixnum
    :initform 0)
   (xPos
    :reader xPos
    :initarg :xPos
    :type cl:float
    :initform 0.0)
   (yPos
    :reader yPos
    :initarg :yPos
    :type cl:float
    :initform 0.0))
)

(cl:defclass HeadMoveMsg (<HeadMoveMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HeadMoveMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HeadMoveMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-msg:<HeadMoveMsg> is deprecated: use movement_msgs-msg:HeadMoveMsg instead.")))

(cl:ensure-generic-function 'xMove-val :lambda-list '(m))
(cl:defmethod xMove-val ((m <HeadMoveMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:xMove-val is deprecated.  Use movement_msgs-msg:xMove instead.")
  (xMove m))

(cl:ensure-generic-function 'yMove-val :lambda-list '(m))
(cl:defmethod yMove-val ((m <HeadMoveMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:yMove-val is deprecated.  Use movement_msgs-msg:yMove instead.")
  (yMove m))

(cl:ensure-generic-function 'pos-val :lambda-list '(m))
(cl:defmethod pos-val ((m <HeadMoveMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:pos-val is deprecated.  Use movement_msgs-msg:pos instead.")
  (pos m))

(cl:ensure-generic-function 'xPos-val :lambda-list '(m))
(cl:defmethod xPos-val ((m <HeadMoveMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:xPos-val is deprecated.  Use movement_msgs-msg:xPos instead.")
  (xPos m))

(cl:ensure-generic-function 'yPos-val :lambda-list '(m))
(cl:defmethod yPos-val ((m <HeadMoveMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:yPos-val is deprecated.  Use movement_msgs-msg:yPos instead.")
  (yPos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HeadMoveMsg>) ostream)
  "Serializes a message object of type '<HeadMoveMsg>"
  (cl:let* ((signed (cl:slot-value msg 'xMove)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'yMove)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pos)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'xPos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'yPos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HeadMoveMsg>) istream)
  "Deserializes a message object of type '<HeadMoveMsg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'xMove) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yMove) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pos) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xPos) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yPos) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HeadMoveMsg>)))
  "Returns string type for a message object of type '<HeadMoveMsg>"
  "movement_msgs/HeadMoveMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HeadMoveMsg)))
  "Returns string type for a message object of type 'HeadMoveMsg"
  "movement_msgs/HeadMoveMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HeadMoveMsg>)))
  "Returns md5sum for a message object of type '<HeadMoveMsg>"
  "cfc3b4f883111d2901b09d0640ace5ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HeadMoveMsg)))
  "Returns md5sum for a message object of type 'HeadMoveMsg"
  "cfc3b4f883111d2901b09d0640ace5ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HeadMoveMsg>)))
  "Returns full string definition for message of type '<HeadMoveMsg>"
  (cl:format cl:nil "int32    xMove  ~%int32    yMove~%int16	 pos~%float64  xPos~%float64  yPos~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HeadMoveMsg)))
  "Returns full string definition for message of type 'HeadMoveMsg"
  (cl:format cl:nil "int32    xMove  ~%int32    yMove~%int16	 pos~%float64  xPos~%float64  yPos~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HeadMoveMsg>))
  (cl:+ 0
     4
     4
     2
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HeadMoveMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'HeadMoveMsg
    (cl:cons ':xMove (xMove msg))
    (cl:cons ':yMove (yMove msg))
    (cl:cons ':pos (pos msg))
    (cl:cons ':xPos (xPos msg))
    (cl:cons ':yPos (yPos msg))
))
