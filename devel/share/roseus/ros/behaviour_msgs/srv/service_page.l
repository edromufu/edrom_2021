;; Auto-generated. Do not edit!


(when (boundp 'behaviour_msgs::service_page)
  (if (not (find-package "BEHAVIOUR_MSGS"))
    (make-package "BEHAVIOUR_MSGS"))
  (shadow 'service_page (find-package "BEHAVIOUR_MSGS")))
(unless (find-package "BEHAVIOUR_MSGS::SERVICE_PAGE")
  (make-package "BEHAVIOUR_MSGS::SERVICE_PAGE"))
(unless (find-package "BEHAVIOUR_MSGS::SERVICE_PAGEREQUEST")
  (make-package "BEHAVIOUR_MSGS::SERVICE_PAGEREQUEST"))
(unless (find-package "BEHAVIOUR_MSGS::SERVICE_PAGERESPONSE")
  (make-package "BEHAVIOUR_MSGS::SERVICE_PAGERESPONSE"))

(in-package "ROS")





(defclass behaviour_msgs::service_pageRequest
  :super ros::object
  :slots (_page ))

(defmethod behaviour_msgs::service_pageRequest
  (:init
   (&key
    ((:page __page) "")
    )
   (send-super :init)
   (setq _page (string __page))
   self)
  (:page
   (&optional __page)
   (if __page (setq _page __page)) _page)
  (:serialization-length
   ()
   (+
    ;; string _page
    4 (length _page)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _page
       (write-long (length _page) s) (princ _page s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _page
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _page (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass behaviour_msgs::service_pageResponse
  :super ros::object
  :slots (_confirmation ))

(defmethod behaviour_msgs::service_pageResponse
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

(defclass behaviour_msgs::service_page
  :super ros::object
  :slots ())

(setf (get behaviour_msgs::service_page :md5sum-) "e13299641855e63d2249efe085c03277")
(setf (get behaviour_msgs::service_page :datatype-) "behaviour_msgs/service_page")
(setf (get behaviour_msgs::service_page :request) behaviour_msgs::service_pageRequest)
(setf (get behaviour_msgs::service_page :response) behaviour_msgs::service_pageResponse)

(defmethod behaviour_msgs::service_pageRequest
  (:response () (instance behaviour_msgs::service_pageResponse :init)))

(setf (get behaviour_msgs::service_pageRequest :md5sum-) "e13299641855e63d2249efe085c03277")
(setf (get behaviour_msgs::service_pageRequest :datatype-) "behaviour_msgs/service_pageRequest")
(setf (get behaviour_msgs::service_pageRequest :definition-)
      "string page
---
string confirmation
")

(setf (get behaviour_msgs::service_pageResponse :md5sum-) "e13299641855e63d2249efe085c03277")
(setf (get behaviour_msgs::service_pageResponse :datatype-) "behaviour_msgs/service_pageResponse")
(setf (get behaviour_msgs::service_pageResponse :definition-)
      "string page
---
string confirmation
")



(provide :behaviour_msgs/service_page "e13299641855e63d2249efe085c03277")


