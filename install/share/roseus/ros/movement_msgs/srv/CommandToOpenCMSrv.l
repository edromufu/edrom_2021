;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::CommandToOpenCMSrv)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'CommandToOpenCMSrv (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::COMMANDTOOPENCMSRV")
  (make-package "MOVEMENT_MSGS::COMMANDTOOPENCMSRV"))
(unless (find-package "MOVEMENT_MSGS::COMMANDTOOPENCMSRVREQUEST")
  (make-package "MOVEMENT_MSGS::COMMANDTOOPENCMSRVREQUEST"))
(unless (find-package "MOVEMENT_MSGS::COMMANDTOOPENCMSRVRESPONSE")
  (make-package "MOVEMENT_MSGS::COMMANDTOOPENCMSRVRESPONSE"))

(in-package "ROS")





(defclass movement_msgs::CommandToOpenCMSrvRequest
  :super ros::object
  :slots (_opencm_command ))

(defmethod movement_msgs::CommandToOpenCMSrvRequest
  (:init
   (&key
    ((:opencm_command __opencm_command) 0)
    )
   (send-super :init)
   (setq _opencm_command (round __opencm_command))
   self)
  (:opencm_command
   (&optional __opencm_command)
   (if __opencm_command (setq _opencm_command __opencm_command)) _opencm_command)
  (:serialization-length
   ()
   (+
    ;; int16 _opencm_command
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _opencm_command
       (write-word _opencm_command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _opencm_command
     (setq _opencm_command (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass movement_msgs::CommandToOpenCMSrvResponse
  :super ros::object
  :slots (_command_executed ))

(defmethod movement_msgs::CommandToOpenCMSrvResponse
  (:init
   (&key
    ((:command_executed __command_executed) nil)
    )
   (send-super :init)
   (setq _command_executed __command_executed)
   self)
  (:command_executed
   (&optional (__command_executed :null))
   (if (not (eq __command_executed :null)) (setq _command_executed __command_executed)) _command_executed)
  (:serialization-length
   ()
   (+
    ;; bool _command_executed
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _command_executed
       (if _command_executed (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _command_executed
     (setq _command_executed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass movement_msgs::CommandToOpenCMSrv
  :super ros::object
  :slots ())

(setf (get movement_msgs::CommandToOpenCMSrv :md5sum-) "006dfbee25aeee1268324ecc4e306ddb")
(setf (get movement_msgs::CommandToOpenCMSrv :datatype-) "movement_msgs/CommandToOpenCMSrv")
(setf (get movement_msgs::CommandToOpenCMSrv :request) movement_msgs::CommandToOpenCMSrvRequest)
(setf (get movement_msgs::CommandToOpenCMSrv :response) movement_msgs::CommandToOpenCMSrvResponse)

(defmethod movement_msgs::CommandToOpenCMSrvRequest
  (:response () (instance movement_msgs::CommandToOpenCMSrvResponse :init)))

(setf (get movement_msgs::CommandToOpenCMSrvRequest :md5sum-) "006dfbee25aeee1268324ecc4e306ddb")
(setf (get movement_msgs::CommandToOpenCMSrvRequest :datatype-) "movement_msgs/CommandToOpenCMSrvRequest")
(setf (get movement_msgs::CommandToOpenCMSrvRequest :definition-)
      "int16 opencm_command
---
bool command_executed
")

(setf (get movement_msgs::CommandToOpenCMSrvResponse :md5sum-) "006dfbee25aeee1268324ecc4e306ddb")
(setf (get movement_msgs::CommandToOpenCMSrvResponse :datatype-) "movement_msgs/CommandToOpenCMSrvResponse")
(setf (get movement_msgs::CommandToOpenCMSrvResponse :definition-)
      "int16 opencm_command
---
bool command_executed
")



(provide :movement_msgs/CommandToOpenCMSrv "006dfbee25aeee1268324ecc4e306ddb")


