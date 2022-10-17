;; Auto-generated. Do not edit!


(when (boundp 'behaviour_msgs::yamlTransitionSrv)
  (if (not (find-package "BEHAVIOUR_MSGS"))
    (make-package "BEHAVIOUR_MSGS"))
  (shadow 'yamlTransitionSrv (find-package "BEHAVIOUR_MSGS")))
(unless (find-package "BEHAVIOUR_MSGS::YAMLTRANSITIONSRV")
  (make-package "BEHAVIOUR_MSGS::YAMLTRANSITIONSRV"))
(unless (find-package "BEHAVIOUR_MSGS::YAMLTRANSITIONSRVREQUEST")
  (make-package "BEHAVIOUR_MSGS::YAMLTRANSITIONSRVREQUEST"))
(unless (find-package "BEHAVIOUR_MSGS::YAMLTRANSITIONSRVRESPONSE")
  (make-package "BEHAVIOUR_MSGS::YAMLTRANSITIONSRVRESPONSE"))

(in-package "ROS")





(defclass behaviour_msgs::yamlTransitionSrvRequest
  :super ros::object
  :slots (_decision ))

(defmethod behaviour_msgs::yamlTransitionSrvRequest
  (:init
   (&key
    ((:decision __decision) "")
    )
   (send-super :init)
   (setq _decision (string __decision))
   self)
  (:decision
   (&optional __decision)
   (if __decision (setq _decision __decision)) _decision)
  (:serialization-length
   ()
   (+
    ;; string _decision
    4 (length _decision)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _decision
       (write-long (length _decision) s) (princ _decision s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _decision
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _decision (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass behaviour_msgs::yamlTransitionSrvResponse
  :super ros::object
  :slots (_confirmation ))

(defmethod behaviour_msgs::yamlTransitionSrvResponse
  (:init
   (&key
    ((:confirmation __confirmation) "")
    )
   (send-super :init)
   (setq _confirmation (string __confirmation))
   self)
  (:confirmation
   (&optional __confirmation)
   (if __confirmation (setq _confirmation __confirmation)) _confirmation)
  (:serialization-length
   ()
   (+
    ;; string _confirmation
    4 (length _confirmation)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _confirmation
       (write-long (length _confirmation) s) (princ _confirmation s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _confirmation
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _confirmation (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass behaviour_msgs::yamlTransitionSrv
  :super ros::object
  :slots ())

(setf (get behaviour_msgs::yamlTransitionSrv :md5sum-) "74ae6a711767847beb795a6d289ea68e")
(setf (get behaviour_msgs::yamlTransitionSrv :datatype-) "behaviour_msgs/yamlTransitionSrv")
(setf (get behaviour_msgs::yamlTransitionSrv :request) behaviour_msgs::yamlTransitionSrvRequest)
(setf (get behaviour_msgs::yamlTransitionSrv :response) behaviour_msgs::yamlTransitionSrvResponse)

(defmethod behaviour_msgs::yamlTransitionSrvRequest
  (:response () (instance behaviour_msgs::yamlTransitionSrvResponse :init)))

(setf (get behaviour_msgs::yamlTransitionSrvRequest :md5sum-) "74ae6a711767847beb795a6d289ea68e")
(setf (get behaviour_msgs::yamlTransitionSrvRequest :datatype-) "behaviour_msgs/yamlTransitionSrvRequest")
(setf (get behaviour_msgs::yamlTransitionSrvRequest :definition-)
      "string decision
---
string confirmation
")

(setf (get behaviour_msgs::yamlTransitionSrvResponse :md5sum-) "74ae6a711767847beb795a6d289ea68e")
(setf (get behaviour_msgs::yamlTransitionSrvResponse :datatype-) "behaviour_msgs/yamlTransitionSrvResponse")
(setf (get behaviour_msgs::yamlTransitionSrvResponse :definition-)
      "string decision
---
string confirmation
")



(provide :behaviour_msgs/yamlTransitionSrv "74ae6a711767847beb795a6d289ea68e")


