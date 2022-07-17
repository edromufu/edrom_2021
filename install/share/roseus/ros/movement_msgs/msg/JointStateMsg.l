;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::JointStateMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'JointStateMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::JOINTSTATEMSG")
  (make-package "MOVEMENT_MSGS::JOINTSTATEMSG"))

(in-package "ROS")
;;//! \htmlinclude JointStateMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass movement_msgs::JointStateMsg
  :super ros::object
  :slots (_header _pos _vel _acc _torq _writeCommand _kind _readCommand _type _source _dt ))

(defmethod movement_msgs::JointStateMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pos __pos) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:vel __vel) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:acc __acc) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:torq __torq) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:writeCommand __writeCommand) "")
    ((:kind __kind) "")
    ((:readCommand __readCommand) "")
    ((:type __type) 0)
    ((:source __source) 0)
    ((:dt __dt) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _pos __pos)
   (setq _vel __vel)
   (setq _acc __acc)
   (setq _torq __torq)
   (setq _writeCommand (string __writeCommand))
   (setq _kind (string __kind))
   (setq _readCommand (string __readCommand))
   (setq _type (round __type))
   (setq _source (round __source))
   (setq _dt (float __dt))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pos
   (&optional __pos)
   (if __pos (setq _pos __pos)) _pos)
  (:vel
   (&optional __vel)
   (if __vel (setq _vel __vel)) _vel)
  (:acc
   (&optional __acc)
   (if __acc (setq _acc __acc)) _acc)
  (:torq
   (&optional __torq)
   (if __torq (setq _torq __torq)) _torq)
  (:writeCommand
   (&optional __writeCommand)
   (if __writeCommand (setq _writeCommand __writeCommand)) _writeCommand)
  (:kind
   (&optional __kind)
   (if __kind (setq _kind __kind)) _kind)
  (:readCommand
   (&optional __readCommand)
   (if __readCommand (setq _readCommand __readCommand)) _readCommand)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:source
   (&optional __source)
   (if __source (setq _source __source)) _source)
  (:dt
   (&optional __dt)
   (if __dt (setq _dt __dt)) _dt)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[] _pos
    (* 8    (length _pos)) 4
    ;; float64[] _vel
    (* 8    (length _vel)) 4
    ;; float64[] _acc
    (* 8    (length _acc)) 4
    ;; float64[] _torq
    (* 8    (length _torq)) 4
    ;; string _writeCommand
    4 (length _writeCommand)
    ;; string _kind
    4 (length _kind)
    ;; string _readCommand
    4 (length _readCommand)
    ;; int32 _type
    4
    ;; int32 _source
    4
    ;; float64 _dt
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64[] _pos
     (write-long (length _pos) s)
     (dotimes (i (length _pos))
       (sys::poke (elt _pos i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _vel
     (write-long (length _vel) s)
     (dotimes (i (length _vel))
       (sys::poke (elt _vel i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _acc
     (write-long (length _acc) s)
     (dotimes (i (length _acc))
       (sys::poke (elt _acc i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _torq
     (write-long (length _torq) s)
     (dotimes (i (length _torq))
       (sys::poke (elt _torq i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; string _writeCommand
       (write-long (length _writeCommand) s) (princ _writeCommand s)
     ;; string _kind
       (write-long (length _kind) s) (princ _kind s)
     ;; string _readCommand
       (write-long (length _readCommand) s) (princ _readCommand s)
     ;; int32 _type
       (write-long _type s)
     ;; int32 _source
       (write-long _source s)
     ;; float64 _dt
       (sys::poke _dt (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64[] _pos
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pos (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pos i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _vel
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _vel (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _vel i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _acc
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _acc (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _acc i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _torq
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _torq (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _torq i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; string _writeCommand
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _writeCommand (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _kind
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _kind (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _readCommand
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _readCommand (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _source
     (setq _source (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _dt
     (setq _dt (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get movement_msgs::JointStateMsg :md5sum-) "d7972f556d5c14278ff625e52fac2b86")
(setf (get movement_msgs::JointStateMsg :datatype-) "movement_msgs/JointStateMsg")
(setf (get movement_msgs::JointStateMsg :definition-)
      "Header    header
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

")



(provide :movement_msgs/JointStateMsg "d7972f556d5c14278ff625e52fac2b86")


