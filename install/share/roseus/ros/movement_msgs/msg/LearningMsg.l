;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::LearningMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'LearningMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::LEARNINGMSG")
  (make-package "MOVEMENT_MSGS::LEARNINGMSG"))

(in-package "ROS")
;;//! \htmlinclude LearningMsg.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass movement_msgs::LearningMsg
  :super ros::object
  :slots (_header _x _y _z _rFoot _lFoot _force _torque3 _torque4 _torqueF _imu _perf _df _state ))

(defmethod movement_msgs::LearningMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:x __x) (instance movement_msgs::PerformanceMsg :init))
    ((:y __y) (instance movement_msgs::PerformanceMsg :init))
    ((:z __z) (instance movement_msgs::PerformanceMsg :init))
    ((:rFoot __rFoot) (instance movement_msgs::PerformanceMsg :init))
    ((:lFoot __lFoot) (instance movement_msgs::PerformanceMsg :init))
    ((:force __force) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:torque3 __torque3) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:torque4 __torque4) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:torqueF __torqueF) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:imu __imu) ())
    ((:perf __perf) 0.0)
    ((:df __df) 0.0)
    ((:state __state) (instance movement_msgs::HumanoidStateMsg :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _x __x)
   (setq _y __y)
   (setq _z __z)
   (setq _rFoot __rFoot)
   (setq _lFoot __lFoot)
   (setq _force __force)
   (setq _torque3 __torque3)
   (setq _torque4 __torque4)
   (setq _torqueF __torqueF)
   (setq _imu __imu)
   (setq _perf (float __perf))
   (setq _df (float __df))
   (setq _state __state)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:x
   (&rest __x)
   (if (keywordp (car __x))
       (send* _x __x)
     (progn
       (if __x (setq _x (car __x)))
       _x)))
  (:y
   (&rest __y)
   (if (keywordp (car __y))
       (send* _y __y)
     (progn
       (if __y (setq _y (car __y)))
       _y)))
  (:z
   (&rest __z)
   (if (keywordp (car __z))
       (send* _z __z)
     (progn
       (if __z (setq _z (car __z)))
       _z)))
  (:rFoot
   (&rest __rFoot)
   (if (keywordp (car __rFoot))
       (send* _rFoot __rFoot)
     (progn
       (if __rFoot (setq _rFoot (car __rFoot)))
       _rFoot)))
  (:lFoot
   (&rest __lFoot)
   (if (keywordp (car __lFoot))
       (send* _lFoot __lFoot)
     (progn
       (if __lFoot (setq _lFoot (car __lFoot)))
       _lFoot)))
  (:force
   (&optional __force)
   (if __force (setq _force __force)) _force)
  (:torque3
   (&optional __torque3)
   (if __torque3 (setq _torque3 __torque3)) _torque3)
  (:torque4
   (&optional __torque4)
   (if __torque4 (setq _torque4 __torque4)) _torque4)
  (:torqueF
   (&optional __torqueF)
   (if __torqueF (setq _torqueF __torqueF)) _torqueF)
  (:imu
   (&rest __imu)
   (if (keywordp (car __imu))
       (send* _imu __imu)
     (progn
       (if __imu (setq _imu (car __imu)))
       _imu)))
  (:perf
   (&optional __perf)
   (if __perf (setq _perf __perf)) _perf)
  (:df
   (&optional __df)
   (if __df (setq _df __df)) _df)
  (:state
   (&rest __state)
   (if (keywordp (car __state))
       (send* _state __state)
     (progn
       (if __state (setq _state (car __state)))
       _state)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; movement_msgs/PerformanceMsg _x
    (send _x :serialization-length)
    ;; movement_msgs/PerformanceMsg _y
    (send _y :serialization-length)
    ;; movement_msgs/PerformanceMsg _z
    (send _z :serialization-length)
    ;; movement_msgs/PerformanceMsg _rFoot
    (send _rFoot :serialization-length)
    ;; movement_msgs/PerformanceMsg _lFoot
    (send _lFoot :serialization-length)
    ;; float64[] _force
    (* 8    (length _force)) 4
    ;; float64[] _torque3
    (* 8    (length _torque3)) 4
    ;; float64[] _torque4
    (* 8    (length _torque4)) 4
    ;; float64[] _torqueF
    (* 8    (length _torqueF)) 4
    ;; sensor_msgs/Imu[] _imu
    (apply #'+ (send-all _imu :serialization-length)) 4
    ;; float64 _perf
    8
    ;; float64 _df
    8
    ;; movement_msgs/HumanoidStateMsg _state
    (send _state :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; movement_msgs/PerformanceMsg _x
       (send _x :serialize s)
     ;; movement_msgs/PerformanceMsg _y
       (send _y :serialize s)
     ;; movement_msgs/PerformanceMsg _z
       (send _z :serialize s)
     ;; movement_msgs/PerformanceMsg _rFoot
       (send _rFoot :serialize s)
     ;; movement_msgs/PerformanceMsg _lFoot
       (send _lFoot :serialize s)
     ;; float64[] _force
     (write-long (length _force) s)
     (dotimes (i (length _force))
       (sys::poke (elt _force i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _torque3
     (write-long (length _torque3) s)
     (dotimes (i (length _torque3))
       (sys::poke (elt _torque3 i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _torque4
     (write-long (length _torque4) s)
     (dotimes (i (length _torque4))
       (sys::poke (elt _torque4 i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _torqueF
     (write-long (length _torqueF) s)
     (dotimes (i (length _torqueF))
       (sys::poke (elt _torqueF i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; sensor_msgs/Imu[] _imu
     (write-long (length _imu) s)
     (dolist (elem _imu)
       (send elem :serialize s)
       )
     ;; float64 _perf
       (sys::poke _perf (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _df
       (sys::poke _df (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; movement_msgs/HumanoidStateMsg _state
       (send _state :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; movement_msgs/PerformanceMsg _x
     (send _x :deserialize buf ptr-) (incf ptr- (send _x :serialization-length))
   ;; movement_msgs/PerformanceMsg _y
     (send _y :deserialize buf ptr-) (incf ptr- (send _y :serialization-length))
   ;; movement_msgs/PerformanceMsg _z
     (send _z :deserialize buf ptr-) (incf ptr- (send _z :serialization-length))
   ;; movement_msgs/PerformanceMsg _rFoot
     (send _rFoot :deserialize buf ptr-) (incf ptr- (send _rFoot :serialization-length))
   ;; movement_msgs/PerformanceMsg _lFoot
     (send _lFoot :deserialize buf ptr-) (incf ptr- (send _lFoot :serialization-length))
   ;; float64[] _force
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _force (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _force i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _torque3
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _torque3 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _torque3 i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _torque4
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _torque4 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _torque4 i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _torqueF
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _torqueF (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _torqueF i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; sensor_msgs/Imu[] _imu
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _imu (let (r) (dotimes (i n) (push (instance sensor_msgs::Imu :init) r)) r))
     (dolist (elem- _imu)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float64 _perf
     (setq _perf (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _df
     (setq _df (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; movement_msgs/HumanoidStateMsg _state
     (send _state :deserialize buf ptr-) (incf ptr- (send _state :serialization-length))
   ;;
   self)
  )

(setf (get movement_msgs::LearningMsg :md5sum-) "bb9643324c03e2d257aa2412b115318f")
(setf (get movement_msgs::LearningMsg :datatype-) "movement_msgs/LearningMsg")
(setf (get movement_msgs::LearningMsg :definition-)
      "Header    header
movement_msgs/PerformanceMsg x
movement_msgs/PerformanceMsg y
movement_msgs/PerformanceMsg z
movement_msgs/PerformanceMsg rFoot
movement_msgs/PerformanceMsg lFoot

float64[]           force
float64[]           torque3
float64[]           torque4
float64[]           torqueF
sensor_msgs/Imu[]   imu

float64   perf
float64   df
movement_msgs/HumanoidStateMsg  state


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
MSG: movement_msgs/PerformanceMsg
float64[] data
float64[] bins
float64   freq
float64   amp
float64   mean
float64   integral
float64   freqRef
float64   freqRange
float64   ampRef
float64   ampRange
float64   meanRef
float64   meanRange

float64   freqPerf
float64   ampPerf
float64   meanPerf

float64   wFreq
float64   wAmp
float64   wMean

float64   perf

================================================================================
MSG: sensor_msgs/Imu
# This is a message to hold data from an IMU (Inertial Measurement Unit)
#
# Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec
#
# If the covariance of the measurement is known, it should be filled in (if all you know is the 
# variance of each measurement, e.g. from the datasheet, just put those along the diagonal)
# A covariance matrix of all zeros will be interpreted as \"covariance unknown\", and to use the
# data a covariance will have to be assumed or gotten from some other source
#
# If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation 
# estimate), please set element 0 of the associated covariance matrix to -1
# If you are interpreting this message, please check for a value of -1 in the first element of each 
# covariance matrix, and disregard the associated estimate.

Header header

geometry_msgs/Quaternion orientation
float64[9] orientation_covariance # Row major about x, y, z axes

geometry_msgs/Vector3 angular_velocity
float64[9] angular_velocity_covariance # Row major about x, y, z axes

geometry_msgs/Vector3 linear_acceleration
float64[9] linear_acceleration_covariance # Row major x, y z 

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: movement_msgs/HumanoidStateMsg
float64 angX
float64 angY

float64 gyroX
float64 gyroY
float64 gyroZ

float64 accX
float64 accY
float64 accZ

")



(provide :movement_msgs/LearningMsg "bb9643324c03e2d257aa2412b115318f")


