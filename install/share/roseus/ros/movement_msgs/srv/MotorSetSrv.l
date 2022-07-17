;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::MotorSetSrv)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'MotorSetSrv (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::MOTORSETSRV")
  (make-package "MOVEMENT_MSGS::MOTORSETSRV"))
(unless (find-package "MOVEMENT_MSGS::MOTORSETSRVREQUEST")
  (make-package "MOVEMENT_MSGS::MOTORSETSRVREQUEST"))
(unless (find-package "MOVEMENT_MSGS::MOTORSETSRVRESPONSE")
  (make-package "MOVEMENT_MSGS::MOTORSETSRVRESPONSE"))

(in-package "ROS")





(defclass movement_msgs::MotorSetSrvRequest
  :super ros::object
  :slots (_toGazebo _toRobot _page _pose ))

(defmethod movement_msgs::MotorSetSrvRequest
  (:init
   (&key
    ((:toGazebo __toGazebo) nil)
    ((:toRobot __toRobot) nil)
    ((:page __page) "")
    ((:pose __pose) "")
    )
   (send-super :init)
   (setq _toGazebo __toGazebo)
   (setq _toRobot __toRobot)
   (setq _page (string __page))
   (setq _pose (string __pose))
   self)
  (:toGazebo
   (&optional (__toGazebo :null))
   (if (not (eq __toGazebo :null)) (setq _toGazebo __toGazebo)) _toGazebo)
  (:toRobot
   (&optional (__toRobot :null))
   (if (not (eq __toRobot :null)) (setq _toRobot __toRobot)) _toRobot)
  (:page
   (&optional __page)
   (if __page (setq _page __page)) _page)
  (:pose
   (&optional __pose)
   (if __pose (setq _pose __pose)) _pose)
  (:serialization-length
   ()
   (+
    ;; bool _toGazebo
    1
    ;; bool _toRobot
    1
    ;; string _page
    4 (length _page)
    ;; string _pose
    4 (length _pose)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _toGazebo
       (if _toGazebo (write-byte -1 s) (write-byte 0 s))
     ;; bool _toRobot
       (if _toRobot (write-byte -1 s) (write-byte 0 s))
     ;; string _page
       (write-long (length _page) s) (princ _page s)
     ;; string _pose
       (write-long (length _pose) s) (princ _pose s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _toGazebo
     (setq _toGazebo (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _toRobot
     (setq _toRobot (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _page
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _page (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _pose
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _pose (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass movement_msgs::MotorSetSrvResponse
  :super ros::object
  :slots ())

(defmethod movement_msgs::MotorSetSrvResponse
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

(defclass movement_msgs::MotorSetSrv
  :super ros::object
  :slots ())

(setf (get movement_msgs::MotorSetSrv :md5sum-) "ec1859e255b743457ecbab4cc3de4b47")
(setf (get movement_msgs::MotorSetSrv :datatype-) "movement_msgs/MotorSetSrv")
(setf (get movement_msgs::MotorSetSrv :request) movement_msgs::MotorSetSrvRequest)
(setf (get movement_msgs::MotorSetSrv :response) movement_msgs::MotorSetSrvResponse)

(defmethod movement_msgs::MotorSetSrvRequest
  (:response () (instance movement_msgs::MotorSetSrvResponse :init)))

(setf (get movement_msgs::MotorSetSrvRequest :md5sum-) "ec1859e255b743457ecbab4cc3de4b47")
(setf (get movement_msgs::MotorSetSrvRequest :datatype-) "movement_msgs/MotorSetSrvRequest")
(setf (get movement_msgs::MotorSetSrvRequest :definition-)
      "bool   toGazebo
bool   toRobot
string page
string pose
---



")

(setf (get movement_msgs::MotorSetSrvResponse :md5sum-) "ec1859e255b743457ecbab4cc3de4b47")
(setf (get movement_msgs::MotorSetSrvResponse :datatype-) "movement_msgs/MotorSetSrvResponse")
(setf (get movement_msgs::MotorSetSrvResponse :definition-)
      "bool   toGazebo
bool   toRobot
string page
string pose
---



")



(provide :movement_msgs/MotorSetSrv "ec1859e255b743457ecbab4cc3de4b47")


