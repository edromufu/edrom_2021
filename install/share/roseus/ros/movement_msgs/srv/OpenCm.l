;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::OpenCm)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'OpenCm (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::OPENCM")
  (make-package "MOVEMENT_MSGS::OPENCM"))
(unless (find-package "MOVEMENT_MSGS::OPENCMREQUEST")
  (make-package "MOVEMENT_MSGS::OPENCMREQUEST"))
(unless (find-package "MOVEMENT_MSGS::OPENCMRESPONSE")
  (make-package "MOVEMENT_MSGS::OPENCMRESPONSE"))

(in-package "ROS")





(defclass movement_msgs::OpenCmRequest
  :super ros::object
  :slots (_write _data _vel _read ))

(defmethod movement_msgs::OpenCmRequest
  (:init
   (&key
    ((:write __write) 0)
    ((:data __data) (make-array 20 :initial-element 0 :element-type :integer))
    ((:vel __vel) (make-array 20 :initial-element 0 :element-type :integer))
    ((:read __read) 0)
    )
   (send-super :init)
   (setq _write (round __write))
   (setq _data __data)
   (setq _vel __vel)
   (setq _read (round __read))
   self)
  (:write
   (&optional __write)
   (if __write (setq _write __write)) _write)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:vel
   (&optional __vel)
   (if __vel (setq _vel __vel)) _vel)
  (:read
   (&optional __read)
   (if __read (setq _read __read)) _read)
  (:serialization-length
   ()
   (+
    ;; uint8 _write
    1
    ;; uint16[20] _data
    (* 2    20)
    ;; uint16[20] _vel
    (* 2    20)
    ;; uint8 _read
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _write
       (write-byte _write s)
     ;; uint16[20] _data
     (dotimes (i 20)
       (write-word (elt _data i) s)
       )
     ;; uint16[20] _vel
     (dotimes (i 20)
       (write-word (elt _vel i) s)
       )
     ;; uint8 _read
       (write-byte _read s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _write
     (setq _write (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16[20] _data
   (dotimes (i (length _data))
     (setf (elt _data i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;; uint16[20] _vel
   (dotimes (i (length _vel))
     (setf (elt _vel i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;; uint8 _read
     (setq _read (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass movement_msgs::OpenCmResponse
  :super ros::object
  :slots (_result ))

(defmethod movement_msgs::OpenCmResponse
  (:init
   (&key
    ((:result __result) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; uint16[] _result
    (* 2    (length _result)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16[] _result
     (write-long (length _result) s)
     (dotimes (i (length _result))
       (write-word (elt _result i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16[] _result
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _result (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _result i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(defclass movement_msgs::OpenCm
  :super ros::object
  :slots ())

(setf (get movement_msgs::OpenCm :md5sum-) "ed318f5991a644927c9195494aa8898a")
(setf (get movement_msgs::OpenCm :datatype-) "movement_msgs/OpenCm")
(setf (get movement_msgs::OpenCm :request) movement_msgs::OpenCmRequest)
(setf (get movement_msgs::OpenCm :response) movement_msgs::OpenCmResponse)

(defmethod movement_msgs::OpenCmRequest
  (:response () (instance movement_msgs::OpenCmResponse :init)))

(setf (get movement_msgs::OpenCmRequest :md5sum-) "ed318f5991a644927c9195494aa8898a")
(setf (get movement_msgs::OpenCmRequest :datatype-) "movement_msgs/OpenCmRequest")
(setf (get movement_msgs::OpenCmRequest :definition-)
      "uint8 write
uint16[20] data
uint16[20] vel
uint8 read 
---

uint16[] result

")

(setf (get movement_msgs::OpenCmResponse :md5sum-) "ed318f5991a644927c9195494aa8898a")
(setf (get movement_msgs::OpenCmResponse :datatype-) "movement_msgs/OpenCmResponse")
(setf (get movement_msgs::OpenCmResponse :definition-)
      "uint8 write
uint16[20] data
uint16[20] vel
uint8 read 
---

uint16[] result

")



(provide :movement_msgs/OpenCm "ed318f5991a644927c9195494aa8898a")


