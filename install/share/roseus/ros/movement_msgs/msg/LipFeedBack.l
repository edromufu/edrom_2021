;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::LipFeedBack)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'LipFeedBack (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::LIPFEEDBACK")
  (make-package "MOVEMENT_MSGS::LIPFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude LipFeedBack.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass movement_msgs::LipFeedBack
  :super ros::object
  :slots (_header _comPos _comVel _comAcc _footStep _footStepR _zmp _footGround _footAir _wState ))

(defmethod movement_msgs::LipFeedBack
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:comPos __comPos) (instance geometry_msgs::Point :init))
    ((:comVel __comVel) (instance geometry_msgs::Point :init))
    ((:comAcc __comAcc) (instance geometry_msgs::Point :init))
    ((:footStep __footStep) (instance geometry_msgs::Point :init))
    ((:footStepR __footStepR) (instance geometry_msgs::Point :init))
    ((:zmp __zmp) (instance geometry_msgs::Point :init))
    ((:footGround __footGround) 0)
    ((:footAir __footAir) 0)
    ((:wState __wState) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _comPos __comPos)
   (setq _comVel __comVel)
   (setq _comAcc __comAcc)
   (setq _footStep __footStep)
   (setq _footStepR __footStepR)
   (setq _zmp __zmp)
   (setq _footGround (round __footGround))
   (setq _footAir (round __footAir))
   (setq _wState (round __wState))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:comPos
   (&rest __comPos)
   (if (keywordp (car __comPos))
       (send* _comPos __comPos)
     (progn
       (if __comPos (setq _comPos (car __comPos)))
       _comPos)))
  (:comVel
   (&rest __comVel)
   (if (keywordp (car __comVel))
       (send* _comVel __comVel)
     (progn
       (if __comVel (setq _comVel (car __comVel)))
       _comVel)))
  (:comAcc
   (&rest __comAcc)
   (if (keywordp (car __comAcc))
       (send* _comAcc __comAcc)
     (progn
       (if __comAcc (setq _comAcc (car __comAcc)))
       _comAcc)))
  (:footStep
   (&rest __footStep)
   (if (keywordp (car __footStep))
       (send* _footStep __footStep)
     (progn
       (if __footStep (setq _footStep (car __footStep)))
       _footStep)))
  (:footStepR
   (&rest __footStepR)
   (if (keywordp (car __footStepR))
       (send* _footStepR __footStepR)
     (progn
       (if __footStepR (setq _footStepR (car __footStepR)))
       _footStepR)))
  (:zmp
   (&rest __zmp)
   (if (keywordp (car __zmp))
       (send* _zmp __zmp)
     (progn
       (if __zmp (setq _zmp (car __zmp)))
       _zmp)))
  (:footGround
   (&optional __footGround)
   (if __footGround (setq _footGround __footGround)) _footGround)
  (:footAir
   (&optional __footAir)
   (if __footAir (setq _footAir __footAir)) _footAir)
  (:wState
   (&optional __wState)
   (if __wState (setq _wState __wState)) _wState)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Point _comPos
    (send _comPos :serialization-length)
    ;; geometry_msgs/Point _comVel
    (send _comVel :serialization-length)
    ;; geometry_msgs/Point _comAcc
    (send _comAcc :serialization-length)
    ;; geometry_msgs/Point _footStep
    (send _footStep :serialization-length)
    ;; geometry_msgs/Point _footStepR
    (send _footStepR :serialization-length)
    ;; geometry_msgs/Point _zmp
    (send _zmp :serialization-length)
    ;; int16 _footGround
    2
    ;; int16 _footAir
    2
    ;; int16 _wState
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Point _comPos
       (send _comPos :serialize s)
     ;; geometry_msgs/Point _comVel
       (send _comVel :serialize s)
     ;; geometry_msgs/Point _comAcc
       (send _comAcc :serialize s)
     ;; geometry_msgs/Point _footStep
       (send _footStep :serialize s)
     ;; geometry_msgs/Point _footStepR
       (send _footStepR :serialize s)
     ;; geometry_msgs/Point _zmp
       (send _zmp :serialize s)
     ;; int16 _footGround
       (write-word _footGround s)
     ;; int16 _footAir
       (write-word _footAir s)
     ;; int16 _wState
       (write-word _wState s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Point _comPos
     (send _comPos :deserialize buf ptr-) (incf ptr- (send _comPos :serialization-length))
   ;; geometry_msgs/Point _comVel
     (send _comVel :deserialize buf ptr-) (incf ptr- (send _comVel :serialization-length))
   ;; geometry_msgs/Point _comAcc
     (send _comAcc :deserialize buf ptr-) (incf ptr- (send _comAcc :serialization-length))
   ;; geometry_msgs/Point _footStep
     (send _footStep :deserialize buf ptr-) (incf ptr- (send _footStep :serialization-length))
   ;; geometry_msgs/Point _footStepR
     (send _footStepR :deserialize buf ptr-) (incf ptr- (send _footStepR :serialization-length))
   ;; geometry_msgs/Point _zmp
     (send _zmp :deserialize buf ptr-) (incf ptr- (send _zmp :serialization-length))
   ;; int16 _footGround
     (setq _footGround (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _footAir
     (setq _footAir (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _wState
     (setq _wState (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get movement_msgs::LipFeedBack :md5sum-) "e610855409fd0666f178d132dd374e0d")
(setf (get movement_msgs::LipFeedBack :datatype-) "movement_msgs/LipFeedBack")
(setf (get movement_msgs::LipFeedBack :definition-)
      "Header                header
geometry_msgs/Point   comPos
geometry_msgs/Point   comVel
geometry_msgs/Point   comAcc
geometry_msgs/Point   footStep
geometry_msgs/Point   footStepR
geometry_msgs/Point   zmp
int16                 footGround
int16                 footAir
int16                 wState



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
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :movement_msgs/LipFeedBack "e610855409fd0666f178d132dd374e0d")


