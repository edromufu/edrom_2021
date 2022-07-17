// Auto-generated. Do not edit!

// (in-package movement_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let EndEffMsg = require('./EndEffMsg.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class HumanoidControlMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.ctrl_flag = null;
      this.arm_ctrl_flag = null;
      this.torso_ctrl_flag = null;
      this.phase_ctrl_flag = null;
      this.slope_ctrl_flag = null;
      this.foot_ctrl_flag = null;
      this.torsoAddX = null;
      this.torsoAddY = null;
      this.torsoAddZ = null;
      this.slope = null;
      this.rFootFac = null;
      this.lFootFac = null;
      this.phaseFac = null;
      this.armAdd = null;
      this.delayR = null;
      this.delayL = null;
      this.delayAll = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('ctrl_flag')) {
        this.ctrl_flag = initObj.ctrl_flag
      }
      else {
        this.ctrl_flag = false;
      }
      if (initObj.hasOwnProperty('arm_ctrl_flag')) {
        this.arm_ctrl_flag = initObj.arm_ctrl_flag
      }
      else {
        this.arm_ctrl_flag = false;
      }
      if (initObj.hasOwnProperty('torso_ctrl_flag')) {
        this.torso_ctrl_flag = initObj.torso_ctrl_flag
      }
      else {
        this.torso_ctrl_flag = false;
      }
      if (initObj.hasOwnProperty('phase_ctrl_flag')) {
        this.phase_ctrl_flag = initObj.phase_ctrl_flag
      }
      else {
        this.phase_ctrl_flag = false;
      }
      if (initObj.hasOwnProperty('slope_ctrl_flag')) {
        this.slope_ctrl_flag = initObj.slope_ctrl_flag
      }
      else {
        this.slope_ctrl_flag = false;
      }
      if (initObj.hasOwnProperty('foot_ctrl_flag')) {
        this.foot_ctrl_flag = initObj.foot_ctrl_flag
      }
      else {
        this.foot_ctrl_flag = false;
      }
      if (initObj.hasOwnProperty('torsoAddX')) {
        this.torsoAddX = initObj.torsoAddX
      }
      else {
        this.torsoAddX = 0.0;
      }
      if (initObj.hasOwnProperty('torsoAddY')) {
        this.torsoAddY = initObj.torsoAddY
      }
      else {
        this.torsoAddY = 0.0;
      }
      if (initObj.hasOwnProperty('torsoAddZ')) {
        this.torsoAddZ = initObj.torsoAddZ
      }
      else {
        this.torsoAddZ = 0.0;
      }
      if (initObj.hasOwnProperty('slope')) {
        this.slope = initObj.slope
      }
      else {
        this.slope = 0.0;
      }
      if (initObj.hasOwnProperty('rFootFac')) {
        this.rFootFac = initObj.rFootFac
      }
      else {
        this.rFootFac = new EndEffMsg();
      }
      if (initObj.hasOwnProperty('lFootFac')) {
        this.lFootFac = initObj.lFootFac
      }
      else {
        this.lFootFac = new EndEffMsg();
      }
      if (initObj.hasOwnProperty('phaseFac')) {
        this.phaseFac = initObj.phaseFac
      }
      else {
        this.phaseFac = 0.0;
      }
      if (initObj.hasOwnProperty('armAdd')) {
        this.armAdd = initObj.armAdd
      }
      else {
        this.armAdd = 0.0;
      }
      if (initObj.hasOwnProperty('delayR')) {
        this.delayR = initObj.delayR
      }
      else {
        this.delayR = 0.0;
      }
      if (initObj.hasOwnProperty('delayL')) {
        this.delayL = initObj.delayL
      }
      else {
        this.delayL = 0.0;
      }
      if (initObj.hasOwnProperty('delayAll')) {
        this.delayAll = initObj.delayAll
      }
      else {
        this.delayAll = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HumanoidControlMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [ctrl_flag]
    bufferOffset = _serializer.bool(obj.ctrl_flag, buffer, bufferOffset);
    // Serialize message field [arm_ctrl_flag]
    bufferOffset = _serializer.bool(obj.arm_ctrl_flag, buffer, bufferOffset);
    // Serialize message field [torso_ctrl_flag]
    bufferOffset = _serializer.bool(obj.torso_ctrl_flag, buffer, bufferOffset);
    // Serialize message field [phase_ctrl_flag]
    bufferOffset = _serializer.bool(obj.phase_ctrl_flag, buffer, bufferOffset);
    // Serialize message field [slope_ctrl_flag]
    bufferOffset = _serializer.bool(obj.slope_ctrl_flag, buffer, bufferOffset);
    // Serialize message field [foot_ctrl_flag]
    bufferOffset = _serializer.bool(obj.foot_ctrl_flag, buffer, bufferOffset);
    // Serialize message field [torsoAddX]
    bufferOffset = _serializer.float64(obj.torsoAddX, buffer, bufferOffset);
    // Serialize message field [torsoAddY]
    bufferOffset = _serializer.float64(obj.torsoAddY, buffer, bufferOffset);
    // Serialize message field [torsoAddZ]
    bufferOffset = _serializer.float64(obj.torsoAddZ, buffer, bufferOffset);
    // Serialize message field [slope]
    bufferOffset = _serializer.float64(obj.slope, buffer, bufferOffset);
    // Serialize message field [rFootFac]
    bufferOffset = EndEffMsg.serialize(obj.rFootFac, buffer, bufferOffset);
    // Serialize message field [lFootFac]
    bufferOffset = EndEffMsg.serialize(obj.lFootFac, buffer, bufferOffset);
    // Serialize message field [phaseFac]
    bufferOffset = _serializer.float64(obj.phaseFac, buffer, bufferOffset);
    // Serialize message field [armAdd]
    bufferOffset = _serializer.float64(obj.armAdd, buffer, bufferOffset);
    // Serialize message field [delayR]
    bufferOffset = _serializer.float64(obj.delayR, buffer, bufferOffset);
    // Serialize message field [delayL]
    bufferOffset = _serializer.float64(obj.delayL, buffer, bufferOffset);
    // Serialize message field [delayAll]
    bufferOffset = _serializer.float64(obj.delayAll, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HumanoidControlMsg
    let len;
    let data = new HumanoidControlMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [ctrl_flag]
    data.ctrl_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [arm_ctrl_flag]
    data.arm_ctrl_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [torso_ctrl_flag]
    data.torso_ctrl_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [phase_ctrl_flag]
    data.phase_ctrl_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [slope_ctrl_flag]
    data.slope_ctrl_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [foot_ctrl_flag]
    data.foot_ctrl_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [torsoAddX]
    data.torsoAddX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [torsoAddY]
    data.torsoAddY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [torsoAddZ]
    data.torsoAddZ = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [slope]
    data.slope = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [rFootFac]
    data.rFootFac = EndEffMsg.deserialize(buffer, bufferOffset);
    // Deserialize message field [lFootFac]
    data.lFootFac = EndEffMsg.deserialize(buffer, bufferOffset);
    // Deserialize message field [phaseFac]
    data.phaseFac = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [armAdd]
    data.armAdd = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [delayR]
    data.delayR = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [delayL]
    data.delayL = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [delayAll]
    data.delayAll = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 302;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/HumanoidControlMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0b7c6a6b1b062af7f2563f72e33b0aab';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header  header
    bool    ctrl_flag  
    bool    arm_ctrl_flag
    bool    torso_ctrl_flag 
    bool    phase_ctrl_flag 
    bool    slope_ctrl_flag 
    bool    foot_ctrl_flag 
    
    float64 torsoAddX
    float64 torsoAddY
    float64 torsoAddZ
    
    float64 slope
    
    movement_msgs/EndEffMsg  rFootFac
    movement_msgs/EndEffMsg  lFootFac
    
    float64 phaseFac
    
    
    float64 armAdd
    
    
    float64 delayR
    float64 delayL
    float64 delayAll
    
    
    
    
    
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
    MSG: movement_msgs/EndEffMsg
    geometry_msgs/Point  pos
    geometry_msgs/Point  vel
    geometry_msgs/Point  acc
    geometry_msgs/Point  rot
    int32                type
    int32                flag
    float64              dt
    
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
    const resolved = new HumanoidControlMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.ctrl_flag !== undefined) {
      resolved.ctrl_flag = msg.ctrl_flag;
    }
    else {
      resolved.ctrl_flag = false
    }

    if (msg.arm_ctrl_flag !== undefined) {
      resolved.arm_ctrl_flag = msg.arm_ctrl_flag;
    }
    else {
      resolved.arm_ctrl_flag = false
    }

    if (msg.torso_ctrl_flag !== undefined) {
      resolved.torso_ctrl_flag = msg.torso_ctrl_flag;
    }
    else {
      resolved.torso_ctrl_flag = false
    }

    if (msg.phase_ctrl_flag !== undefined) {
      resolved.phase_ctrl_flag = msg.phase_ctrl_flag;
    }
    else {
      resolved.phase_ctrl_flag = false
    }

    if (msg.slope_ctrl_flag !== undefined) {
      resolved.slope_ctrl_flag = msg.slope_ctrl_flag;
    }
    else {
      resolved.slope_ctrl_flag = false
    }

    if (msg.foot_ctrl_flag !== undefined) {
      resolved.foot_ctrl_flag = msg.foot_ctrl_flag;
    }
    else {
      resolved.foot_ctrl_flag = false
    }

    if (msg.torsoAddX !== undefined) {
      resolved.torsoAddX = msg.torsoAddX;
    }
    else {
      resolved.torsoAddX = 0.0
    }

    if (msg.torsoAddY !== undefined) {
      resolved.torsoAddY = msg.torsoAddY;
    }
    else {
      resolved.torsoAddY = 0.0
    }

    if (msg.torsoAddZ !== undefined) {
      resolved.torsoAddZ = msg.torsoAddZ;
    }
    else {
      resolved.torsoAddZ = 0.0
    }

    if (msg.slope !== undefined) {
      resolved.slope = msg.slope;
    }
    else {
      resolved.slope = 0.0
    }

    if (msg.rFootFac !== undefined) {
      resolved.rFootFac = EndEffMsg.Resolve(msg.rFootFac)
    }
    else {
      resolved.rFootFac = new EndEffMsg()
    }

    if (msg.lFootFac !== undefined) {
      resolved.lFootFac = EndEffMsg.Resolve(msg.lFootFac)
    }
    else {
      resolved.lFootFac = new EndEffMsg()
    }

    if (msg.phaseFac !== undefined) {
      resolved.phaseFac = msg.phaseFac;
    }
    else {
      resolved.phaseFac = 0.0
    }

    if (msg.armAdd !== undefined) {
      resolved.armAdd = msg.armAdd;
    }
    else {
      resolved.armAdd = 0.0
    }

    if (msg.delayR !== undefined) {
      resolved.delayR = msg.delayR;
    }
    else {
      resolved.delayR = 0.0
    }

    if (msg.delayL !== undefined) {
      resolved.delayL = msg.delayL;
    }
    else {
      resolved.delayL = 0.0
    }

    if (msg.delayAll !== undefined) {
      resolved.delayAll = msg.delayAll;
    }
    else {
      resolved.delayAll = 0.0
    }

    return resolved;
    }
};

module.exports = HumanoidControlMsg;
