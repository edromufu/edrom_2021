; Auto-generated. Do not edit!


(cl:in-package movement_msgs-msg)


;//! \htmlinclude HumanoidPropertiesMsg.msg.html

(cl:defclass <HumanoidPropertiesMsg> (roslisp-msg-protocol:ros-message)
  ((squat
    :reader squat
    :initarg :squat
    :type cl:float
    :initform 0.0)
   (open
    :reader open
    :initarg :open
    :type cl:float
    :initform 0.0)
   (incl
    :reader incl
    :initarg :incl
    :type cl:float
    :initform 0.0)
   (sideIncl
    :reader sideIncl
    :initarg :sideIncl
    :type cl:float
    :initform 0.0)
   (footIncl
    :reader footIncl
    :initarg :footIncl
    :type cl:float
    :initform 0.0)
   (zmpPoint
    :reader zmpPoint
    :initarg :zmpPoint
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (comPoint
    :reader comPoint
    :initarg :comPoint
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (footComPoint
    :reader footComPoint
    :initarg :footComPoint
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (torq
    :reader torq
    :initarg :torq
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass HumanoidPropertiesMsg (<HumanoidPropertiesMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HumanoidPropertiesMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HumanoidPropertiesMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-msg:<HumanoidPropertiesMsg> is deprecated: use movement_msgs-msg:HumanoidPropertiesMsg instead.")))

(cl:ensure-generic-function 'squat-val :lambda-list '(m))
(cl:defmethod squat-val ((m <HumanoidPropertiesMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:squat-val is deprecated.  Use movement_msgs-msg:squat instead.")
  (squat m))

(cl:ensure-generic-function 'open-val :lambda-list '(m))
(cl:defmethod open-val ((m <HumanoidPropertiesMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:open-val is deprecated.  Use movement_msgs-msg:open instead.")
  (open m))

(cl:ensure-generic-function 'incl-val :lambda-list '(m))
(cl:defmethod incl-val ((m <HumanoidPropertiesMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:incl-val is deprecated.  Use movement_msgs-msg:incl instead.")
  (incl m))

(cl:ensure-generic-function 'sideIncl-val :lambda-list '(m))
(cl:defmethod sideIncl-val ((m <HumanoidPropertiesMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:sideIncl-val is deprecated.  Use movement_msgs-msg:sideIncl instead.")
  (sideIncl m))

(cl:ensure-generic-function 'footIncl-val :lambda-list '(m))
(cl:defmethod footIncl-val ((m <HumanoidPropertiesMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:footIncl-val is deprecated.  Use movement_msgs-msg:footIncl instead.")
  (footIncl m))

(cl:ensure-generic-function 'zmpPoint-val :lambda-list '(m))
(cl:defmethod zmpPoint-val ((m <HumanoidPropertiesMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:zmpPoint-val is deprecated.  Use movement_msgs-msg:zmpPoint instead.")
  (zmpPoint m))

(cl:ensure-generic-function 'comPoint-val :lambda-list '(m))
(cl:defmethod comPoint-val ((m <HumanoidPropertiesMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:comPoint-val is deprecated.  Use movement_msgs-msg:comPoint instead.")
  (comPoint m))

(cl:ensure-generic-function 'footComPoint-val :lambda-list '(m))
(cl:defmethod footComPoint-val ((m <HumanoidPropertiesMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:footComPoint-val is deprecated.  Use movement_msgs-msg:footComPoint instead.")
  (footComPoint m))

(cl:ensure-generic-function 'torq-val :lambda-list '(m))
(cl:defmethod torq-val ((m <HumanoidPropertiesMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:torq-val is deprecated.  Use movement_msgs-msg:torq instead.")
  (torq m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HumanoidPropertiesMsg>) ostream)
  "Serializes a message object of type '<HumanoidPropertiesMsg>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'squat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'open))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'incl))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'sideIncl))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'footIncl))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'zmpPoint) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'comPoint) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'footComPoint) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'torq))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'torq))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HumanoidPropertiesMsg>) istream)
  "Deserializes a message object of type '<HumanoidPropertiesMsg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'squat) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'open) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'incl) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sideIncl) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'footIncl) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'zmpPoint) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'comPoint) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'footComPoint) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'torq) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'torq)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HumanoidPropertiesMsg>)))
  "Returns string type for a message object of type '<HumanoidPropertiesMsg>"
  "movement_msgs/HumanoidPropertiesMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HumanoidPropertiesMsg)))
  "Returns string type for a message object of type 'HumanoidPropertiesMsg"
  "movement_msgs/HumanoidPropertiesMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HumanoidPropertiesMsg>)))
  "Returns md5sum for a message object of type '<HumanoidPropertiesMsg>"
  "ed5d141b03975d3cb4615c633a218029")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HumanoidPropertiesMsg)))
  "Returns md5sum for a message object of type 'HumanoidPropertiesMsg"
  "ed5d141b03975d3cb4615c633a218029")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HumanoidPropertiesMsg>)))
  "Returns full string definition for message of type '<HumanoidPropertiesMsg>"
  (cl:format cl:nil "float64               squat~%float64               open~%float64               incl~%float64               sideIncl~%float64               footIncl~%geometry_msgs/Point  zmpPoint~%geometry_msgs/Point  comPoint~%geometry_msgs/Point  footComPoint~%float64[]            torq~%~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HumanoidPropertiesMsg)))
  "Returns full string definition for message of type 'HumanoidPropertiesMsg"
  (cl:format cl:nil "float64               squat~%float64               open~%float64               incl~%float64               sideIncl~%float64               footIncl~%geometry_msgs/Point  zmpPoint~%geometry_msgs/Point  comPoint~%geometry_msgs/Point  footComPoint~%float64[]            torq~%~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HumanoidPropertiesMsg>))
  (cl:+ 0
     8
     8
     8
     8
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'zmpPoint))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'comPoint))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'footComPoint))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'torq) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HumanoidPropertiesMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'HumanoidPropertiesMsg
    (cl:cons ':squat (squat msg))
    (cl:cons ':open (open msg))
    (cl:cons ':incl (incl msg))
    (cl:cons ':sideIncl (sideIncl msg))
    (cl:cons ':footIncl (footIncl msg))
    (cl:cons ':zmpPoint (zmpPoint msg))
    (cl:cons ':comPoint (comPoint msg))
    (cl:cons ':footComPoint (footComPoint msg))
    (cl:cons ':torq (torq msg))
))
