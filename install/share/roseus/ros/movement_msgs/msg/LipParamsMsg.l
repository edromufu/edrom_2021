;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::LipParamsMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'LipParamsMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::LIPPARAMSMSG")
  (make-package "MOVEMENT_MSGS::LIPPARAMSMSG"))

(in-package "ROS")
;;//! \htmlinclude LipParamsMsg.msg.html


(defclass movement_msgs::LipParamsMsg
  :super ros::object
  :slots (_first_pose _move_head _walk_flag _test_mode _zCCorr _tS _tD _stepH _delayR _delayL _delayAll _vx _vy _vz ))

(defmethod movement_msgs::LipParamsMsg
  (:init
   (&key
    ((:first_pose __first_pose) nil)
    ((:move_head __move_head) nil)
    ((:walk_flag __walk_flag) nil)
    ((:test_mode __test_mode) nil)
    ((:zCCorr __zCCorr) 0.0)
    ((:tS __tS) 0.0)
    ((:tD __tD) 0.0)
    ((:stepH __stepH) 0.0)
    ((:delayR __delayR) 0.0)
    ((:delayL __delayL) 0.0)
    ((:delayAll __delayAll) 0.0)
    ((:vx __vx) 0.0)
    ((:vy __vy) 0.0)
    ((:vz __vz) 0.0)
    )
   (send-super :init)
   (setq _first_pose __first_pose)
   (setq _move_head __move_head)
   (setq _walk_flag __walk_flag)
   (setq _test_mode __test_mode)
   (setq _zCCorr (float __zCCorr))
   (setq _tS (float __tS))
   (setq _tD (float __tD))
   (setq _stepH (float __stepH))
   (setq _delayR (float __delayR))
   (setq _delayL (float __delayL))
   (setq _delayAll (float __delayAll))
   (setq _vx (float __vx))
   (setq _vy (float __vy))
   (setq _vz (float __vz))
   self)
  (:first_pose
   (&optional (__first_pose :null))
   (if (not (eq __first_pose :null)) (setq _first_pose __first_pose)) _first_pose)
  (:move_head
   (&optional (__move_head :null))
   (if (not (eq __move_head :null)) (setq _move_head __move_head)) _move_head)
  (:walk_flag
   (&optional (__walk_flag :null))
   (if (not (eq __walk_flag :null)) (setq _walk_flag __walk_flag)) _walk_flag)
  (:test_mode
   (&optional (__test_mode :null))
   (if (not (eq __test_mode :null)) (setq _test_mode __test_mode)) _test_mode)
  (:zCCorr
   (&optional __zCCorr)
   (if __zCCorr (setq _zCCorr __zCCorr)) _zCCorr)
  (:tS
   (&optional __tS)
   (if __tS (setq _tS __tS)) _tS)
  (:tD
   (&optional __tD)
   (if __tD (setq _tD __tD)) _tD)
  (:stepH
   (&optional __stepH)
   (if __stepH (setq _stepH __stepH)) _stepH)
  (:delayR
   (&optional __delayR)
   (if __delayR (setq _delayR __delayR)) _delayR)
  (:delayL
   (&optional __delayL)
   (if __delayL (setq _delayL __delayL)) _delayL)
  (:delayAll
   (&optional __delayAll)
   (if __delayAll (setq _delayAll __delayAll)) _delayAll)
  (:vx
   (&optional __vx)
   (if __vx (setq _vx __vx)) _vx)
  (:vy
   (&optional __vy)
   (if __vy (setq _vy __vy)) _vy)
  (:vz
   (&optional __vz)
   (if __vz (setq _vz __vz)) _vz)
  (:serialization-length
   ()
   (+
    ;; bool _first_pose
    1
    ;; bool _move_head
    1
    ;; bool _walk_flag
    1
    ;; bool _test_mode
    1
    ;; float64 _zCCorr
    8
    ;; float64 _tS
    8
    ;; float64 _tD
    8
    ;; float64 _stepH
    8
    ;; float64 _delayR
    8
    ;; float64 _delayL
    8
    ;; float64 _delayAll
    8
    ;; float64 _vx
    8
    ;; float64 _vy
    8
    ;; float64 _vz
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _first_pose
       (if _first_pose (write-byte -1 s) (write-byte 0 s))
     ;; bool _move_head
       (if _move_head (write-byte -1 s) (write-byte 0 s))
     ;; bool _walk_flag
       (if _walk_flag (write-byte -1 s) (write-byte 0 s))
     ;; bool _test_mode
       (if _test_mode (write-byte -1 s) (write-byte 0 s))
     ;; float64 _zCCorr
       (sys::poke _zCCorr (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _tS
       (sys::poke _tS (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _tD
       (sys::poke _tD (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _stepH
       (sys::poke _stepH (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _delayR
       (sys::poke _delayR (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _delayL
       (sys::poke _delayL (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _delayAll
       (sys::poke _delayAll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vx
       (sys::poke _vx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vy
       (sys::poke _vy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vz
       (sys::poke _vz (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _first_pose
     (setq _first_pose (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _move_head
     (setq _move_head (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _walk_flag
     (setq _walk_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _test_mode
     (setq _test_mode (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _zCCorr
     (setq _zCCorr (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _tS
     (setq _tS (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _tD
     (setq _tD (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _stepH
     (setq _stepH (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _delayR
     (setq _delayR (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _delayL
     (setq _delayL (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _delayAll
     (setq _delayAll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vx
     (setq _vx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vy
     (setq _vy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vz
     (setq _vz (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get movement_msgs::LipParamsMsg :md5sum-) "6a778c748371c895283cbab464bdfc2f")
(setf (get movement_msgs::LipParamsMsg :datatype-) "movement_msgs/LipParamsMsg")
(setf (get movement_msgs::LipParamsMsg :definition-)
      "bool    first_pose
bool    move_head
bool    walk_flag
bool    test_mode
float64 zCCorr
float64 tS
float64 tD
float64 stepH
float64 delayR
float64 delayL
float64 delayAll
float64 vx
float64 vy
float64 vz



")



(provide :movement_msgs/LipParamsMsg "6a778c748371c895283cbab464bdfc2f")


