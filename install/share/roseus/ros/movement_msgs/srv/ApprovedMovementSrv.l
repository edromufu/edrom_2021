;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::ApprovedMovementSrv)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'ApprovedMovementSrv (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::APPROVEDMOVEMENTSRV")
  (make-package "MOVEMENT_MSGS::APPROVEDMOVEMENTSRV"))
(unless (find-package "MOVEMENT_MSGS::APPROVEDMOVEMENTSRVREQUEST")
  (make-package "MOVEMENT_MSGS::APPROVEDMOVEMENTSRVREQUEST"))
(unless (find-package "MOVEMENT_MSGS::APPROVEDMOVEMENTSRVRESPONSE")
  (make-package "MOVEMENT_MSGS::APPROVEDMOVEMENTSRVRESPONSE"))

(in-package "ROS")





(defclass movement_msgs::ApprovedMovementSrvRequest
  :super ros::object
  :slots (_approved_movement ))

(defmethod movement_msgs::ApprovedMovementSrvRequest
  (:init
   (&key
    ((:approved_movement __approved_movement) "")
    )
   (send-super :init)
   (setq _approved_movement (string __approved_movement))
   self)
  (:approved_movement
   (&optional __approved_movement)
   (if __approved_movement (setq _approved_movement __approved_movement)) _approved_movement)
  (:serialization-length
   ()
   (+
    ;; string _approved_movement
    4 (length _approved_movement)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _approved_movement
       (write-long (length _approved_movement) s) (princ _approved_movement s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _approved_movement
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _approved_movement (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass movement_msgs::ApprovedMovementSrvResponse
  :super ros::object
  :slots (_response ))

(defmethod movement_msgs::ApprovedMovementSrvResponse
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

(defclass movement_msgs::ApprovedMovementSrv
  :super ros::object
  :slots ())

(setf (get movement_msgs::ApprovedMovementSrv :md5sum-) "96a28d2e667000a662371cc5689381d0")
(setf (get movement_msgs::ApprovedMovementSrv :datatype-) "movement_msgs/ApprovedMovementSrv")
(setf (get movement_msgs::ApprovedMovementSrv :request) movement_msgs::ApprovedMovementSrvRequest)
(setf (get movement_msgs::ApprovedMovementSrv :response) movement_msgs::ApprovedMovementSrvResponse)

(defmethod movement_msgs::ApprovedMovementSrvRequest
  (:response () (instance movement_msgs::ApprovedMovementSrvResponse :init)))

(setf (get movement_msgs::ApprovedMovementSrvRequest :md5sum-) "96a28d2e667000a662371cc5689381d0")
(setf (get movement_msgs::ApprovedMovementSrvRequest :datatype-) "movement_msgs/ApprovedMovementSrvRequest")
(setf (get movement_msgs::ApprovedMovementSrvRequest :definition-)
      "string approved_movement

---

bool response

")

(setf (get movement_msgs::ApprovedMovementSrvResponse :md5sum-) "96a28d2e667000a662371cc5689381d0")
(setf (get movement_msgs::ApprovedMovementSrvResponse :datatype-) "movement_msgs/ApprovedMovementSrvResponse")
(setf (get movement_msgs::ApprovedMovementSrvResponse :definition-)
      "string approved_movement

---

bool response

")



(provide :movement_msgs/ApprovedMovementSrv "96a28d2e667000a662371cc5689381d0")


