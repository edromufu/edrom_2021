; Auto-generated. Do not edit!


(cl:in-package movement_msgs-srv)


;//! \htmlinclude OpenCm-request.msg.html

(cl:defclass <OpenCm-request> (roslisp-msg-protocol:ros-message)
  ((write
    :reader write
    :initarg :write
    :type cl:fixnum
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 20 :element-type 'cl:fixnum :initial-element 0))
   (vel
    :reader vel
    :initarg :vel
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 20 :element-type 'cl:fixnum :initial-element 0))
   (read
    :reader read
    :initarg :read
    :type cl:fixnum
    :initform 0))
)

(cl:defclass OpenCm-request (<OpenCm-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OpenCm-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OpenCm-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<OpenCm-request> is deprecated: use movement_msgs-srv:OpenCm-request instead.")))

(cl:ensure-generic-function 'write-val :lambda-list '(m))
(cl:defmethod write-val ((m <OpenCm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:write-val is deprecated.  Use movement_msgs-srv:write instead.")
  (write m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <OpenCm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:data-val is deprecated.  Use movement_msgs-srv:data instead.")
  (data m))

(cl:ensure-generic-function 'vel-val :lambda-list '(m))
(cl:defmethod vel-val ((m <OpenCm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:vel-val is deprecated.  Use movement_msgs-srv:vel instead.")
  (vel m))

(cl:ensure-generic-function 'read-val :lambda-list '(m))
(cl:defmethod read-val ((m <OpenCm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:read-val is deprecated.  Use movement_msgs-srv:read instead.")
  (read m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OpenCm-request>) ostream)
  "Serializes a message object of type '<OpenCm-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'write)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'data))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'vel))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'read)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OpenCm-request>) istream)
  "Deserializes a message object of type '<OpenCm-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'write)) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array 20))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i 20)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'vel) (cl:make-array 20))
  (cl:let ((vals (cl:slot-value msg 'vel)))
    (cl:dotimes (i 20)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'read)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OpenCm-request>)))
  "Returns string type for a service object of type '<OpenCm-request>"
  "movement_msgs/OpenCmRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OpenCm-request)))
  "Returns string type for a service object of type 'OpenCm-request"
  "movement_msgs/OpenCmRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OpenCm-request>)))
  "Returns md5sum for a message object of type '<OpenCm-request>"
  "ed318f5991a644927c9195494aa8898a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OpenCm-request)))
  "Returns md5sum for a message object of type 'OpenCm-request"
  "ed318f5991a644927c9195494aa8898a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OpenCm-request>)))
  "Returns full string definition for message of type '<OpenCm-request>"
  (cl:format cl:nil "uint8 write~%uint16[20] data~%uint16[20] vel~%uint8 read ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OpenCm-request)))
  "Returns full string definition for message of type 'OpenCm-request"
  (cl:format cl:nil "uint8 write~%uint16[20] data~%uint16[20] vel~%uint8 read ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OpenCm-request>))
  (cl:+ 0
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'vel) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OpenCm-request>))
  "Converts a ROS message object to a list"
  (cl:list 'OpenCm-request
    (cl:cons ':write (write msg))
    (cl:cons ':data (data msg))
    (cl:cons ':vel (vel msg))
    (cl:cons ':read (read msg))
))
;//! \htmlinclude OpenCm-response.msg.html

(cl:defclass <OpenCm-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass OpenCm-response (<OpenCm-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OpenCm-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OpenCm-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_msgs-srv:<OpenCm-response> is deprecated: use movement_msgs-srv:OpenCm-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <OpenCm-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_msgs-srv:result-val is deprecated.  Use movement_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OpenCm-response>) ostream)
  "Serializes a message object of type '<OpenCm-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OpenCm-response>) istream)
  "Deserializes a message object of type '<OpenCm-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'result) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'result)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OpenCm-response>)))
  "Returns string type for a service object of type '<OpenCm-response>"
  "movement_msgs/OpenCmResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OpenCm-response)))
  "Returns string type for a service object of type 'OpenCm-response"
  "movement_msgs/OpenCmResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OpenCm-response>)))
  "Returns md5sum for a message object of type '<OpenCm-response>"
  "ed318f5991a644927c9195494aa8898a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OpenCm-response)))
  "Returns md5sum for a message object of type 'OpenCm-response"
  "ed318f5991a644927c9195494aa8898a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OpenCm-response>)))
  "Returns full string definition for message of type '<OpenCm-response>"
  (cl:format cl:nil "~%uint16[] result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OpenCm-response)))
  "Returns full string definition for message of type 'OpenCm-response"
  (cl:format cl:nil "~%uint16[] result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OpenCm-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'result) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OpenCm-response>))
  "Converts a ROS message object to a list"
  (cl:list 'OpenCm-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'OpenCm)))
  'OpenCm-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'OpenCm)))
  'OpenCm-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OpenCm)))
  "Returns string type for a service object of type '<OpenCm>"
  "movement_msgs/OpenCm")