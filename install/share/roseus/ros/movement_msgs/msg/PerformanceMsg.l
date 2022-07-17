;; Auto-generated. Do not edit!


(when (boundp 'movement_msgs::PerformanceMsg)
  (if (not (find-package "MOVEMENT_MSGS"))
    (make-package "MOVEMENT_MSGS"))
  (shadow 'PerformanceMsg (find-package "MOVEMENT_MSGS")))
(unless (find-package "MOVEMENT_MSGS::PERFORMANCEMSG")
  (make-package "MOVEMENT_MSGS::PERFORMANCEMSG"))

(in-package "ROS")
;;//! \htmlinclude PerformanceMsg.msg.html


(defclass movement_msgs::PerformanceMsg
  :super ros::object
  :slots (_data _bins _freq _amp _mean _integral _freqRef _freqRange _ampRef _ampRange _meanRef _meanRange _freqPerf _ampPerf _meanPerf _wFreq _wAmp _wMean _perf ))

(defmethod movement_msgs::PerformanceMsg
  (:init
   (&key
    ((:data __data) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:bins __bins) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:freq __freq) 0.0)
    ((:amp __amp) 0.0)
    ((:mean __mean) 0.0)
    ((:integral __integral) 0.0)
    ((:freqRef __freqRef) 0.0)
    ((:freqRange __freqRange) 0.0)
    ((:ampRef __ampRef) 0.0)
    ((:ampRange __ampRange) 0.0)
    ((:meanRef __meanRef) 0.0)
    ((:meanRange __meanRange) 0.0)
    ((:freqPerf __freqPerf) 0.0)
    ((:ampPerf __ampPerf) 0.0)
    ((:meanPerf __meanPerf) 0.0)
    ((:wFreq __wFreq) 0.0)
    ((:wAmp __wAmp) 0.0)
    ((:wMean __wMean) 0.0)
    ((:perf __perf) 0.0)
    )
   (send-super :init)
   (setq _data __data)
   (setq _bins __bins)
   (setq _freq (float __freq))
   (setq _amp (float __amp))
   (setq _mean (float __mean))
   (setq _integral (float __integral))
   (setq _freqRef (float __freqRef))
   (setq _freqRange (float __freqRange))
   (setq _ampRef (float __ampRef))
   (setq _ampRange (float __ampRange))
   (setq _meanRef (float __meanRef))
   (setq _meanRange (float __meanRange))
   (setq _freqPerf (float __freqPerf))
   (setq _ampPerf (float __ampPerf))
   (setq _meanPerf (float __meanPerf))
   (setq _wFreq (float __wFreq))
   (setq _wAmp (float __wAmp))
   (setq _wMean (float __wMean))
   (setq _perf (float __perf))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:bins
   (&optional __bins)
   (if __bins (setq _bins __bins)) _bins)
  (:freq
   (&optional __freq)
   (if __freq (setq _freq __freq)) _freq)
  (:amp
   (&optional __amp)
   (if __amp (setq _amp __amp)) _amp)
  (:mean
   (&optional __mean)
   (if __mean (setq _mean __mean)) _mean)
  (:integral
   (&optional __integral)
   (if __integral (setq _integral __integral)) _integral)
  (:freqRef
   (&optional __freqRef)
   (if __freqRef (setq _freqRef __freqRef)) _freqRef)
  (:freqRange
   (&optional __freqRange)
   (if __freqRange (setq _freqRange __freqRange)) _freqRange)
  (:ampRef
   (&optional __ampRef)
   (if __ampRef (setq _ampRef __ampRef)) _ampRef)
  (:ampRange
   (&optional __ampRange)
   (if __ampRange (setq _ampRange __ampRange)) _ampRange)
  (:meanRef
   (&optional __meanRef)
   (if __meanRef (setq _meanRef __meanRef)) _meanRef)
  (:meanRange
   (&optional __meanRange)
   (if __meanRange (setq _meanRange __meanRange)) _meanRange)
  (:freqPerf
   (&optional __freqPerf)
   (if __freqPerf (setq _freqPerf __freqPerf)) _freqPerf)
  (:ampPerf
   (&optional __ampPerf)
   (if __ampPerf (setq _ampPerf __ampPerf)) _ampPerf)
  (:meanPerf
   (&optional __meanPerf)
   (if __meanPerf (setq _meanPerf __meanPerf)) _meanPerf)
  (:wFreq
   (&optional __wFreq)
   (if __wFreq (setq _wFreq __wFreq)) _wFreq)
  (:wAmp
   (&optional __wAmp)
   (if __wAmp (setq _wAmp __wAmp)) _wAmp)
  (:wMean
   (&optional __wMean)
   (if __wMean (setq _wMean __wMean)) _wMean)
  (:perf
   (&optional __perf)
   (if __perf (setq _perf __perf)) _perf)
  (:serialization-length
   ()
   (+
    ;; float64[] _data
    (* 8    (length _data)) 4
    ;; float64[] _bins
    (* 8    (length _bins)) 4
    ;; float64 _freq
    8
    ;; float64 _amp
    8
    ;; float64 _mean
    8
    ;; float64 _integral
    8
    ;; float64 _freqRef
    8
    ;; float64 _freqRange
    8
    ;; float64 _ampRef
    8
    ;; float64 _ampRange
    8
    ;; float64 _meanRef
    8
    ;; float64 _meanRange
    8
    ;; float64 _freqPerf
    8
    ;; float64 _ampPerf
    8
    ;; float64 _meanPerf
    8
    ;; float64 _wFreq
    8
    ;; float64 _wAmp
    8
    ;; float64 _wMean
    8
    ;; float64 _perf
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (sys::poke (elt _data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _bins
     (write-long (length _bins) s)
     (dotimes (i (length _bins))
       (sys::poke (elt _bins i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _freq
       (sys::poke _freq (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _amp
       (sys::poke _amp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _mean
       (sys::poke _mean (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _integral
       (sys::poke _integral (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _freqRef
       (sys::poke _freqRef (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _freqRange
       (sys::poke _freqRange (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ampRef
       (sys::poke _ampRef (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ampRange
       (sys::poke _ampRange (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _meanRef
       (sys::poke _meanRef (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _meanRange
       (sys::poke _meanRange (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _freqPerf
       (sys::poke _freqPerf (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ampPerf
       (sys::poke _ampPerf (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _meanPerf
       (sys::poke _meanPerf (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wFreq
       (sys::poke _wFreq (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wAmp
       (sys::poke _wAmp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wMean
       (sys::poke _wMean (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _perf
       (sys::poke _perf (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _bins
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _bins (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _bins i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64 _freq
     (setq _freq (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _amp
     (setq _amp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _mean
     (setq _mean (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _integral
     (setq _integral (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _freqRef
     (setq _freqRef (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _freqRange
     (setq _freqRange (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ampRef
     (setq _ampRef (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ampRange
     (setq _ampRange (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _meanRef
     (setq _meanRef (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _meanRange
     (setq _meanRange (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _freqPerf
     (setq _freqPerf (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ampPerf
     (setq _ampPerf (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _meanPerf
     (setq _meanPerf (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wFreq
     (setq _wFreq (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wAmp
     (setq _wAmp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wMean
     (setq _wMean (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _perf
     (setq _perf (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get movement_msgs::PerformanceMsg :md5sum-) "299aadea0ec447ab474d650cbedfd2a5")
(setf (get movement_msgs::PerformanceMsg :datatype-) "movement_msgs/PerformanceMsg")
(setf (get movement_msgs::PerformanceMsg :definition-)
      "float64[] data
float64[] bins
float64   freq
float64   amp
float64   mean
float64   integral
float64   freqRef
float64   freqRange
float64   ampRef
float64   ampRange
float64   meanRef
float64   meanRange

float64   freqPerf
float64   ampPerf
float64   meanPerf

float64   wFreq
float64   wAmp
float64   wMean

float64   perf

")



(provide :movement_msgs/PerformanceMsg "299aadea0ec447ab474d650cbedfd2a5")


