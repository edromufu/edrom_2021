;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::ImpactMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'ImpactMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::IMPACTMSG")
  (make-package "MOVEMENT_MSGS::IMPACTMSG"))

(in-package "ROS")
;;//! \htmlinclude ImpactMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass movement_msgs::ImpactMsg
  :super ros::object
  :slots (_header _torque3 _torque4 _torqueF _force _gyroX _gyroY _gyroZ _accX _accY _accZ _angX _angY ))

(defmethod movement_msgs::ImpactMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:torque3 __torque3) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:torque4 __torque4) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:torqueF __torqueF) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:force __force) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:gyroX __gyroX) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:gyroY __gyroY) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:gyroZ __gyroZ) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:accX __accX) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:accY __accY) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:accZ __accZ) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:angX __angX) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:angY __angY) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _torque3 __torque3)
   (setq _torque4 __torque4)
   (setq _torqueF __torqueF)
   (setq _force __force)
   (setq _gyroX __gyroX)
   (setq _gyroY __gyroY)
   (setq _gyroZ __gyroZ)
   (setq _accX __accX)
   (setq _accY __accY)
   (setq _accZ __accZ)
   (setq _angX __angX)
   (setq _angY __angY)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:torque3
   (&optional __torque3)
   (if __torque3 (setq _torque3 __torque3)) _torque3)
  (:torque4
   (&optional __torque4)
   (if __torque4 (setq _torque4 __torque4)) _torque4)
  (:torqueF
   (&optional __torqueF)
   (if __torqueF (setq _torqueF __torqueF)) _torqueF)
  (:force
   (&optional __force)
   (if __force (setq _force __force)) _force)
  (:gyroX
   (&optional __gyroX)
   (if __gyroX (setq _gyroX __gyroX)) _gyroX)
  (:gyroY
   (&optional __gyroY)
   (if __gyroY (setq _gyroY __gyroY)) _gyroY)
  (:gyroZ
   (&optional __gyroZ)
   (if __gyroZ (setq _gyroZ __gyroZ)) _gyroZ)
  (:accX
   (&optional __accX)
   (if __accX (setq _accX __accX)) _accX)
  (:accY
   (&optional __accY)
   (if __accY (setq _accY __accY)) _accY)
  (:accZ
   (&optional __accZ)
   (if __accZ (setq _accZ __accZ)) _accZ)
  (:angX
   (&optional __angX)
   (if __angX (setq _angX __angX)) _angX)
  (:angY
   (&optional __angY)
   (if __angY (setq _angY __angY)) _angY)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[] _torque3
    (* 8    (length _torque3)) 4
    ;; float64[] _torque4
    (* 8    (length _torque4)) 4
    ;; float64[] _torqueF
    (* 8    (length _torqueF)) 4
    ;; float64[] _force
    (* 8    (length _force)) 4
    ;; float64[] _gyroX
    (* 8    (length _gyroX)) 4
    ;; float64[] _gyroY
    (* 8    (length _gyroY)) 4
    ;; float64[] _gyroZ
    (* 8    (length _gyroZ)) 4
    ;; float64[] _accX
    (* 8    (length _accX)) 4
    ;; float64[] _accY
    (* 8    (length _accY)) 4
    ;; float64[] _accZ
    (* 8    (length _accZ)) 4
    ;; float64[] _angX
    (* 8    (length _angX)) 4
    ;; float64[] _angY
    (* 8    (length _angY)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
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
     ;; float64[] _force
     (write-long (length _force) s)
     (dotimes (i (length _force))
       (sys::poke (elt _force i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _gyroX
     (write-long (length _gyroX) s)
     (dotimes (i (length _gyroX))
       (sys::poke (elt _gyroX i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _gyroY
     (write-long (length _gyroY) s)
     (dotimes (i (length _gyroY))
       (sys::poke (elt _gyroY i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _gyroZ
     (write-long (length _gyroZ) s)
     (dotimes (i (length _gyroZ))
       (sys::poke (elt _gyroZ i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _accX
     (write-long (length _accX) s)
     (dotimes (i (length _accX))
       (sys::poke (elt _accX i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _accY
     (write-long (length _accY) s)
     (dotimes (i (length _accY))
       (sys::poke (elt _accY i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _accZ
     (write-long (length _accZ) s)
     (dotimes (i (length _accZ))
       (sys::poke (elt _accZ i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _angX
     (write-long (length _angX) s)
     (dotimes (i (length _angX))
       (sys::poke (elt _angX i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _angY
     (write-long (length _angY) s)
     (dotimes (i (length _angY))
       (sys::poke (elt _angY i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
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
   ;; float64[] _force
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _force (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _force i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _gyroX
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _gyroX (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _gyroX i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _gyroY
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _gyroY (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _gyroY i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _gyroZ
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _gyroZ (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _gyroZ i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _accX
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _accX (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _accX i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _accY
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _accY (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _accY i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _accZ
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _accZ (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _accZ i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _angX
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _angX (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _angX i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _angY
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _angY (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _angY i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get movement_msgs::ImpactMsg :md5sum-) "357f66bf5373be40bb62fd4edd456730")
(setf (get movement_msgs::ImpactMsg :datatype-) "movement_msgs/ImpactMsg")
(setf (get movement_msgs::ImpactMsg :definition-)
      "Header    header

float64[]   torque3
float64[]   torque4
float64[]   torqueF
float64[]   force
float64[]   gyroX
float64[]   gyroY
float64[]   gyroZ
float64[]   accX
float64[]   accY
float64[]   accZ
float64[]   angX
float64[]   angY




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

")



(provide :movement_msgs/ImpactMsg "357f66bf5373be40bb62fd4edd456730")


