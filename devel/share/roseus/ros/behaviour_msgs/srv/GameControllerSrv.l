;; Auto-generated. Do not edit!


(when (boundp 'behaviour_msgs::GameControllerSrv)
  (if (not (find-package "BEHAVIOUR_MSGS"))
    (make-package "BEHAVIOUR_MSGS"))
  (shadow 'GameControllerSrv (find-package "BEHAVIOUR_MSGS")))
(unless (find-package "BEHAVIOUR_MSGS::GAMECONTROLLERSRV")
  (make-package "BEHAVIOUR_MSGS::GAMECONTROLLERSRV"))
(unless (find-package "BEHAVIOUR_MSGS::GAMECONTROLLERSRVREQUEST")
  (make-package "BEHAVIOUR_MSGS::GAMECONTROLLERSRVREQUEST"))
(unless (find-package "BEHAVIOUR_MSGS::GAMECONTROLLERSRVRESPONSE")
  (make-package "BEHAVIOUR_MSGS::GAMECONTROLLERSRVRESPONSE"))

(in-package "ROS")





(defclass behaviour_msgs::GameControllerSrvRequest
  :super ros::object
  :slots (_host _port ))

(defmethod behaviour_msgs::GameControllerSrvRequest
  (:init
   (&key
    ((:host __host) "")
    ((:port __port) 0)
    )
   (send-super :init)
   (setq _host (string __host))
   (setq _port (round __port))
   self)
  (:host
   (&optional __host)
   (if __host (setq _host __host)) _host)
  (:port
   (&optional __port)
   (if __port (setq _port __port)) _port)
  (:serialization-length
   ()
   (+
    ;; string _host
    4 (length _host)
    ;; int32 _port
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _host
       (write-long (length _host) s) (princ _host s)
     ;; int32 _port
       (write-long _port s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _host
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _host (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _port
     (setq _port (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass behaviour_msgs::GameControllerSrvResponse
  :super ros::object
  :slots ())

(defmethod behaviour_msgs::GameControllerSrvResponse
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

(defclass behaviour_msgs::GameControllerSrv
  :super ros::object
  :slots ())

(setf (get behaviour_msgs::GameControllerSrv :md5sum-) "55932133259e8c3335a553618447da45")
(setf (get behaviour_msgs::GameControllerSrv :datatype-) "behaviour_msgs/GameControllerSrv")
(setf (get behaviour_msgs::GameControllerSrv :request) behaviour_msgs::GameControllerSrvRequest)
(setf (get behaviour_msgs::GameControllerSrv :response) behaviour_msgs::GameControllerSrvResponse)

(defmethod behaviour_msgs::GameControllerSrvRequest
  (:response () (instance behaviour_msgs::GameControllerSrvResponse :init)))

(setf (get behaviour_msgs::GameControllerSrvRequest :md5sum-) "55932133259e8c3335a553618447da45")
(setf (get behaviour_msgs::GameControllerSrvRequest :datatype-) "behaviour_msgs/GameControllerSrvRequest")
(setf (get behaviour_msgs::GameControllerSrvRequest :definition-)
      "string host
int32 port

---

")

(setf (get behaviour_msgs::GameControllerSrvResponse :md5sum-) "55932133259e8c3335a553618447da45")
(setf (get behaviour_msgs::GameControllerSrvResponse :datatype-) "behaviour_msgs/GameControllerSrvResponse")
(setf (get behaviour_msgs::GameControllerSrvResponse :definition-)
      "string host
int32 port

---

")



(provide :behaviour_msgs/GameControllerSrv "55932133259e8c3335a553618447da45")


