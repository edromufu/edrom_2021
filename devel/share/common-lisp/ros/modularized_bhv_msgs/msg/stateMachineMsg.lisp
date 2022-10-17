; Auto-generated. Do not edit!


(cl:in-package modularized_bhv_msgs-msg)


;//! \htmlinclude stateMachineMsg.msg.html

(cl:defclass <stateMachineMsg> (roslisp-msg-protocol:ros-message)
  ((fallState
    :reader fallState
    :initarg :fallState
    :type cl:string
    :initform "")
   (ballFound
    :reader ballFound
    :initarg :ballFound
    :type cl:boolean
    :initform cl:nil)
   (ballClose
    :reader ballClose
    :initarg :ballClose
    :type cl:boolean
    :initform cl:nil)
   (ballRelativePosition
    :reader ballRelativePosition
    :initarg :ballRelativePosition
    :type cl:string
    :initform "")
   (verAngleAccomplished
    :reader verAngleAccomplished
    :initarg :verAngleAccomplished
    :type cl:boolean
    :initform cl:nil)
   (headPossibleMovements
    :reader headPossibleMovements
    :initarg :headPossibleMovements
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (horMotorOutOfCenter
    :reader horMotorOutOfCenter
    :initarg :horMotorOutOfCenter
    :type cl:boolean
    :initform cl:nil)
   (horMotorPosition
    :reader horMotorPosition
    :initarg :horMotorPosition
    :type cl:float
    :initform 0.0))
)

(cl:defclass stateMachineMsg (<stateMachineMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stateMachineMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stateMachineMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name modularized_bhv_msgs-msg:<stateMachineMsg> is deprecated: use modularized_bhv_msgs-msg:stateMachineMsg instead.")))

(cl:ensure-generic-function 'fallState-val :lambda-list '(m))
(cl:defmethod fallState-val ((m <stateMachineMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader modularized_bhv_msgs-msg:fallState-val is deprecated.  Use modularized_bhv_msgs-msg:fallState instead.")
  (fallState m))

(cl:ensure-generic-function 'ballFound-val :lambda-list '(m))
(cl:defmethod ballFound-val ((m <stateMachineMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader modularized_bhv_msgs-msg:ballFound-val is deprecated.  Use modularized_bhv_msgs-msg:ballFound instead.")
  (ballFound m))

(cl:ensure-generic-function 'ballClose-val :lambda-list '(m))
(cl:defmethod ballClose-val ((m <stateMachineMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader modularized_bhv_msgs-msg:ballClose-val is deprecated.  Use modularized_bhv_msgs-msg:ballClose instead.")
  (ballClose m))

(cl:ensure-generic-function 'ballRelativePosition-val :lambda-list '(m))
(cl:defmethod ballRelativePosition-val ((m <stateMachineMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader modularized_bhv_msgs-msg:ballRelativePosition-val is deprecated.  Use modularized_bhv_msgs-msg:ballRelativePosition instead.")
  (ballRelativePosition m))

(cl:ensure-generic-function 'verAngleAccomplished-val :lambda-list '(m))
(cl:defmethod verAngleAccomplished-val ((m <stateMachineMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader modularized_bhv_msgs-msg:verAngleAccomplished-val is deprecated.  Use modularized_bhv_msgs-msg:verAngleAccomplished instead.")
  (verAngleAccomplished m))

(cl:ensure-generic-function 'headPossibleMovements-val :lambda-list '(m))
(cl:defmethod headPossibleMovements-val ((m <stateMachineMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader modularized_bhv_msgs-msg:headPossibleMovements-val is deprecated.  Use modularized_bhv_msgs-msg:headPossibleMovements instead.")
  (headPossibleMovements m))

(cl:ensure-generic-function 'horMotorOutOfCenter-val :lambda-list '(m))
(cl:defmethod horMotorOutOfCenter-val ((m <stateMachineMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader modularized_bhv_msgs-msg:horMotorOutOfCenter-val is deprecated.  Use modularized_bhv_msgs-msg:horMotorOutOfCenter instead.")
  (horMotorOutOfCenter m))

(cl:ensure-generic-function 'horMotorPosition-val :lambda-list '(m))
(cl:defmethod horMotorPosition-val ((m <stateMachineMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader modularized_bhv_msgs-msg:horMotorPosition-val is deprecated.  Use modularized_bhv_msgs-msg:horMotorPosition instead.")
  (horMotorPosition m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stateMachineMsg>) ostream)
  "Serializes a message object of type '<stateMachineMsg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'fallState))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'fallState))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ballFound) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ballClose) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'ballRelativePosition))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'ballRelativePosition))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'verAngleAccomplished) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'headPossibleMovements))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'headPossibleMovements))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'horMotorOutOfCenter) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'horMotorPosition))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stateMachineMsg>) istream)
  "Deserializes a message object of type '<stateMachineMsg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fallState) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'fallState) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'ballFound) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'ballClose) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ballRelativePosition) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'ballRelativePosition) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'verAngleAccomplished) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'headPossibleMovements) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'headPossibleMovements)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
    (cl:setf (cl:slot-value msg 'horMotorOutOfCenter) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'horMotorPosition) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stateMachineMsg>)))
  "Returns string type for a message object of type '<stateMachineMsg>"
  "modularized_bhv_msgs/stateMachineMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stateMachineMsg)))
  "Returns string type for a message object of type 'stateMachineMsg"
  "modularized_bhv_msgs/stateMachineMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stateMachineMsg>)))
  "Returns md5sum for a message object of type '<stateMachineMsg>"
  "fef8165d0297ca5e6f3b8c591ed6dfff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stateMachineMsg)))
  "Returns md5sum for a message object of type 'stateMachineMsg"
  "fef8165d0297ca5e6f3b8c591ed6dfff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stateMachineMsg>)))
  "Returns full string definition for message of type '<stateMachineMsg>"
  (cl:format cl:nil "string fallState~%bool ballFound~%bool ballClose~%string ballRelativePosition~%bool verAngleAccomplished~%string[] headPossibleMovements~%bool horMotorOutOfCenter~%float32 horMotorPosition~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stateMachineMsg)))
  "Returns full string definition for message of type 'stateMachineMsg"
  (cl:format cl:nil "string fallState~%bool ballFound~%bool ballClose~%string ballRelativePosition~%bool verAngleAccomplished~%string[] headPossibleMovements~%bool horMotorOutOfCenter~%float32 horMotorPosition~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stateMachineMsg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'fallState))
     1
     1
     4 (cl:length (cl:slot-value msg 'ballRelativePosition))
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'headPossibleMovements) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stateMachineMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'stateMachineMsg
    (cl:cons ':fallState (fallState msg))
    (cl:cons ':ballFound (ballFound msg))
    (cl:cons ':ballClose (ballClose msg))
    (cl:cons ':ballRelativePosition (ballRelativePosition msg))
    (cl:cons ':verAngleAccomplished (verAngleAccomplished msg))
    (cl:cons ':headPossibleMovements (headPossibleMovements msg))
    (cl:cons ':horMotorOutOfCenter (horMotorOutOfCenter msg))
    (cl:cons ':horMotorPosition (horMotorPosition msg))
))
