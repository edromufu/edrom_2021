;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::PredefinedMovementSrv)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'PredefinedMovementSrv (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::PREDEFINEDMOVEMENTSRV")
  (make-package "MOVEMENT_MSGS::PREDEFINEDMOVEMENTSRV"))
(unless (find-package "MOVEMENT_MSGS::PREDEFINEDMOVEMENTSRVREQUEST")
  (make-package "MOVEMENT_MSGS::PREDEFINEDMOVEMENTSRVREQUEST"))
(unless (find-package "MOVEMENT_MSGS::PREDEFINEDMOVEMENTSRVRESPONSE")
  (make-package "MOVEMENT_MSGS::PREDEFINEDMOVEMENTSRVRESPONSE"))

(in-package "ROS")





(defclass movement_msgs::PredefinedMovementSrvRequest
  :super ros::object
  :slots (_request ))

(defmethod movement_msgs::PredefinedMovementSrvRequest
  (:init
   (&key
    ((:request __request) "")
    )
   (send-super :init)
   (setq _request (string __request))
   self)
  (:request
   (&optional __request)
   (if __request (setq _request __request)) _request)
  (:serialization-length
   ()
   (+
    ;; string _request
    4 (length _request)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _request
       (write-long (length _request) s) (princ _request s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _request
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _request (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass movement_msgs::PredefinedMovementSrvResponse
  :super ros::object
  :slots (_sucess ))

(defmethod movement_msgs::PredefinedMovementSrvResponse
  (:init
   (&key
    ((:sucess __sucess) nil)
    )
   (send-super :init)
   (setq _sucess __sucess)
   self)
  (:sucess
   (&optional (__sucess :null))
   (if (not (eq __sucess :null)) (setq _sucess __sucess)) _sucess)
  (:serialization-length
   ()
   (+
    ;; bool _sucess
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _sucess
       (if _sucess (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _sucess
     (setq _sucess (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass movement_msgs::PredefinedMovementSrv
  :super ros::object
  :slots ())

(setf (get movement_msgs::PredefinedMovementSrv :md5sum-) "bfd977d15515237025d35499f550165a")
(setf (get movement_msgs::PredefinedMovementSrv :datatype-) "movement_msgs/PredefinedMovementSrv")
(setf (get movement_msgs::PredefinedMovementSrv :request) movement_msgs::PredefinedMovementSrvRequest)
(setf (get movement_msgs::PredefinedMovementSrv :response) movement_msgs::PredefinedMovementSrvResponse)

(defmethod movement_msgs::PredefinedMovementSrvRequest
  (:response () (instance movement_msgs::PredefinedMovementSrvResponse :init)))

(setf (get movement_msgs::PredefinedMovementSrvRequest :md5sum-) "bfd977d15515237025d35499f550165a")
(setf (get movement_msgs::PredefinedMovementSrvRequest :datatype-) "movement_msgs/PredefinedMovementSrvRequest")
(setf (get movement_msgs::PredefinedMovementSrvRequest :definition-)
      "string request

---

bool sucess

")

(setf (get movement_msgs::PredefinedMovementSrvResponse :md5sum-) "bfd977d15515237025d35499f550165a")
(setf (get movement_msgs::PredefinedMovementSrvResponse :datatype-) "movement_msgs/PredefinedMovementSrvResponse")
(setf (get movement_msgs::PredefinedMovementSrvResponse :definition-)
      "string request

---

bool sucess

")



(provide :movement_msgs/PredefinedMovementSrv "bfd977d15515237025d35499f550165a")


