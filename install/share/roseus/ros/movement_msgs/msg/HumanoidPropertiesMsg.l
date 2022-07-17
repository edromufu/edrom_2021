;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::HumanoidPropertiesMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'HumanoidPropertiesMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::HUMANOIDPROPERTIESMSG")
  (make-package "MOVEMENT_MSGS::HUMANOIDPROPERTIESMSG"))

(in-package "ROS")
;;//! \htmlinclude HumanoidPropertiesMsg.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass movement_msgs::HumanoidPropertiesMsg
  :super ros::object
  :slots (_squat _open _incl _sideIncl _footIncl _zmpPoint _comPoint _footComPoint _torq ))

(defmethod movement_msgs::HumanoidPropertiesMsg
  (:init
   (&key
    ((:squat __squat) 0.0)
    ((:open __open) 0.0)
    ((:incl __incl) 0.0)
    ((:sideIncl __sideIncl) 0.0)
    ((:footIncl __footIncl) 0.0)
    ((:zmpPoint __zmpPoint) (instance geometry_msgs::Point :init))
    ((:comPoint __comPoint) (instance geometry_msgs::Point :init))
    ((:footComPoint __footComPoint) (instance geometry_msgs::Point :init))
    ((:torq __torq) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _squat (float __squat))
   (setq _open (float __open))
   (setq _incl (float __incl))
   (setq _sideIncl (float __sideIncl))
   (setq _footIncl (float __footIncl))
   (setq _zmpPoint __zmpPoint)
   (setq _comPoint __comPoint)
   (setq _footComPoint __footComPoint)
   (setq _torq __torq)
   self)
  (:squat
   (&optional __squat)
   (if __squat (setq _squat __squat)) _squat)
  (:open
   (&optional __open)
   (if __open (setq _open __open)) _open)
  (:incl
   (&optional __incl)
   (if __incl (setq _incl __incl)) _incl)
  (:sideIncl
   (&optional __sideIncl)
   (if __sideIncl (setq _sideIncl __sideIncl)) _sideIncl)
  (:footIncl
   (&optional __footIncl)
   (if __footIncl (setq _footIncl __footIncl)) _footIncl)
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
    ;; float64 _squat
    8
    ;; float64 _open
    8
    ;; float64 _incl
    8
    ;; float64 _sideIncl
    8
    ;; float64 _footIncl
    8
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
     ;; float64 _squat
       (sys::poke _squat (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _open
       (sys::poke _open (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _incl
       (sys::poke _incl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _sideIncl
       (sys::poke _sideIncl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _footIncl
       (sys::poke _footIncl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; float64 _squat
     (setq _squat (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _open
     (setq _open (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _incl
     (setq _incl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _sideIncl
     (setq _sideIncl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _footIncl
     (setq _footIncl (sys::peek buf ptr- :double)) (incf ptr- 8)
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

(setf (get movement_msgs::HumanoidPropertiesMsg :md5sum-) "ed5d141b03975d3cb4615c633a218029")
(setf (get movement_msgs::HumanoidPropertiesMsg :datatype-) "movement_msgs/HumanoidPropertiesMsg")
(setf (get movement_msgs::HumanoidPropertiesMsg :definition-)
      "float64               squat
float64               open
float64               incl
float64               sideIncl
float64               footIncl
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



(provide :movement_msgs/HumanoidPropertiesMsg "ed5d141b03975d3cb4615c633a218029")


