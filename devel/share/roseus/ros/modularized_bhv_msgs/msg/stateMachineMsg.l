;; Auto-generated. Do not edit!


(when (boundp 'modularized_bhv_msgs::stateMachineMsg)
  (if (not (find-package "MODULARIZED_BHV_MSGS"))
    (make-package "MODULARIZED_BHV_MSGS"))
  (shadow 'stateMachineMsg (find-package "MODULARIZED_BHV_MSGS")))
(unless (find-package "MODULARIZED_BHV_MSGS::STATEMACHINEMSG")
  (make-package "MODULARIZED_BHV_MSGS::STATEMACHINEMSG"))

(in-package "ROS")
;;//! \htmlinclude stateMachineMsg.msg.html


(defclass modularized_bhv_msgs::stateMachineMsg
  :super ros::object
  :slots (_fallState _ballFound _ballClose _ballRelativePosition _verAngleAccomplished _headPossibleMovements _horMotorOutOfCenter _horMotorPosition ))

(defmethod modularized_bhv_msgs::stateMachineMsg
  (:init
   (&key
    ((:fallState __fallState) "")
    ((:ballFound __ballFound) nil)
    ((:ballClose __ballClose) nil)
    ((:ballRelativePosition __ballRelativePosition) "")
    ((:verAngleAccomplished __verAngleAccomplished) nil)
    ((:headPossibleMovements __headPossibleMovements) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:horMotorOutOfCenter __horMotorOutOfCenter) nil)
    ((:horMotorPosition __horMotorPosition) 0.0)
    )
   (send-super :init)
   (setq _fallState (string __fallState))
   (setq _ballFound __ballFound)
   (setq _ballClose __ballClose)
   (setq _ballRelativePosition (string __ballRelativePosition))
   (setq _verAngleAccomplished __verAngleAccomplished)
   (setq _headPossibleMovements __headPossibleMovements)
   (setq _horMotorOutOfCenter __horMotorOutOfCenter)
   (setq _horMotorPosition (float __horMotorPosition))
   self)
  (:fallState
   (&optional __fallState)
   (if __fallState (setq _fallState __fallState)) _fallState)
  (:ballFound
   (&optional (__ballFound :null))
   (if (not (eq __ballFound :null)) (setq _ballFound __ballFound)) _ballFound)
  (:ballClose
   (&optional (__ballClose :null))
   (if (not (eq __ballClose :null)) (setq _ballClose __ballClose)) _ballClose)
  (:ballRelativePosition
   (&optional __ballRelativePosition)
   (if __ballRelativePosition (setq _ballRelativePosition __ballRelativePosition)) _ballRelativePosition)
  (:verAngleAccomplished
   (&optional (__verAngleAccomplished :null))
   (if (not (eq __verAngleAccomplished :null)) (setq _verAngleAccomplished __verAngleAccomplished)) _verAngleAccomplished)
  (:headPossibleMovements
   (&optional __headPossibleMovements)
   (if __headPossibleMovements (setq _headPossibleMovements __headPossibleMovements)) _headPossibleMovements)
  (:horMotorOutOfCenter
   (&optional (__horMotorOutOfCenter :null))
   (if (not (eq __horMotorOutOfCenter :null)) (setq _horMotorOutOfCenter __horMotorOutOfCenter)) _horMotorOutOfCenter)
  (:horMotorPosition
   (&optional __horMotorPosition)
   (if __horMotorPosition (setq _horMotorPosition __horMotorPosition)) _horMotorPosition)
  (:serialization-length
   ()
   (+
    ;; string _fallState
    4 (length _fallState)
    ;; bool _ballFound
    1
    ;; bool _ballClose
    1
    ;; string _ballRelativePosition
    4 (length _ballRelativePosition)
    ;; bool _verAngleAccomplished
    1
    ;; string[] _headPossibleMovements
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _headPossibleMovements)) 4
    ;; bool _horMotorOutOfCenter
    1
    ;; float32 _horMotorPosition
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _fallState
       (write-long (length _fallState) s) (princ _fallState s)
     ;; bool _ballFound
       (if _ballFound (write-byte -1 s) (write-byte 0 s))
     ;; bool _ballClose
       (if _ballClose (write-byte -1 s) (write-byte 0 s))
     ;; string _ballRelativePosition
       (write-long (length _ballRelativePosition) s) (princ _ballRelativePosition s)
     ;; bool _verAngleAccomplished
       (if _verAngleAccomplished (write-byte -1 s) (write-byte 0 s))
     ;; string[] _headPossibleMovements
     (write-long (length _headPossibleMovements) s)
     (dolist (elem _headPossibleMovements)
       (write-long (length elem) s) (princ elem s)
       )
     ;; bool _horMotorOutOfCenter
       (if _horMotorOutOfCenter (write-byte -1 s) (write-byte 0 s))
     ;; float32 _horMotorPosition
       (sys::poke _horMotorPosition (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _fallState
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _fallState (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _ballFound
     (setq _ballFound (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _ballClose
     (setq _ballClose (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _ballRelativePosition
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _ballRelativePosition (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _verAngleAccomplished
     (setq _verAngleAccomplished (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string[] _headPossibleMovements
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _headPossibleMovements (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _headPossibleMovements i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; bool _horMotorOutOfCenter
     (setq _horMotorOutOfCenter (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _horMotorPosition
     (setq _horMotorPosition (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get modularized_bhv_msgs::stateMachineMsg :md5sum-) "fef8165d0297ca5e6f3b8c591ed6dfff")
(setf (get modularized_bhv_msgs::stateMachineMsg :datatype-) "modularized_bhv_msgs/stateMachineMsg")
(setf (get modularized_bhv_msgs::stateMachineMsg :definition-)
      "string fallState
bool ballFound
bool ballClose
string ballRelativePosition
bool verAngleAccomplished
string[] headPossibleMovements
bool horMotorOutOfCenter
float32 horMotorPosition
")



(provide :modularized_bhv_msgs/stateMachineMsg "fef8165d0297ca5e6f3b8c591ed6dfff")


