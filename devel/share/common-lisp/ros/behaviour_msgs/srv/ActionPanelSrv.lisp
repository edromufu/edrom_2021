; Auto-generated. Do not edit!


(cl:in-package behaviour_msgs-srv)


;//! \htmlinclude ActionPanelSrv-request.msg.html

(cl:defclass <ActionPanelSrv-request> (roslisp-msg-protocol:ros-message)
  ((actions
    :reader actions
    :initarg :actions
    :type behaviour_msgs-msg:ActionMsg
    :initform (cl:make-instance 'behaviour_msgs-msg:ActionMsg)))
)

(cl:defclass ActionPanelSrv-request (<ActionPanelSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActionPanelSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActionPanelSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name behaviour_msgs-srv:<ActionPanelSrv-request> is deprecated: use behaviour_msgs-srv:ActionPanelSrv-request instead.")))

(cl:ensure-generic-function 'actions-val :lambda-list '(m))
(cl:defmethod actions-val ((m <ActionPanelSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader behaviour_msgs-srv:actions-val is deprecated.  Use behaviour_msgs-srv:actions instead.")
  (actions m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActionPanelSrv-request>) ostream)
  "Serializes a message object of type '<ActionPanelSrv-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'actions) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActionPanelSrv-request>) istream)
  "Deserializes a message object of type '<ActionPanelSrv-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'actions) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ActionPanelSrv-request>)))
  "Returns string type for a service object of type '<ActionPanelSrv-request>"
  "behaviour_msgs/ActionPanelSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActionPanelSrv-request)))
  "Returns string type for a service object of type 'ActionPanelSrv-request"
  "behaviour_msgs/ActionPanelSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ActionPanelSrv-request>)))
  "Returns md5sum for a message object of type '<ActionPanelSrv-request>"
  "08e9f2a38a830622970eb20f373e5093")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActionPanelSrv-request)))
  "Returns md5sum for a message object of type 'ActionPanelSrv-request"
  "08e9f2a38a830622970eb20f373e5093")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActionPanelSrv-request>)))
  "Returns full string definition for message of type '<ActionPanelSrv-request>"
  (cl:format cl:nil "behaviour_msgs/ActionMsg actions~%~%~%================================================================================~%MSG: behaviour_msgs/ActionMsg~%~%bool ball_tracking~%bool center_ball~%bool align_body~%bool walk~%bool kick~%int32 defend~%bool squat~%bool goal_tracking~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActionPanelSrv-request)))
  "Returns full string definition for message of type 'ActionPanelSrv-request"
  (cl:format cl:nil "behaviour_msgs/ActionMsg actions~%~%~%================================================================================~%MSG: behaviour_msgs/ActionMsg~%~%bool ball_tracking~%bool center_ball~%bool align_body~%bool walk~%bool kick~%int32 defend~%bool squat~%bool goal_tracking~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActionPanelSrv-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'actions))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActionPanelSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ActionPanelSrv-request
    (cl:cons ':actions (actions msg))
))
;//! \htmlinclude ActionPanelSrv-response.msg.html

(cl:defclass <ActionPanelSrv-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ActionPanelSrv-response (<ActionPanelSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActionPanelSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActionPanelSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name behaviour_msgs-srv:<ActionPanelSrv-response> is deprecated: use behaviour_msgs-srv:ActionPanelSrv-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <ActionPanelSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader behaviour_msgs-srv:status-val is deprecated.  Use behaviour_msgs-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActionPanelSrv-response>) ostream)
  "Serializes a message object of type '<ActionPanelSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActionPanelSrv-response>) istream)
  "Deserializes a message object of type '<ActionPanelSrv-response>"
    (cl:setf (cl:slot-value msg 'status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ActionPanelSrv-response>)))
  "Returns string type for a service object of type '<ActionPanelSrv-response>"
  "behaviour_msgs/ActionPanelSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActionPanelSrv-response)))
  "Returns string type for a service object of type 'ActionPanelSrv-response"
  "behaviour_msgs/ActionPanelSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ActionPanelSrv-response>)))
  "Returns md5sum for a message object of type '<ActionPanelSrv-response>"
  "08e9f2a38a830622970eb20f373e5093")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActionPanelSrv-response)))
  "Returns md5sum for a message object of type 'ActionPanelSrv-response"
  "08e9f2a38a830622970eb20f373e5093")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActionPanelSrv-response>)))
  "Returns full string definition for message of type '<ActionPanelSrv-response>"
  (cl:format cl:nil "bool status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActionPanelSrv-response)))
  "Returns full string definition for message of type 'ActionPanelSrv-response"
  (cl:format cl:nil "bool status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActionPanelSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActionPanelSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ActionPanelSrv-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ActionPanelSrv)))
  'ActionPanelSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ActionPanelSrv)))
  'ActionPanelSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActionPanelSrv)))
  "Returns string type for a service object of type '<ActionPanelSrv>"
  "behaviour_msgs/ActionPanelSrv")