;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::LoadHumanoidPropertiesSrv)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'LoadHumanoidPropertiesSrv (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::LOADHUMANOIDPROPERTIESSRV")
  (make-package "MOVEMENT_MSGS::LOADHUMANOIDPROPERTIESSRV"))
(unless (find-package "MOVEMENT_MSGS::LOADHUMANOIDPROPERTIESSRVREQUEST")
  (make-package "MOVEMENT_MSGS::LOADHUMANOIDPROPERTIESSRVREQUEST"))
(unless (find-package "MOVEMENT_MSGS::LOADHUMANOIDPROPERTIESSRVRESPONSE")
  (make-package "MOVEMENT_MSGS::LOADHUMANOIDPROPERTIESSRVRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass movement_msgs::LoadHumanoidPropertiesSrvRequest
  :super ros::object
  :slots (_header _joint _endEff _ikRef _calcZMP _calcCOM _calcInvDyn _setIkRef _setComAsIkRef ))

(defmethod movement_msgs::LoadHumanoidPropertiesSrvRequest
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:joint __joint) (instance movement_msgs::JointStateMsg :init))
    ((:endEff __endEff) (instance movement_msgs::EndEffStateMsg :init))
    ((:ikRef __ikRef) (instance geometry_msgs::Point :init))
    ((:calcZMP __calcZMP) nil)
    ((:calcCOM __calcCOM) nil)
    ((:calcInvDyn __calcInvDyn) nil)
    ((:setIkRef __setIkRef) nil)
    ((:setComAsIkRef __setComAsIkRef) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _joint __joint)
   (setq _endEff __endEff)
   (setq _ikRef __ikRef)
   (setq _calcZMP __calcZMP)
   (setq _calcCOM __calcCOM)
   (setq _calcInvDyn __calcInvDyn)
   (setq _setIkRef __setIkRef)
   (setq _setComAsIkRef __setComAsIkRef)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:joint
   (&rest __joint)
   (if (keywordp (car __joint))
       (send* _joint __joint)
     (progn
       (if __joint (setq _joint (car __joint)))
       _joint)))
  (:endEff
   (&rest __endEff)
   (if (keywordp (car __endEff))
       (send* _endEff __endEff)
     (progn
       (if __endEff (setq _endEff (car __endEff)))
       _endEff)))
  (:ikRef
   (&rest __ikRef)
   (if (keywordp (car __ikRef))
       (send* _ikRef __ikRef)
     (progn
       (if __ikRef (setq _ikRef (car __ikRef)))
       _ikRef)))
  (:calcZMP
   (&optional (__calcZMP :null))
   (if (not (eq __calcZMP :null)) (setq _calcZMP __calcZMP)) _calcZMP)
  (:calcCOM
   (&optional (__calcCOM :null))
   (if (not (eq __calcCOM :null)) (setq _calcCOM __calcCOM)) _calcCOM)
  (:calcInvDyn
   (&optional (__calcInvDyn :null))
   (if (not (eq __calcInvDyn :null)) (setq _calcInvDyn __calcInvDyn)) _calcInvDyn)
  (:setIkRef
   (&optional (__setIkRef :null))
   (if (not (eq __setIkRef :null)) (setq _setIkRef __setIkRef)) _setIkRef)
  (:setComAsIkRef
   (&optional (__setComAsIkRef :null))
   (if (not (eq __setComAsIkRef :null)) (setq _setComAsIkRef __setComAsIkRef)) _setComAsIkRef)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; movement_msgs/JointStateMsg _joint
    (send _joint :serialization-length)
    ;; movement_msgs/EndEffStateMsg _endEff
    (send _endEff :serialization-length)
    ;; geometry_msgs/Point _ikRef
    (send _ikRef :serialization-length)
    ;; bool _calcZMP
    1
    ;; bool _calcCOM
    1
    ;; bool _calcInvDyn
    1
    ;; bool _setIkRef
    1
    ;; bool _setComAsIkRef
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; movement_msgs/JointStateMsg _joint
       (send _joint :serialize s)
     ;; movement_msgs/EndEffStateMsg _endEff
       (send _endEff :serialize s)
     ;; geometry_msgs/Point _ikRef
       (send _ikRef :serialize s)
     ;; bool _calcZMP
       (if _calcZMP (write-byte -1 s) (write-byte 0 s))
     ;; bool _calcCOM
       (if _calcCOM (write-byte -1 s) (write-byte 0 s))
     ;; bool _calcInvDyn
       (if _calcInvDyn (write-byte -1 s) (write-byte 0 s))
     ;; bool _setIkRef
       (if _setIkRef (write-byte -1 s) (write-byte 0 s))
     ;; bool _setComAsIkRef
       (if _setComAsIkRef (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; movement_msgs/JointStateMsg _joint
     (send _joint :deserialize buf ptr-) (incf ptr- (send _joint :serialization-length))
   ;; movement_msgs/EndEffStateMsg _endEff
     (send _endEff :deserialize buf ptr-) (incf ptr- (send _endEff :serialization-length))
   ;; geometry_msgs/Point _ikRef
     (send _ikRef :deserialize buf ptr-) (incf ptr- (send _ikRef :serialization-length))
   ;; bool _calcZMP
     (setq _calcZMP (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _calcCOM
     (setq _calcCOM (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _calcInvDyn
     (setq _calcInvDyn (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _setIkRef
     (setq _setIkRef (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _setComAsIkRef
     (setq _setComAsIkRef (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass movement_msgs::LoadHumanoidPropertiesSrvResponse
  :super ros::object
  :slots (_zmpPoint _comPoint _footComPoint _torq ))

(defmethod movement_msgs::LoadHumanoidPropertiesSrvResponse
  (:init
   (&key
    ((:zmpPoint __zmpPoint) (instance geometry_msgs::Point :init))
    ((:comPoint __comPoint) (instance geometry_msgs::Point :init))
    ((:footComPoint __footComPoint) (instance geometry_msgs::Point :init))
    ((:torq __torq) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _zmpPoint __zmpPoint)
   (setq _comPoint __comPoint)
   (setq _footComPoint __footComPoint)
   (setq _torq __torq)
   self)
  (:zmpPoint
   (&rest __zmpPoint)
   (if (keywordp (car __zmpPoint))
       (send* _zmpPoint __zmpPoint)
     (progn
       (if __zmpPoint (setq _zmpPoint (car __zmpPoint)))
       _zmpPoint)))
  (:comPoint
   (&rest __comPoint)
   (if (keywordp (car __comPoint))
       (send* _comPoint __comPoint)
     (progn
       (if __comPoint (setq _comPoint (car __comPoint)))
       _comPoint)))
  (:footComPoint
   (&rest __footComPoint)
   (if (keywordp (car __footComPoint))
       (send* _footComPoint __footComPoint)
     (progn
       (if __footComPoint (setq _footComPoint (car __footComPoint)))
       _footComPoint)))
  (:torq
   (&optional __torq)
   (if __torq (setq _torq __torq)) _torq)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _zmpPoint
    (send _zmpPoint :serialization-length)
    ;; geometry_msgs/Point _comPoint
    (send _comPoint :serialization-length)
    ;; geometry_msgs/Point _footComPoint
    (send _footComPoint :serialization-length)
    ;; float64[] _torq
    (* 8    (length _torq)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _zmpPoint
       (send _zmpPoint :serialize s)
     ;; geometry_msgs/Point _comPoint
       (send _comPoint :serialize s)
     ;; geometry_msgs/Point _footComPoint
       (send _footComPoint :serialize s)
     ;; float64[] _torq
     (write-long (length _torq) s)
     (dotimes (i (length _torq))
       (sys::poke (elt _torq i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _zmpPoint
     (send _zmpPoint :deserialize buf ptr-) (incf ptr- (send _zmpPoint :serialization-length))
   ;; geometry_msgs/Point _comPoint
     (send _comPoint :deserialize buf ptr-) (incf ptr- (send _comPoint :serialization-length))
   ;; geometry_msgs/Point _footComPoint
     (send _footComPoint :deserialize buf ptr-) (incf ptr- (send _footComPoint :serialization-length))
   ;; float64[] _torq
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _torq (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _torq i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass movement_msgs::LoadHumanoidPropertiesSrv
  :super ros::object
  :slots ())

(setf (get movement_msgs::LoadHumanoidPropertiesSrv :md5sum-) "3e2b196ffde962aa21d86738ea07bc83")
(setf (get movement_msgs::LoadHumanoidPropertiesSrv :datatype-) "movement_msgs/LoadHumanoidPropertiesSrv")
(setf (get movement_msgs::LoadHumanoidPropertiesSrv :request) movement_msgs::LoadHumanoidPropertiesSrvRequest)
(setf (get movement_msgs::LoadHumanoidPropertiesSrv :response) movement_msgs::LoadHumanoidPropertiesSrvResponse)

(defmethod movement_msgs::LoadHumanoidPropertiesSrvRequest
  (:response () (instance movement_msgs::LoadHumanoidPropertiesSrvResponse :init)))

(setf (get movement_msgs::LoadHumanoidPropertiesSrvRequest :md5sum-) "3e2b196ffde962aa21d86738ea07bc83")
(setf (get movement_msgs::LoadHumanoidPropertiesSrvRequest :datatype-) "movement_msgs/LoadHumanoidPropertiesSrvRequest")
(setf (get movement_msgs::LoadHumanoidPropertiesSrvRequest :definition-)
      "Header                       header
movement_msgs/JointStateMsg  joint
movement_msgs/EndEffStateMsg endEff
geometry_msgs/Point          ikRef

bool                         calcZMP
bool                         calcCOM
bool                         calcInvDyn
bool                         setIkRef
bool                         setComAsIkRef


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
MSG: movement_msgs/EndEffStateMsg
Header                     header
movement_msgs/EndEffMsg[]  endEff

================================================================================
MSG: movement_msgs/EndEffMsg
geometry_msgs/Point  pos
geometry_msgs/Point  vel
geometry_msgs/Point  acc
geometry_msgs/Point  rot
int32                type
int32                flag
float64              dt

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

geometry_msgs/Point  zmpPoint
geometry_msgs/Point  comPoint
geometry_msgs/Point  footComPoint
float64[]            torq




================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")

(setf (get movement_msgs::LoadHumanoidPropertiesSrvResponse :md5sum-) "3e2b196ffde962aa21d86738ea07bc83")
(setf (get movement_msgs::LoadHumanoidPropertiesSrvResponse :datatype-) "movement_msgs/LoadHumanoidPropertiesSrvResponse")
(setf (get movement_msgs::LoadHumanoidPropertiesSrvResponse :definition-)
      "Header                       header
movement_msgs/JointStateMsg  joint
movement_msgs/EndEffStateMsg endEff
geometry_msgs/Point          ikRef

bool                         calcZMP
bool                         calcCOM
bool                         calcInvDyn
bool                         setIkRef
bool                         setComAsIkRef


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
MSG: movement_msgs/EndEffStateMsg
Header                     header
movement_msgs/EndEffMsg[]  endEff

================================================================================
MSG: movement_msgs/EndEffMsg
geometry_msgs/Point  pos
geometry_msgs/Point  vel
geometry_msgs/Point  acc
geometry_msgs/Point  rot
int32                type
int32                flag
float64              dt

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

geometry_msgs/Point  zmpPoint
geometry_msgs/Point  comPoint
geometry_msgs/Point  footComPoint
float64[]            torq




================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")



(provide :movement_msgs/LoadHumanoidPropertiesSrv "3e2b196ffde962aa21d86738ea07bc83")


