;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::InterfaceSrv)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'InterfaceSrv (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::INTERFACESRV")
  (make-package "MOVEMENT_MSGS::INTERFACESRV"))
(unless (find-package "MOVEMENT_MSGS::INTERFACESRVREQUEST")
  (make-package "MOVEMENT_MSGS::INTERFACESRVREQUEST"))
(unless (find-package "MOVEMENT_MSGS::INTERFACESRVRESPONSE")
  (make-package "MOVEMENT_MSGS::INTERFACESRVRESPONSE"))

(in-package "ROS")





(defclass movement_msgs::InterfaceSrvRequest
  :super ros::object
  :slots (_toGazebo _toRobot _scanMotors _getPID _getMotorPos _send2Motor _setTorque _motorIds _fall _ping ))

(defmethod movement_msgs::InterfaceSrvRequest
  (:init
   (&key
    ((:toGazebo __toGazebo) nil)
    ((:toRobot __toRobot) nil)
    ((:scanMotors __scanMotors) nil)
    ((:getPID __getPID) nil)
    ((:getMotorPos __getMotorPos) nil)
    ((:send2Motor __send2Motor) nil)
    ((:setTorque __setTorque) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:motorIds __motorIds) 0)
    ((:fall __fall) nil)
    ((:ping __ping) nil)
    )
   (send-super :init)
   (setq _toGazebo __toGazebo)
   (setq _toRobot __toRobot)
   (setq _scanMotors __scanMotors)
   (setq _getPID __getPID)
   (setq _getMotorPos __getMotorPos)
   (setq _send2Motor __send2Motor)
   (setq _setTorque __setTorque)
   (setq _motorIds (round __motorIds))
   (setq _fall __fall)
   (setq _ping __ping)
   self)
  (:toGazebo
   (&optional (__toGazebo :null))
   (if (not (eq __toGazebo :null)) (setq _toGazebo __toGazebo)) _toGazebo)
  (:toRobot
   (&optional (__toRobot :null))
   (if (not (eq __toRobot :null)) (setq _toRobot __toRobot)) _toRobot)
  (:scanMotors
   (&optional (__scanMotors :null))
   (if (not (eq __scanMotors :null)) (setq _scanMotors __scanMotors)) _scanMotors)
  (:getPID
   (&optional (__getPID :null))
   (if (not (eq __getPID :null)) (setq _getPID __getPID)) _getPID)
  (:getMotorPos
   (&optional (__getMotorPos :null))
   (if (not (eq __getMotorPos :null)) (setq _getMotorPos __getMotorPos)) _getMotorPos)
  (:send2Motor
   (&optional (__send2Motor :null))
   (if (not (eq __send2Motor :null)) (setq _send2Motor __send2Motor)) _send2Motor)
  (:setTorque
   (&optional __setTorque)
   (if __setTorque (setq _setTorque __setTorque)) _setTorque)
  (:motorIds
   (&optional __motorIds)
   (if __motorIds (setq _motorIds __motorIds)) _motorIds)
  (:fall
   (&optional (__fall :null))
   (if (not (eq __fall :null)) (setq _fall __fall)) _fall)
  (:ping
   (&optional (__ping :null))
   (if (not (eq __ping :null)) (setq _ping __ping)) _ping)
  (:serialization-length
   ()
   (+
    ;; bool _toGazebo
    1
    ;; bool _toRobot
    1
    ;; bool _scanMotors
    1
    ;; bool _getPID
    1
    ;; bool _getMotorPos
    1
    ;; bool _send2Motor
    1
    ;; bool[] _setTorque
    (* 1    (length _setTorque)) 4
    ;; int16 _motorIds
    2
    ;; bool _fall
    1
    ;; bool _ping
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _toGazebo
       (if _toGazebo (write-byte -1 s) (write-byte 0 s))
     ;; bool _toRobot
       (if _toRobot (write-byte -1 s) (write-byte 0 s))
     ;; bool _scanMotors
       (if _scanMotors (write-byte -1 s) (write-byte 0 s))
     ;; bool _getPID
       (if _getPID (write-byte -1 s) (write-byte 0 s))
     ;; bool _getMotorPos
       (if _getMotorPos (write-byte -1 s) (write-byte 0 s))
     ;; bool _send2Motor
       (if _send2Motor (write-byte -1 s) (write-byte 0 s))
     ;; bool[] _setTorque
     (write-long (length _setTorque) s)
     (dotimes (i (length _setTorque))
       (if (elt _setTorque i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; int16 _motorIds
       (write-word _motorIds s)
     ;; bool _fall
       (if _fall (write-byte -1 s) (write-byte 0 s))
     ;; bool _ping
       (if _ping (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _toGazebo
     (setq _toGazebo (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _toRobot
     (setq _toRobot (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _scanMotors
     (setq _scanMotors (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _getPID
     (setq _getPID (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _getMotorPos
     (setq _getMotorPos (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _send2Motor
     (setq _send2Motor (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool[] _setTorque
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _setTorque (make-list n))
     (dotimes (i n)
     (setf (elt _setTorque i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; int16 _motorIds
     (setq _motorIds (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _fall
     (setq _fall (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _ping
     (setq _ping (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass movement_msgs::InterfaceSrvResponse
  :super ros::object
  :slots (_motorState _motorPID _ids ))

(defmethod movement_msgs::InterfaceSrvResponse
  (:init
   (&key
    ((:motorState __motorState) (instance movement_msgs::JointStateMsg :init))
    ((:motorPID __motorPID) (instance movement_msgs::MotorPIDMsg :init))
    ((:ids __ids) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _motorState __motorState)
   (setq _motorPID __motorPID)
   (setq _ids __ids)
   self)
  (:motorState
   (&rest __motorState)
   (if (keywordp (car __motorState))
       (send* _motorState __motorState)
     (progn
       (if __motorState (setq _motorState (car __motorState)))
       _motorState)))
  (:motorPID
   (&rest __motorPID)
   (if (keywordp (car __motorPID))
       (send* _motorPID __motorPID)
     (progn
       (if __motorPID (setq _motorPID (car __motorPID)))
       _motorPID)))
  (:ids
   (&optional __ids)
   (if __ids (setq _ids __ids)) _ids)
  (:serialization-length
   ()
   (+
    ;; movement_msgs/JointStateMsg _motorState
    (send _motorState :serialization-length)
    ;; movement_msgs/MotorPIDMsg _motorPID
    (send _motorPID :serialization-length)
    ;; int16[] _ids
    (* 2    (length _ids)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; movement_msgs/JointStateMsg _motorState
       (send _motorState :serialize s)
     ;; movement_msgs/MotorPIDMsg _motorPID
       (send _motorPID :serialize s)
     ;; int16[] _ids
     (write-long (length _ids) s)
     (dotimes (i (length _ids))
       (write-word (elt _ids i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; movement_msgs/JointStateMsg _motorState
     (send _motorState :deserialize buf ptr-) (incf ptr- (send _motorState :serialization-length))
   ;; movement_msgs/MotorPIDMsg _motorPID
     (send _motorPID :deserialize buf ptr-) (incf ptr- (send _motorPID :serialization-length))
   ;; int16[] _ids
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ids (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _ids i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(defclass movement_msgs::InterfaceSrv
  :super ros::object
  :slots ())

(setf (get movement_msgs::InterfaceSrv :md5sum-) "df2744d447a21ef2bc8fc6392375798f")
(setf (get movement_msgs::InterfaceSrv :datatype-) "movement_msgs/InterfaceSrv")
(setf (get movement_msgs::InterfaceSrv :request) movement_msgs::InterfaceSrvRequest)
(setf (get movement_msgs::InterfaceSrv :response) movement_msgs::InterfaceSrvResponse)

(defmethod movement_msgs::InterfaceSrvRequest
  (:response () (instance movement_msgs::InterfaceSrvResponse :init)))

(setf (get movement_msgs::InterfaceSrvRequest :md5sum-) "df2744d447a21ef2bc8fc6392375798f")
(setf (get movement_msgs::InterfaceSrvRequest :datatype-) "movement_msgs/InterfaceSrvRequest")
(setf (get movement_msgs::InterfaceSrvRequest :definition-)
      "bool toGazebo
bool toRobot
bool scanMotors
bool getPID
bool getMotorPos
bool send2Motor
bool[] setTorque
int16  motorIds
bool fall
bool ping

---
movement_msgs/JointStateMsg motorState
movement_msgs/MotorPIDMsg   motorPID
int16[]                     ids


================================================================================
MSG: movement_msgs/JointStateMsg
Header    header
float64[] pos
float64[] vel
float64[] acc
float64[] torq
string  writeCommand
string        kind
string        readCommand
int32         type
int32         source
float64       dt


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: movement_msgs/MotorPIDMsg
float64[]       kp
float64[]       ki
float64[]       kd


")

(setf (get movement_msgs::InterfaceSrvResponse :md5sum-) "df2744d447a21ef2bc8fc6392375798f")
(setf (get movement_msgs::InterfaceSrvResponse :datatype-) "movement_msgs/InterfaceSrvResponse")
(setf (get movement_msgs::InterfaceSrvResponse :definition-)
      "bool toGazebo
bool toRobot
bool scanMotors
bool getPID
bool getMotorPos
bool send2Motor
bool[] setTorque
int16  motorIds
bool fall
bool ping

---
movement_msgs/JointStateMsg motorState
movement_msgs/MotorPIDMsg   motorPID
int16[]                     ids


================================================================================
MSG: movement_msgs/JointStateMsg
Header    header
float64[] pos
float64[] vel
float64[] acc
float64[] torq
string  writeCommand
string        kind
string        readCommand
int32         type
int32         source
float64       dt


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: movement_msgs/MotorPIDMsg
float64[]       kp
float64[]       ki
float64[]       kd


")



(provide :movement_msgs/InterfaceSrv "df2744d447a21ef2bc8fc6392375798f")


