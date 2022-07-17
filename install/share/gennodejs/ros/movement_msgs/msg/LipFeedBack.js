// Auto-generated. Do not edit!

// (in-package movement_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class LipFeedBack {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.comPos = null;
      this.comVel = null;
      this.comAcc = null;
      this.footStep = null;
      this.footStepR = null;
      this.zmp = null;
      this.footGround = null;
      this.footAir = null;
      this.wState = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('comPos')) {
        this.comPos = initObj.comPos
      }
      else {
        this.comPos = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('comVel')) {
        this.comVel = initObj.comVel
      }
      else {
        this.comVel = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('comAcc')) {
        this.comAcc = initObj.comAcc
      }
      else {
        this.comAcc = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('footStep')) {
        this.footStep = initObj.footStep
      }
      else {
        this.footStep = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('footStepR')) {
        this.footStepR = initObj.footStepR
      }
      else {
        this.footStepR = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('zmp')) {
        this.zmp = initObj.zmp
      }
      else {
        this.zmp = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('footGround')) {
        this.footGround = initObj.footGround
      }
      else {
        this.footGround = 0;
      }
      if (initObj.hasOwnProperty('footAir')) {
        this.footAir = initObj.footAir
      }
      else {
        this.footAir = 0;
      }
      if (initObj.hasOwnProperty('wState')) {
        this.wState = initObj.wState
      }
      else {
        this.wState = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LipFeedBack
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [comPos]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.comPos, buffer, bufferOffset);
    // Serialize message field [comVel]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.comVel, buffer, bufferOffset);
    // Serialize message field [comAcc]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.comAcc, buffer, bufferOffset);
    // Serialize message field [footStep]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.footStep, buffer, bufferOffset);
    // Serialize message field [footStepR]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.footStepR, buffer, bufferOffset);
    // Serialize message field [zmp]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.zmp, buffer, bufferOffset);
    // Serialize message field [footGround]
    bufferOffset = _serializer.int16(obj.footGround, buffer, bufferOffset);
    // Serialize message field [footAir]
    bufferOffset = _serializer.int16(obj.footAir, buffer, bufferOffset);
    // Serialize message field [wState]
    bufferOffset = _serializer.int16(obj.wState, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LipFeedBack
    let len;
    let data = new LipFeedBack(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [comPos]
    data.comPos = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [comVel]
    data.comVel = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [comAcc]
    data.comAcc = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [footStep]
    data.footStep = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [footStepR]
    data.footStepR = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [zmp]
    data.zmp = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [footGround]
    data.footGround = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [footAir]
    data.footAir = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [wState]
    data.wState = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 150;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/LipFeedBack';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e610855409fd0666f178d132dd374e0d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header                header
    geometry_msgs/Point   comPos
    geometry_msgs/Point   comVel
    geometry_msgs/Point   comAcc
    geometry_msgs/Point   footStep
    geometry_msgs/Point   footStepR
    geometry_msgs/Point   zmp
    int16                 footGround
    int16                 footAir
    int16                 wState
    
    
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LipFeedBack(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.comPos !== undefined) {
      resolved.comPos = geometry_msgs.msg.Point.Resolve(msg.comPos)
    }
    else {
      resolved.comPos = new geometry_msgs.msg.Point()
    }

    if (msg.comVel !== undefined) {
      resolved.comVel = geometry_msgs.msg.Point.Resolve(msg.comVel)
    }
    else {
      resolved.comVel = new geometry_msgs.msg.Point()
    }

    if (msg.comAcc !== undefined) {
      resolved.comAcc = geometry_msgs.msg.Point.Resolve(msg.comAcc)
    }
    else {
      resolved.comAcc = new geometry_msgs.msg.Point()
    }

    if (msg.footStep !== undefined) {
      resolved.footStep = geometry_msgs.msg.Point.Resolve(msg.footStep)
    }
    else {
      resolved.footStep = new geometry_msgs.msg.Point()
    }

    if (msg.footStepR !== undefined) {
      resolved.footStepR = geometry_msgs.msg.Point.Resolve(msg.footStepR)
    }
    else {
      resolved.footStepR = new geometry_msgs.msg.Point()
    }

    if (msg.zmp !== undefined) {
      resolved.zmp = geometry_msgs.msg.Point.Resolve(msg.zmp)
    }
    else {
      resolved.zmp = new geometry_msgs.msg.Point()
    }

    if (msg.footGround !== undefined) {
      resolved.footGround = msg.footGround;
    }
    else {
      resolved.footGround = 0
    }

    if (msg.footAir !== undefined) {
      resolved.footAir = msg.footAir;
    }
    else {
      resolved.footAir = 0
    }

    if (msg.wState !== undefined) {
      resolved.wState = msg.wState;
    }
    else {
      resolved.wState = 0
    }

    return resolved;
    }
};

module.exports = LipFeedBack;
