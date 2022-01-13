;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::BehRequestSrv)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'BehRequestSrv (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::BEHREQUESTSRV")
  (make-package "MOVEMENT_MSGS::BEHREQUESTSRV"))
(unless (find-package "MOVEMENT_MSGS::BEHREQUESTSRVREQUEST")
  (make-package "MOVEMENT_MSGS::BEHREQUESTSRVREQUEST"))
(unless (find-package "MOVEMENT_MSGS::BEHREQUESTSRVRESPONSE")
  (make-package "MOVEMENT_MSGS::BEHREQUESTSRVRESPONSE"))

(in-package "ROS")





(defclass movement_msgs::BehRequestSrvRequest
  :super ros::object
  :slots (_description ))

(defmethod movement_msgs::BehRequestSrvRequest
  (:init
   (&key
    ((:description __description) "")
    )
   (send-super :init)
   (setq _description (string __description))
   self)
  (:description
   (&optional __description)
   (if __description (setq _description __description)) _description)
  (:serialization-length
   ()
   (+
    ;; string _description
    4 (length _description)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _description
       (write-long (length _description) s) (princ _description s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _description
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _description (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass movement_msgs::BehRequestSrvResponse
  :super ros::object
  :slots (_response ))

(defmethod movement_msgs::BehRequestSrvResponse
  (:init
   (&key
    ((:response __response) nil)
    )
   (send-super :init)
   (setq _response __response)
   self)
  (:response
   (&optional (__response :null))
   (if (not (eq __response :null)) (setq _response __response)) _response)
  (:serialization-length
   ()
   (+
    ;; bool _response
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _response
       (if _response (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _response
     (setq _response (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass movement_msgs::BehRequestSrv
  :super ros::object
  :slots ())

(setf (get movement_msgs::BehRequestSrv :md5sum-) "ee7d6e8b98e6646580b37e2806895049")
(setf (get movement_msgs::BehRequestSrv :datatype-) "movement_msgs/BehRequestSrv")
(setf (get movement_msgs::BehRequestSrv :request) movement_msgs::BehRequestSrvRequest)
(setf (get movement_msgs::BehRequestSrv :response) movement_msgs::BehRequestSrvResponse)

(defmethod movement_msgs::BehRequestSrvRequest
  (:response () (instance movement_msgs::BehRequestSrvResponse :init)))

(setf (get movement_msgs::BehRequestSrvRequest :md5sum-) "ee7d6e8b98e6646580b37e2806895049")
(setf (get movement_msgs::BehRequestSrvRequest :datatype-) "movement_msgs/BehRequestSrvRequest")
(setf (get movement_msgs::BehRequestSrvRequest :definition-)
      "string description

---

bool response

")

(setf (get movement_msgs::BehRequestSrvResponse :md5sum-) "ee7d6e8b98e6646580b37e2806895049")
(setf (get movement_msgs::BehRequestSrvResponse :datatype-) "movement_msgs/BehRequestSrvResponse")
(setf (get movement_msgs::BehRequestSrvResponse :definition-)
      "string description

---

bool response

")



(provide :movement_msgs/BehRequestSrv "ee7d6e8b98e6646580b37e2806895049")


