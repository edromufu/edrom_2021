;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::HumanoidControlMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'HumanoidControlMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::HUMANOIDCONTROLMSG")
  (make-package "MOVEMENT_MSGS::HUMANOIDCONTROLMSG"))

(in-package "ROS")
;;//! \htmlinclude HumanoidControlMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass movement_msgs::HumanoidControlMsg
  :super ros::object
  :slots (_header _ctrl_flag _arm_ctrl_flag _torso_ctrl_flag _phase_ctrl_flag _slope_ctrl_flag _foot_ctrl_flag _torsoAddX _torsoAddY _torsoAddZ _slope _rFootFac _lFootFac _phaseFac _armAdd _delayR _delayL _delayAll ))

(defmethod movement_msgs::HumanoidControlMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:ctrl_flag __ctrl_flag) nil)
    ((:arm_ctrl_flag __arm_ctrl_flag) nil)
    ((:torso_ctrl_flag __torso_ctrl_flag) nil)
    ((:phase_ctrl_flag __phase_ctrl_flag) nil)
    ((:slope_ctrl_flag __slope_ctrl_flag) nil)
    ((:foot_ctrl_flag __foot_ctrl_flag) nil)
    ((:torsoAddX __torsoAddX) 0.0)
    ((:torsoAddY __torsoAddY) 0.0)
    ((:torsoAddZ __torsoAddZ) 0.0)
    ((:slope __slope) 0.0)
    ((:rFootFac __rFootFac) (instance movement_msgs::EndEffMsg :init))
    ((:lFootFac __lFootFac) (instance movement_msgs::EndEffMsg :init))
    ((:phaseFac __phaseFac) 0.0)
    ((:armAdd __armAdd) 0.0)
    ((:delayR __delayR) 0.0)
    ((:delayL __delayL) 0.0)
    ((:delayAll __delayAll) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _ctrl_flag __ctrl_flag)
   (setq _arm_ctrl_flag __arm_ctrl_flag)
   (setq _torso_ctrl_flag __torso_ctrl_flag)
   (setq _phase_ctrl_flag __phase_ctrl_flag)
   (setq _slope_ctrl_flag __slope_ctrl_flag)
   (setq _foot_ctrl_flag __foot_ctrl_flag)
   (setq _torsoAddX (float __torsoAddX))
   (setq _torsoAddY (float __torsoAddY))
   (setq _torsoAddZ (float __torsoAddZ))
   (setq _slope (float __slope))
   (setq _rFootFac __rFootFac)
   (setq _lFootFac __lFootFac)
   (setq _phaseFac (float __phaseFac))
   (setq _armAdd (float __armAdd))
   (setq _delayR (float __delayR))
   (setq _delayL (float __delayL))
   (setq _delayAll (float __delayAll))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:ctrl_flag
   (&optional (__ctrl_flag :null))
   (if (not (eq __ctrl_flag :null)) (setq _ctrl_flag __ctrl_flag)) _ctrl_flag)
  (:arm_ctrl_flag
   (&optional (__arm_ctrl_flag :null))
   (if (not (eq __arm_ctrl_flag :null)) (setq _arm_ctrl_flag __arm_ctrl_flag)) _arm_ctrl_flag)
  (:torso_ctrl_flag
   (&optional (__torso_ctrl_flag :null))
   (if (not (eq __torso_ctrl_flag :null)) (setq _torso_ctrl_flag __torso_ctrl_flag)) _torso_ctrl_flag)
  (:phase_ctrl_flag
   (&optional (__phase_ctrl_flag :null))
   (if (not (eq __phase_ctrl_flag :null)) (setq _phase_ctrl_flag __phase_ctrl_flag)) _phase_ctrl_flag)
  (:slope_ctrl_flag
   (&optional (__slope_ctrl_flag :null))
   (if (not (eq __slope_ctrl_flag :null)) (setq _slope_ctrl_flag __slope_ctrl_flag)) _slope_ctrl_flag)
  (:foot_ctrl_flag
   (&optional (__foot_ctrl_flag :null))
   (if (not (eq __foot_ctrl_flag :null)) (setq _foot_ctrl_flag __foot_ctrl_flag)) _foot_ctrl_flag)
  (:torsoAddX
   (&optional __torsoAddX)
   (if __torsoAddX (setq _torsoAddX __torsoAddX)) _torsoAddX)
  (:torsoAddY
   (&optional __torsoAddY)
   (if __torsoAddY (setq _torsoAddY __torsoAddY)) _torsoAddY)
  (:torsoAddZ
   (&optional __torsoAddZ)
   (if __torsoAddZ (setq _torsoAddZ __torsoAddZ)) _torsoAddZ)
  (:slope
   (&optional __slope)
   (if __slope (setq _slope __slope)) _slope)
  (:rFootFac
   (&rest __rFootFac)
   (if (keywordp (car __rFootFac))
       (send* _rFootFac __rFootFac)
     (progn
       (if __rFootFac (setq _rFootFac (car __rFootFac)))
       _rFootFac)))
  (:lFootFac
   (&rest __lFootFac)
   (if (keywordp (car __lFootFac))
       (send* _lFootFac __lFootFac)
     (progn
       (if __lFootFac (setq _lFootFac (car __lFootFac)))
       _lFootFac)))
  (:phaseFac
   (&optional __phaseFac)
   (if __phaseFac (setq _phaseFac __phaseFac)) _phaseFac)
  (:armAdd
   (&optional __armAdd)
   (if __armAdd (setq _armAdd __armAdd)) _armAdd)
  (:delayR
   (&optional __delayR)
   (if __delayR (setq _delayR __delayR)) _delayR)
  (:delayL
   (&optional __delayL)
   (if __delayL (setq _delayL __delayL)) _delayL)
  (:delayAll
   (&optional __delayAll)
   (if __delayAll (setq _delayAll __delayAll)) _delayAll)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _ctrl_flag
    1
    ;; bool _arm_ctrl_flag
    1
    ;; bool _torso_ctrl_flag
    1
    ;; bool _phase_ctrl_flag
    1
    ;; bool _slope_ctrl_flag
    1
    ;; bool _foot_ctrl_flag
    1
    ;; float64 _torsoAddX
    8
    ;; float64 _torsoAddY
    8
    ;; float64 _torsoAddZ
    8
    ;; float64 _slope
    8
    ;; movement_msgs/EndEffMsg _rFootFac
    (send _rFootFac :serialization-length)
    ;; movement_msgs/EndEffMsg _lFootFac
    (send _lFootFac :serialization-length)
    ;; float64 _phaseFac
    8
    ;; float64 _armAdd
    8
    ;; float64 _delayR
    8
    ;; float64 _delayL
    8
    ;; float64 _delayAll
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _ctrl_flag
       (if _ctrl_flag (write-byte -1 s) (write-byte 0 s))
     ;; bool _arm_ctrl_flag
       (if _arm_ctrl_flag (write-byte -1 s) (write-byte 0 s))
     ;; bool _torso_ctrl_flag
       (if _torso_ctrl_flag (write-byte -1 s) (write-byte 0 s))
     ;; bool _phase_ctrl_flag
       (if _phase_ctrl_flag (write-byte -1 s) (write-byte 0 s))
     ;; bool _slope_ctrl_flag
       (if _slope_ctrl_flag (write-byte -1 s) (write-byte 0 s))
     ;; bool _foot_ctrl_flag
       (if _foot_ctrl_flag (write-byte -1 s) (write-byte 0 s))
     ;; float64 _torsoAddX
       (sys::poke _torsoAddX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _torsoAddY
       (sys::poke _torsoAddY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _torsoAddZ
       (sys::poke _torsoAddZ (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _slope
       (sys::poke _slope (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; movement_msgs/EndEffMsg _rFootFac
       (send _rFootFac :serialize s)
     ;; movement_msgs/EndEffMsg _lFootFac
       (send _lFootFac :serialize s)
     ;; float64 _phaseFac
       (sys::poke _phaseFac (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _armAdd
       (sys::poke _armAdd (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _delayR
       (sys::poke _delayR (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _delayL
       (sys::poke _delayL (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _delayAll
       (sys::poke _delayAll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _ctrl_flag
     (setq _ctrl_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _arm_ctrl_flag
     (setq _arm_ctrl_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _torso_ctrl_flag
     (setq _torso_ctrl_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _phase_ctrl_flag
     (setq _phase_ctrl_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _slope_ctrl_flag
     (setq _slope_ctrl_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _foot_ctrl_flag
     (setq _foot_ctrl_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _torsoAddX
     (setq _torsoAddX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _torsoAddY
     (setq _torsoAddY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _torsoAddZ
     (setq _torsoAddZ (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _slope
     (setq _slope (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; movement_msgs/EndEffMsg _rFootFac
     (send _rFootFac :deserialize buf ptr-) (incf ptr- (send _rFootFac :serialization-length))
   ;; movement_msgs/EndEffMsg _lFootFac
     (send _lFootFac :deserialize buf ptr-) (incf ptr- (send _lFootFac :serialization-length))
   ;; float64 _phaseFac
     (setq _phaseFac (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _armAdd
     (setq _armAdd (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _delayR
     (setq _delayR (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _delayL
     (setq _delayL (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _delayAll
     (setq _delayAll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get movement_msgs::HumanoidControlMsg :md5sum-) "0b7c6a6b1b062af7f2563f72e33b0aab")
(setf (get movement_msgs::HumanoidControlMsg :datatype-) "movement_msgs/HumanoidControlMsg")
(setf (get movement_msgs::HumanoidControlMsg :definition-)
      "Header  header
bool    ctrl_flag  
bool    arm_ctrl_flag
bool    torso_ctrl_flag 
bool    phase_ctrl_flag 
bool    slope_ctrl_flag 
bool    foot_ctrl_flag 

float64 torsoAddX
float64 torsoAddY
float64 torsoAddZ

float64 slope

movement_msgs/EndEffMsg  rFootFac
movement_msgs/EndEffMsg  lFootFac

float64 phaseFac


float64 armAdd


float64 delayR
float64 delayL
float64 delayAll





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

")



(provide :movement_msgs/HumanoidControlMsg "0b7c6a6b1b062af7f2563f72e33b0aab")


