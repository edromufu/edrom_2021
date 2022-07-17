;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::LipCmdSrv)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'LipCmdSrv (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::LIPCMDSRV")
  (make-package "MOVEMENT_MSGS::LIPCMDSRV"))
(unless (find-package "MOVEMENT_MSGS::LIPCMDSRVREQUEST")
  (make-package "MOVEMENT_MSGS::LIPCMDSRVREQUEST"))
(unless (find-package "MOVEMENT_MSGS::LIPCMDSRVRESPONSE")
  (make-package "MOVEMENT_MSGS::LIPCMDSRVRESPONSE"))

(in-package "ROS")





(defclass movement_msgs::LipCmdSrvRequest
  :super ros::object
  :slots (_first_pose _move_head _walk_flag _reset_walk _test_mode _vx _vy _vz ))

(defmethod movement_msgs::LipCmdSrvRequest
  (:init
   (&key
    ((:first_pose __first_pose) nil)
    ((:move_head __move_head) nil)
    ((:walk_flag __walk_flag) nil)
    ((:reset_walk __reset_walk) nil)
    ((:test_mode __test_mode) nil)
    ((:vx __vx) 0.0)
    ((:vy __vy) 0.0)
    ((:vz __vz) 0.0)
    )
   (send-super :init)
   (setq _first_pose __first_pose)
   (setq _move_head __move_head)
   (setq _walk_flag __walk_flag)
   (setq _reset_walk __reset_walk)
   (setq _test_mode __test_mode)
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
  (:reset_walk
   (&optional (__reset_walk :null))
   (if (not (eq __reset_walk :null)) (setq _reset_walk __reset_walk)) _reset_walk)
  (:test_mode
   (&optional (__test_mode :null))
   (if (not (eq __test_mode :null)) (setq _test_mode __test_mode)) _test_mode)
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
    ;; bool _reset_walk
    1
    ;; bool _test_mode
    1
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
     ;; bool _reset_walk
       (if _reset_walk (write-byte -1 s) (write-byte 0 s))
     ;; bool _test_mode
       (if _test_mode (write-byte -1 s) (write-byte 0 s))
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
   ;; bool _reset_walk
     (setq _reset_walk (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _test_mode
     (setq _test_mode (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _vx
     (setq _vx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vy
     (setq _vy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vz
     (setq _vz (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass movement_msgs::LipCmdSrvResponse
  :super ros::object
  :slots ())

(defmethod movement_msgs::LipCmdSrvResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass movement_msgs::LipCmdSrv
  :super ros::object
  :slots ())

(setf (get movement_msgs::LipCmdSrv :md5sum-) "4433778752b474643548f0d3ce287ab0")
(setf (get movement_msgs::LipCmdSrv :datatype-) "movement_msgs/LipCmdSrv")
(setf (get movement_msgs::LipCmdSrv :request) movement_msgs::LipCmdSrvRequest)
(setf (get movement_msgs::LipCmdSrv :response) movement_msgs::LipCmdSrvResponse)

(defmethod movement_msgs::LipCmdSrvRequest
  (:response () (instance movement_msgs::LipCmdSrvResponse :init)))

(setf (get movement_msgs::LipCmdSrvRequest :md5sum-) "4433778752b474643548f0d3ce287ab0")
(setf (get movement_msgs::LipCmdSrvRequest :datatype-) "movement_msgs/LipCmdSrvRequest")
(setf (get movement_msgs::LipCmdSrvRequest :definition-)
      "bool    first_pose
bool    move_head
bool    walk_flag
bool    reset_walk 
bool    test_mode
float64 vx
float64 vy
float64 vz

---



")

(setf (get movement_msgs::LipCmdSrvResponse :md5sum-) "4433778752b474643548f0d3ce287ab0")
(setf (get movement_msgs::LipCmdSrvResponse :datatype-) "movement_msgs/LipCmdSrvResponse")
(setf (get movement_msgs::LipCmdSrvResponse :definition-)
      "bool    first_pose
bool    move_head
bool    walk_flag
bool    reset_walk 
bool    test_mode
float64 vx
float64 vy
float64 vz

---



")



(provide :movement_msgs/LipCmdSrv "4433778752b474643548f0d3ce287ab0")


