; Auto-generated. Do not edit!


(cl:in-package modularized_bhv_msgs-msg)


;//! \htmlinclude simMovMsg.msg.html

(cl:defclass <simMovMsg> (roslisp-msg-protocol:ros-message)
  ((positions
    :reader positions
    :initarg :positions
    :type (cl:vector cl:float)
   :initform (cl:make-array 2 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass simMovMsg (<simMovMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <simMovMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'simMovMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name modularized_bhv_msgs-msg:<simMovMsg> is deprecated: use modularized_bhv_msgs-msg:simMovMsg instead.")))

(cl:ensure-generic-function 'positions-val :lambda-list '(m))
(cl:defmethod positions-val ((m <simMovMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader modularized_bhv_msgs-msg:positions-val is deprecated.  Use modularized_bhv_msgs-msg:positions instead.")
  (positions m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <simMovMsg>) ostream)
  "Serializes a message object of type '<simMovMsg>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'positions))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <simMovMsg>) istream)
  "Deserializes a message object of type '<simMovMsg>"
  (cl:setf (cl:slot-value msg 'positions) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'positions)))
    (cl:dotimes (i 2)
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<simMovMsg>)))
  "Returns string type for a message object of type '<simMovMsg>"
  "modularized_bhv_msgs/simMovMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'simMovMsg)))
  "Returns string type for a message object of type 'simMovMsg"
  "modularized_bhv_msgs/simMovMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<simMovMsg>)))
  "Returns md5sum for a message object of type '<simMovMsg>"
  "2ea60a9dc19d0a4ca4c6af232a5cfe7f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'simMovMsg)))
  "Returns md5sum for a message object of type 'simMovMsg"
  "2ea60a9dc19d0a4ca4c6af232a5cfe7f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<simMovMsg>)))
  "Returns full string definition for message of type '<simMovMsg>"
  (cl:format cl:nil "float64[2] positions~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'simMovMsg)))
  "Returns full string definition for message of type 'simMovMsg"
  (cl:format cl:nil "float64[2] positions~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <simMovMsg>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'positions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <simMovMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'simMovMsg
    (cl:cons ':positions (positions msg))
))
