;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::HeadMoveMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'HeadMoveMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::HEADMOVEMSG")
  (make-package "MOVEMENT_MSGS::HEADMOVEMSG"))

(in-package "ROS")
;;//! \htmlinclude HeadMoveMsg.msg.html


(defclass movement_msgs::HeadMoveMsg
  :super ros::object
  :slots (_xMove _yMove _pos _xPos _yPos ))

(defmethod movement_msgs::HeadMoveMsg
  (:init
   (&key
    ((:xMove __xMove) 0)
    ((:yMove __yMove) 0)
    ((:pos __pos) 0)
    ((:xPos __xPos) 0.0)
    ((:yPos __yPos) 0.0)
    )
   (send-super :init)
   (setq _xMove (round __xMove))
   (setq _yMove (round __yMove))
   (setq _pos (round __pos))
   (setq _xPos (float __xPos))
   (setq _yPos (float __yPos))
   self)
  (:xMove
   (&optional __xMove)
   (if __xMove (setq _xMove __xMove)) _xMove)
  (:yMove
   (&optional __yMove)
   (if __yMove (setq _yMove __yMove)) _yMove)
  (:pos
   (&optional __pos)
   (if __pos (setq _pos __pos)) _pos)
  (:xPos
   (&optional __xPos)
   (if __xPos (setq _xPos __xPos)) _xPos)
  (:yPos
   (&optional __yPos)
   (if __yPos (setq _yPos __yPos)) _yPos)
  (:serialization-length
   ()
   (+
    ;; int32 _xMove
    4
    ;; int32 _yMove
    4
    ;; int16 _pos
    2
    ;; float64 _xPos
    8
    ;; float64 _yPos
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _xMove
       (write-long _xMove s)
     ;; int32 _yMove
       (write-long _yMove s)
     ;; int16 _pos
       (write-word _pos s)
     ;; float64 _xPos
       (sys::poke _xPos (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yPos
       (sys::poke _yPos (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _xMove
     (setq _xMove (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _yMove
     (setq _yMove (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int16 _pos
     (setq _pos (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _xPos
     (setq _xPos (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yPos
     (setq _yPos (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get movement_msgs::HeadMoveMsg :md5sum-) "cfc3b4f883111d2901b09d0640ace5ea")
(setf (get movement_msgs::HeadMoveMsg :datatype-) "movement_msgs/HeadMoveMsg")
(setf (get movement_msgs::HeadMoveMsg :definition-)
      "int32    xMove  
int32    yMove
int16	 pos
float64  xPos
float64  yPos

")



(provide :movement_msgs/HeadMoveMsg "cfc3b4f883111d2901b09d0640ace5ea")


