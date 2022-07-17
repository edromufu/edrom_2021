;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::EndEffMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'EndEffMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::ENDEFFMSG")
  (make-package "MOVEMENT_MSGS::ENDEFFMSG"))

(in-package "ROS")
;;//! \htmlinclude EndEffMsg.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass movement_msgs::EndEffMsg
  :super ros::object
  :slots (_pos _vel _acc _rot _type _flag _dt ))

(defmethod movement_msgs::EndEffMsg
  (:init
   (&key
    ((:pos __pos) (instance geometry_msgs::Point :init))
    ((:vel __vel) (instance geometry_msgs::Point :init))
    ((:acc __acc) (instance geometry_msgs::Point :init))
    ((:rot __rot) (instance geometry_msgs::Point :init))
    ((:type __type) 0)
    ((:flag __flag) 0)
    ((:dt __dt) 0.0)
    )
   (send-super :init)
   (setq _pos __pos)
   (setq _vel __vel)
   (setq _acc __acc)
   (setq _rot __rot)
   (setq _type (round __type))
   (setq _flag (round __flag))
   (setq _dt (float __dt))
   self)
  (:pos
   (&rest __pos)
   (if (keywordp (car __pos))
       (send* _pos __pos)
     (progn
       (if __pos (setq _pos (car __pos)))
       _pos)))
  (:vel
   (&rest __vel)
   (if (keywordp (car __vel))
       (send* _vel __vel)
     (progn
       (if __vel (setq _vel (car __vel)))
       _vel)))
  (:acc
   (&rest __acc)
   (if (keywordp (car __acc))
       (send* _acc __acc)
     (progn
       (if __acc (setq _acc (car __acc)))
       _acc)))
  (:rot
   (&rest __rot)
   (if (keywordp (car __rot))
       (send* _rot __rot)
     (progn
       (if __rot (setq _rot (car __rot)))
       _rot)))
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:flag
   (&optional __flag)
   (if __flag (setq _flag __flag)) _flag)
  (:dt
   (&optional __dt)
   (if __dt (setq _dt __dt)) _dt)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _pos
    (send _pos :serialization-length)
    ;; geometry_msgs/Point _vel
    (send _vel :serialization-length)
    ;; geometry_msgs/Point _acc
    (send _acc :serialization-length)
    ;; geometry_msgs/Point _rot
    (send _rot :serialization-length)
    ;; int32 _type
    4
    ;; int32 _flag
    4
    ;; float64 _dt
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _pos
       (send _pos :serialize s)
     ;; geometry_msgs/Point _vel
       (send _vel :serialize s)
     ;; geometry_msgs/Point _acc
       (send _acc :serialize s)
     ;; geometry_msgs/Point _rot
       (send _rot :serialize s)
     ;; int32 _type
       (write-long _type s)
     ;; int32 _flag
       (write-long _flag s)
     ;; float64 _dt
       (sys::poke _dt (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _pos
     (send _pos :deserialize buf ptr-) (incf ptr- (send _pos :serialization-length))
   ;; geometry_msgs/Point _vel
     (send _vel :deserialize buf ptr-) (incf ptr- (send _vel :serialization-length))
   ;; geometry_msgs/Point _acc
     (send _acc :deserialize buf ptr-) (incf ptr- (send _acc :serialization-length))
   ;; geometry_msgs/Point _rot
     (send _rot :deserialize buf ptr-) (incf ptr- (send _rot :serialization-length))
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _flag
     (setq _flag (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _dt
     (setq _dt (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get movement_msgs::EndEffMsg :md5sum-) "25f406f2d522d107819391a084c12896")
(setf (get movement_msgs::EndEffMsg :datatype-) "movement_msgs/EndEffMsg")
(setf (get movement_msgs::EndEffMsg :definition-)
      "geometry_msgs/Point  pos
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



(provide :movement_msgs/EndEffMsg "25f406f2d522d107819391a084c12896")


