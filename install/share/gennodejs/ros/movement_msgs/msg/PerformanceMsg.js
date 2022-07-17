// Auto-generated. Do not edit!

// (in-package movement_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PerformanceMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.data = null;
      this.bins = null;
      this.freq = null;
      this.amp = null;
      this.mean = null;
      this.integral = null;
      this.freqRef = null;
      this.freqRange = null;
      this.ampRef = null;
      this.ampRange = null;
      this.meanRef = null;
      this.meanRange = null;
      this.freqPerf = null;
      this.ampPerf = null;
      this.meanPerf = null;
      this.wFreq = null;
      this.wAmp = null;
      this.wMean = null;
      this.perf = null;
    }
    else {
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
      if (initObj.hasOwnProperty('bins')) {
        this.bins = initObj.bins
      }
      else {
        this.bins = [];
      }
      if (initObj.hasOwnProperty('freq')) {
        this.freq = initObj.freq
      }
      else {
        this.freq = 0.0;
      }
      if (initObj.hasOwnProperty('amp')) {
        this.amp = initObj.amp
      }
      else {
        this.amp = 0.0;
      }
      if (initObj.hasOwnProperty('mean')) {
        this.mean = initObj.mean
      }
      else {
        this.mean = 0.0;
      }
      if (initObj.hasOwnProperty('integral')) {
        this.integral = initObj.integral
      }
      else {
        this.integral = 0.0;
      }
      if (initObj.hasOwnProperty('freqRef')) {
        this.freqRef = initObj.freqRef
      }
      else {
        this.freqRef = 0.0;
      }
      if (initObj.hasOwnProperty('freqRange')) {
        this.freqRange = initObj.freqRange
      }
      else {
        this.freqRange = 0.0;
      }
      if (initObj.hasOwnProperty('ampRef')) {
        this.ampRef = initObj.ampRef
      }
      else {
        this.ampRef = 0.0;
      }
      if (initObj.hasOwnProperty('ampRange')) {
        this.ampRange = initObj.ampRange
      }
      else {
        this.ampRange = 0.0;
      }
      if (initObj.hasOwnProperty('meanRef')) {
        this.meanRef = initObj.meanRef
      }
      else {
        this.meanRef = 0.0;
      }
      if (initObj.hasOwnProperty('meanRange')) {
        this.meanRange = initObj.meanRange
      }
      else {
        this.meanRange = 0.0;
      }
      if (initObj.hasOwnProperty('freqPerf')) {
        this.freqPerf = initObj.freqPerf
      }
      else {
        this.freqPerf = 0.0;
      }
      if (initObj.hasOwnProperty('ampPerf')) {
        this.ampPerf = initObj.ampPerf
      }
      else {
        this.ampPerf = 0.0;
      }
      if (initObj.hasOwnProperty('meanPerf')) {
        this.meanPerf = initObj.meanPerf
      }
      else {
        this.meanPerf = 0.0;
      }
      if (initObj.hasOwnProperty('wFreq')) {
        this.wFreq = initObj.wFreq
      }
      else {
        this.wFreq = 0.0;
      }
      if (initObj.hasOwnProperty('wAmp')) {
        this.wAmp = initObj.wAmp
      }
      else {
        this.wAmp = 0.0;
      }
      if (initObj.hasOwnProperty('wMean')) {
        this.wMean = initObj.wMean
      }
      else {
        this.wMean = 0.0;
      }
      if (initObj.hasOwnProperty('perf')) {
        this.perf = initObj.perf
      }
      else {
        this.perf = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PerformanceMsg
    // Serialize message field [data]
    bufferOffset = _arraySerializer.float64(obj.data, buffer, bufferOffset, null);
    // Serialize message field [bins]
    bufferOffset = _arraySerializer.float64(obj.bins, buffer, bufferOffset, null);
    // Serialize message field [freq]
    bufferOffset = _serializer.float64(obj.freq, buffer, bufferOffset);
    // Serialize message field [amp]
    bufferOffset = _serializer.float64(obj.amp, buffer, bufferOffset);
    // Serialize message field [mean]
    bufferOffset = _serializer.float64(obj.mean, buffer, bufferOffset);
    // Serialize message field [integral]
    bufferOffset = _serializer.float64(obj.integral, buffer, bufferOffset);
    // Serialize message field [freqRef]
    bufferOffset = _serializer.float64(obj.freqRef, buffer, bufferOffset);
    // Serialize message field [freqRange]
    bufferOffset = _serializer.float64(obj.freqRange, buffer, bufferOffset);
    // Serialize message field [ampRef]
    bufferOffset = _serializer.float64(obj.ampRef, buffer, bufferOffset);
    // Serialize message field [ampRange]
    bufferOffset = _serializer.float64(obj.ampRange, buffer, bufferOffset);
    // Serialize message field [meanRef]
    bufferOffset = _serializer.float64(obj.meanRef, buffer, bufferOffset);
    // Serialize message field [meanRange]
    bufferOffset = _serializer.float64(obj.meanRange, buffer, bufferOffset);
    // Serialize message field [freqPerf]
    bufferOffset = _serializer.float64(obj.freqPerf, buffer, bufferOffset);
    // Serialize message field [ampPerf]
    bufferOffset = _serializer.float64(obj.ampPerf, buffer, bufferOffset);
    // Serialize message field [meanPerf]
    bufferOffset = _serializer.float64(obj.meanPerf, buffer, bufferOffset);
    // Serialize message field [wFreq]
    bufferOffset = _serializer.float64(obj.wFreq, buffer, bufferOffset);
    // Serialize message field [wAmp]
    bufferOffset = _serializer.float64(obj.wAmp, buffer, bufferOffset);
    // Serialize message field [wMean]
    bufferOffset = _serializer.float64(obj.wMean, buffer, bufferOffset);
    // Serialize message field [perf]
    bufferOffset = _serializer.float64(obj.perf, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PerformanceMsg
    let len;
    let data = new PerformanceMsg(null);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [bins]
    data.bins = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [freq]
    data.freq = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [amp]
    data.amp = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [mean]
    data.mean = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [integral]
    data.integral = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [freqRef]
    data.freqRef = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [freqRange]
    data.freqRange = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ampRef]
    data.ampRef = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ampRange]
    data.ampRange = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [meanRef]
    data.meanRef = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [meanRange]
    data.meanRange = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [freqPerf]
    data.freqPerf = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ampPerf]
    data.ampPerf = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [meanPerf]
    data.meanPerf = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wFreq]
    data.wFreq = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wAmp]
    data.wAmp = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wMean]
    data.wMean = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [perf]
    data.perf = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.data.length;
    length += 8 * object.bins.length;
    return length + 144;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/PerformanceMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '299aadea0ec447ab474d650cbedfd2a5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] data
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PerformanceMsg(null);
    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
    }

    if (msg.bins !== undefined) {
      resolved.bins = msg.bins;
    }
    else {
      resolved.bins = []
    }

    if (msg.freq !== undefined) {
      resolved.freq = msg.freq;
    }
    else {
      resolved.freq = 0.0
    }

    if (msg.amp !== undefined) {
      resolved.amp = msg.amp;
    }
    else {
      resolved.amp = 0.0
    }

    if (msg.mean !== undefined) {
      resolved.mean = msg.mean;
    }
    else {
      resolved.mean = 0.0
    }

    if (msg.integral !== undefined) {
      resolved.integral = msg.integral;
    }
    else {
      resolved.integral = 0.0
    }

    if (msg.freqRef !== undefined) {
      resolved.freqRef = msg.freqRef;
    }
    else {
      resolved.freqRef = 0.0
    }

    if (msg.freqRange !== undefined) {
      resolved.freqRange = msg.freqRange;
    }
    else {
      resolved.freqRange = 0.0
    }

    if (msg.ampRef !== undefined) {
      resolved.ampRef = msg.ampRef;
    }
    else {
      resolved.ampRef = 0.0
    }

    if (msg.ampRange !== undefined) {
      resolved.ampRange = msg.ampRange;
    }
    else {
      resolved.ampRange = 0.0
    }

    if (msg.meanRef !== undefined) {
      resolved.meanRef = msg.meanRef;
    }
    else {
      resolved.meanRef = 0.0
    }

    if (msg.meanRange !== undefined) {
      resolved.meanRange = msg.meanRange;
    }
    else {
      resolved.meanRange = 0.0
    }

    if (msg.freqPerf !== undefined) {
      resolved.freqPerf = msg.freqPerf;
    }
    else {
      resolved.freqPerf = 0.0
    }

    if (msg.ampPerf !== undefined) {
      resolved.ampPerf = msg.ampPerf;
    }
    else {
      resolved.ampPerf = 0.0
    }

    if (msg.meanPerf !== undefined) {
      resolved.meanPerf = msg.meanPerf;
    }
    else {
      resolved.meanPerf = 0.0
    }

    if (msg.wFreq !== undefined) {
      resolved.wFreq = msg.wFreq;
    }
    else {
      resolved.wFreq = 0.0
    }

    if (msg.wAmp !== undefined) {
      resolved.wAmp = msg.wAmp;
    }
    else {
      resolved.wAmp = 0.0
    }

    if (msg.wMean !== undefined) {
      resolved.wMean = msg.wMean;
    }
    else {
      resolved.wMean = 0.0
    }

    if (msg.perf !== undefined) {
      resolved.perf = msg.perf;
    }
    else {
      resolved.perf = 0.0
    }

    return resolved;
    }
};

module.exports = PerformanceMsg;
