;; Auto-generated. Do not edit!


(when (boundp 'modularized_bhv_msgs::simMovMsg)
  (if (not (find-package "MODULARIZED_BHV_MSGS"))
    (make-package "MODULARIZED_BHV_MSGS"))
  (shadow 'simMovMsg (find-package "MODULARIZED_BHV_MSGS")))
(unless (find-package "MODULARIZED_BHV_MSGS::SIMMOVMSG")
  (make-package "MODULARIZED_BHV_MSGS::SIMMOVMSG"))

(in-package "ROS")
;;//! \htmlinclude simMovMsg.msg.html


(defclass modularized_bhv_msgs::simMovMsg
  :super ros::object
  :slots (_positions ))

(defmethod modularized_bhv_msgs::simMovMsg
  (:init
   (&key
    ((:positions __positions) (make-array 2 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _positions __positions)
   self)
  (:positions
   (&optional __positions)
   (if __positions (setq _positions __positions)) _positions)
  (:serialization-length
   ()
   (+
    ;; float64[2] _positions
    (* 8    2)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[2] _positions
     (dotimes (i 2)
       (sys::poke (elt _positions i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[2] _positions
   (dotimes (i (length _positions))
     (setf (elt _positions i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(setf (get modularized_bhv_msgs::simMovMsg :md5sum-) "2ea60a9dc19d0a4ca4c6af232a5cfe7f")
(setf (get modularized_bhv_msgs::simMovMsg :datatype-) "modularized_bhv_msgs/simMovMsg")
(setf (get modularized_bhv_msgs::simMovMsg :definition-)
      "float64[2] positions
")



(provide :modularized_bhv_msgs/simMovMsg "2ea60a9dc19d0a4ca4c6af232a5cfe7f")


