;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::LipParamsSrv)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'LipParamsSrv (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::LIPPARAMSSRV")
  (make-package "MOVEMENT_MSGS::LIPPARAMSSRV"))
(unless (find-package "MOVEMENT_MSGS::LIPPARAMSSRVREQUEST")
  (make-package "MOVEMENT_MSGS::LIPPARAMSSRVREQUEST"))
(unless (find-package "MOVEMENT_MSGS::LIPPARAMSSRVRESPONSE")
  (make-package "MOVEMENT_MSGS::LIPPARAMSSRVRESPONSE"))

(in-package "ROS")





(defclass movement_msgs::LipParamsSrvRequest
  :super ros::object
  :slots (_get_params _zCCorr _tS _tD _stepH ))

(defmethod movement_msgs::LipParamsSrvRequest
  (:init
   (&key
    ((:get_params __get_params) nil)
    ((:zCCorr __zCCorr) 0.0)
    ((:tS __tS) 0.0)
    ((:tD __tD) 0.0)
    ((:stepH __stepH) 0.0)
    )
   (send-super :init)
   (setq _get_params __get_params)
   (setq _zCCorr (float __zCCorr))
   (setq _tS (float __tS))
   (setq _tD (float __tD))
   (setq _stepH (float __stepH))
   self)
  (:get_params
   (&optional (__get_params :null))
   (if (not (eq __get_params :null)) (setq _get_params __get_params)) _get_params)
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
  (:serialization-length
   ()
   (+
    ;; bool _get_params
    1
    ;; float64 _zCCorr
    8
    ;; float64 _tS
    8
    ;; float64 _tD
    8
    ;; float64 _stepH
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _get_params
       (if _get_params (write-byte -1 s) (write-byte 0 s))
     ;; float64 _zCCorr
       (sys::poke _zCCorr (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _tS
       (sys::poke _tS (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _tD
       (sys::poke _tD (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _stepH
       (sys::poke _stepH (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _get_params
     (setq _get_params (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _zCCorr
     (setq _zCCorr (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _tS
     (setq _tS (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _tD
     (setq _tD (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _stepH
     (setq _stepH (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass movement_msgs::LipParamsSrvResponse
  :super ros::object
  :slots (_zCCorr _tS _tD _stepH _delayR _delayL _delayAll _vx _vy _vz ))

(defmethod movement_msgs::LipParamsSrvResponse
  (:init
   (&key
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

(defclass movement_msgs::LipParamsSrv
  :super ros::object
  :slots ())

(setf (get movement_msgs::LipParamsSrv :md5sum-) "f49d9d3d13a09f7a44ea1b8e3860a944")
(setf (get movement_msgs::LipParamsSrv :datatype-) "movement_msgs/LipParamsSrv")
(setf (get movement_msgs::LipParamsSrv :request) movement_msgs::LipParamsSrvRequest)
(setf (get movement_msgs::LipParamsSrv :response) movement_msgs::LipParamsSrvResponse)

(defmethod movement_msgs::LipParamsSrvRequest
  (:response () (instance movement_msgs::LipParamsSrvResponse :init)))

(setf (get movement_msgs::LipParamsSrvRequest :md5sum-) "f49d9d3d13a09f7a44ea1b8e3860a944")
(setf (get movement_msgs::LipParamsSrvRequest :datatype-) "movement_msgs/LipParamsSrvRequest")
(setf (get movement_msgs::LipParamsSrvRequest :definition-)
      "bool    get_params
float64 zCCorr
float64 tS
float64 tD
float64 stepH

---

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

(setf (get movement_msgs::LipParamsSrvResponse :md5sum-) "f49d9d3d13a09f7a44ea1b8e3860a944")
(setf (get movement_msgs::LipParamsSrvResponse :datatype-) "movement_msgs/LipParamsSrvResponse")
(setf (get movement_msgs::LipParamsSrvResponse :definition-)
      "bool    get_params
float64 zCCorr
float64 tS
float64 tD
float64 stepH

---

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



(provide :movement_msgs/LipParamsSrv "f49d9d3d13a09f7a44ea1b8e3860a944")


