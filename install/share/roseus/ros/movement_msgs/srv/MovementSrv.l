;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::MovementSrv)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'MovementSrv (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::MOVEMENTSRV")
  (make-package "MOVEMENT_MSGS::MOVEMENTSRV"))
(unless (find-package "MOVEMENT_MSGS::MOVEMENTSRVREQUEST")
  (make-package "MOVEMENT_MSGS::MOVEMENTSRVREQUEST"))
(unless (find-package "MOVEMENT_MSGS::MOVEMENTSRVRESPONSE")
  (make-package "MOVEMENT_MSGS::MOVEMENTSRVRESPONSE"))

(in-package "ROS")





(defclass movement_msgs::MovementSrvRequest
  :super ros::object
  :slots (_page ))

(defmethod movement_msgs::MovementSrvRequest
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

(defclass movement_msgs::MovementSrvResponse
  :super ros::object
  :slots (_confirmation _path ))

(defmethod movement_msgs::MovementSrvResponse
  (:init
   (&key
    ((:confirmation __confirmation) "")
    ((:path __path) "")
    )
   (send-super :init)
   (setq _confirmation (string __confirmation))
   (setq _path (string __path))
   self)
  (:confirmation
   (&optional __confirmation)
   (if __confirmation (setq _confirmation __confirmation)) _confirmation)
  (:path
   (&optional __path)
   (if __path (setq _path __path)) _path)
  (:serialization-length
   ()
   (+
    ;; string _confirmation
    4 (length _confirmation)
    ;; string _path
    4 (length _path)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _confirmation
       (write-long (length _confirmation) s) (princ _confirmation s)
     ;; string _path
       (write-long (length _path) s) (princ _path s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _confirmation
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _confirmation (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _path
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _path (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass movement_msgs::MovementSrv
  :super ros::object
  :slots ())

(setf (get movement_msgs::MovementSrv :md5sum-) "4c660c3667764df7d0c43d544ef98351")
(setf (get movement_msgs::MovementSrv :datatype-) "movement_msgs/MovementSrv")
(setf (get movement_msgs::MovementSrv :request) movement_msgs::MovementSrvRequest)
(setf (get movement_msgs::MovementSrv :response) movement_msgs::MovementSrvResponse)

(defmethod movement_msgs::MovementSrvRequest
  (:response () (instance movement_msgs::MovementSrvResponse :init)))

(setf (get movement_msgs::MovementSrvRequest :md5sum-) "4c660c3667764df7d0c43d544ef98351")
(setf (get movement_msgs::MovementSrvRequest :datatype-) "movement_msgs/MovementSrvRequest")
(setf (get movement_msgs::MovementSrvRequest :definition-)
      "string 		     page
---
string 		     confirmation
string			     path

")

(setf (get movement_msgs::MovementSrvResponse :md5sum-) "4c660c3667764df7d0c43d544ef98351")
(setf (get movement_msgs::MovementSrvResponse :datatype-) "movement_msgs/MovementSrvResponse")
(setf (get movement_msgs::MovementSrvResponse :definition-)
      "string 		     page
---
string 		     confirmation
string			     path

")



(provide :movement_msgs/MovementSrv "4c660c3667764df7d0c43d544ef98351")


