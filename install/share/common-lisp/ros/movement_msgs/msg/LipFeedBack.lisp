; Auto-generated. Do not edit!


(cl:in-package movement_msgs-msg)


;//! \htmlinclude LipFeedBack.msg.html

(cl:defclass <LipFeedBack> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (comPos
    :reader comPos
    :initarg :comPos
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (comVel
    :reader comVel
    :initarg :comVel
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (comAcc
    :reader comAcc
    :initarg :comAcc
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (footStep
    :reader footStep
    :initarg :footStep
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (footStepR
    :reader footStepR
    :initarg :footStepR
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (zmp
    :reader zmp
    :initarg :zmp
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (footGround
    :reader footGround
    :initarg :footGround
    :type cl:fixnum
    :initform 0)
   (footAir
    :reader footAir
    :initarg :footAir
    :type cl:fixnum
    :initform 0)
   (wState
    :reader wState
    :initarg :wState
    :type cl:fixnum
    :initform 0))
)

(cl:defclass LipFeedBack (<LipFeedBack>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LipFeedBack>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LipFeedBack)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-msg:<LipFeedBack> is deprecated: use movement_msgs-msg:LipFeedBack instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LipFeedBack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:header-val is deprecated.  Use movement_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'comPos-val :lambda-list '(m))
(cl:defmethod comPos-val ((m <LipFeedBack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:comPos-val is deprecated.  Use movement_msgs-msg:comPos instead.")
  (comPos m))

(cl:ensure-generic-function 'comVel-val :lambda-list '(m))
(cl:defmethod comVel-val ((m <LipFeedBack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:comVel-val is deprecated.  Use movement_msgs-msg:comVel instead.")
  (comVel m))

(cl:ensure-generic-function 'comAcc-val :lambda-list '(m))
(cl:defmethod comAcc-val ((m <LipFeedBack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:comAcc-val is deprecated.  Use movement_msgs-msg:comAcc instead.")
  (comAcc m))

(cl:ensure-generic-function 'footStep-val :lambda-list '(m))
(cl:defmethod footStep-val ((m <LipFeedBack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:footStep-val is deprecated.  Use movement_msgs-msg:footStep instead.")
  (footStep m))

(cl:ensure-generic-function 'footStepR-val :lambda-list '(m))
(cl:defmethod footStepR-val ((m <LipFeedBack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:footStepR-val is deprecated.  Use movement_msgs-msg:footStepR instead.")
  (footStepR m))

(cl:ensure-generic-function 'zmp-val :lambda-list '(m))
(cl:defmethod zmp-val ((m <LipFeedBack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:zmp-val is deprecated.  Use movement_msgs-msg:zmp instead.")
  (zmp m))

(cl:ensure-generic-function 'footGround-val :lambda-list '(m))
(cl:defmethod footGround-val ((m <LipFeedBack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:footGround-val is deprecated.  Use movement_msgs-msg:footGround instead.")
  (footGround m))

(cl:ensure-generic-function 'footAir-val :lambda-list '(m))
(cl:defmethod footAir-val ((m <LipFeedBack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:footAir-val is deprecated.  Use movement_msgs-msg:footAir instead.")
  (footAir m))

(cl:ensure-generic-function 'wState-val :lambda-list '(m))
(cl:defmethod wState-val ((m <LipFeedBack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-msg:wState-val is deprecated.  Use movement_msgs-msg:wState instead.")
  (wState m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LipFeedBack>) ostream)
  "Serializes a message object of type '<LipFeedBack>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'comPos) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'comVel) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'comAcc) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'footStep) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'footStepR) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'zmp) ostream)
  (cl:let* ((signed (cl:slot-value msg 'footGround)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'footAir)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'wState)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LipFeedBack>) istream)
  "Deserializes a message object of type '<LipFeedBack>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'comPos) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'comVel) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'comAcc) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'footStep) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'footStepR) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'zmp) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'footGround) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'footAir) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wState) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LipFeedBack>)))
  "Returns string type for a message object of type '<LipFeedBack>"
  "movement_msgs/LipFeedBack")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LipFeedBack)))
  "Returns string type for a message object of type 'LipFeedBack"
  "movement_msgs/LipFeedBack")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LipFeedBack>)))
  "Returns md5sum for a message object of type '<LipFeedBack>"
  "e610855409fd0666f178d132dd374e0d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LipFeedBack)))
  "Returns md5sum for a message object of type 'LipFeedBack"
  "e610855409fd0666f178d132dd374e0d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LipFeedBack>)))
  "Returns full string definition for message of type '<LipFeedBack>"
  (cl:format cl:nil "Header                header~%geometry_msgs/Point   comPos~%geometry_msgs/Point   comVel~%geometry_msgs/Point   comAcc~%geometry_msgs/Point   footStep~%geometry_msgs/Point   footStepR~%geometry_msgs/Point   zmp~%int16                 footGround~%int16                 footAir~%int16                 wState~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LipFeedBack)))
  "Returns full string definition for message of type 'LipFeedBack"
  (cl:format cl:nil "Header                header~%geometry_msgs/Point   comPos~%geometry_msgs/Point   comVel~%geometry_msgs/Point   comAcc~%geometry_msgs/Point   footStep~%geometry_msgs/Point   footStepR~%geometry_msgs/Point   zmp~%int16                 footGround~%int16                 footAir~%int16                 wState~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LipFeedBack>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'comPos))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'comVel))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'comAcc))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'footStep))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'footStepR))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'zmp))
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LipFeedBack>))
  "Converts a ROS message object to a list"
  (cl:list 'LipFeedBack
    (cl:cons ':header (header msg))
    (cl:cons ':comPos (comPos msg))
    (cl:cons ':comVel (comVel msg))
    (cl:cons ':comAcc (comAcc msg))
    (cl:cons ':footStep (footStep msg))
    (cl:cons ':footStepR (footStepR msg))
    (cl:cons ':zmp (zmp msg))
    (cl:cons ':footGround (footGround msg))
    (cl:cons ':footAir (footAir msg))
    (cl:cons ':wState (wState msg))
))
