;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::BehRequestInterface)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'BehRequestInterface (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::BEHREQUESTINTERFACE")
  (make-package "MOVEMENT_MSGS::BEHREQUESTINTERFACE"))

(in-package "ROS")
;;//! \htmlinclude BehRequestInterface.msg.html


(defclass movement_msgs::BehRequestInterface
  :super ros::object
  :slots (_required_movement _required_status ))

(defmethod movement_msgs::BehRequestInterface
  (:init
   (&key
    ((:required_movement __required_movement) "")
    ((:required_status __required_status) nil)
    )
   (send-super :init)
   (setq _required_movement (string __required_movement))
   (setq _required_status __required_status)
   self)
  (:required_movement
   (&optional __required_movement)
   (if __required_movement (setq _required_movement __required_movement)) _required_movement)
  (:required_status
   (&optional (__required_status :null))
   (if (not (eq __required_status :null)) (setq _required_status __required_status)) _required_status)
  (:serialization-length
   ()
   (+
    ;; string _required_movement
    4 (length _required_movement)
    ;; bool _required_status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _required_movement
       (write-long (length _required_movement) s) (princ _required_movement s)
     ;; bool _required_status
       (if _required_status (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _required_movement
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _required_movement (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _required_status
     (setq _required_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get movement_msgs::BehRequestInterface :md5sum-) "a8e8e1d113594f935b637fde0165e779")
(setf (get movement_msgs::BehRequestInterface :datatype-) "movement_msgs/BehRequestInterface")
(setf (get movement_msgs::BehRequestInterface :definition-)
      "string required_movement
bool required_status

")



(provide :movement_msgs/BehRequestInterface "a8e8e1d113594f935b637fde0165e779")


