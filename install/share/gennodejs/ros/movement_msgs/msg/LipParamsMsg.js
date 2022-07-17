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

class LipParamsMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.first_pose = null;
      this.move_head = null;
      this.walk_flag = null;
      this.test_mode = null;
      this.zCCorr = null;
      this.tS = null;
      this.tD = null;
      this.stepH = null;
      this.delayR = null;
      this.delayL = null;
      this.delayAll = null;
      this.vx = null;
      this.vy = null;
      this.vz = null;
    }
    else {
      if (initObj.hasOwnProperty('first_pose')) {
        this.first_pose = initObj.first_pose
      }
      else {
        this.first_pose = false;
      }
      if (initObj.hasOwnProperty('move_head')) {
        this.move_head = initObj.move_head
      }
      else {
        this.move_head = false;
      }
      if (initObj.hasOwnProperty('walk_flag')) {
        this.walk_flag = initObj.walk_flag
      }
      else {
        this.walk_flag = false;
      }
      if (initObj.hasOwnProperty('test_mode')) {
        this.test_mode = initObj.test_mode
      }
      else {
        this.test_mode = false;
      }
      if (initObj.hasOwnProperty('zCCorr')) {
        this.zCCorr = initObj.zCCorr
      }
      else {
        this.zCCorr = 0.0;
      }
      if (initObj.hasOwnProperty('tS')) {
        this.tS = initObj.tS
      }
      else {
        this.tS = 0.0;
      }
      if (initObj.hasOwnProperty('tD')) {
        this.tD = initObj.tD
      }
      else {
        this.tD = 0.0;
      }
      if (initObj.hasOwnProperty('stepH')) {
        this.stepH = initObj.stepH
      }
      else {
        this.stepH = 0.0;
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
      if (initObj.hasOwnProperty('vx')) {
        this.vx = initObj.vx
      }
      else {
        this.vx = 0.0;
      }
      if (initObj.hasOwnProperty('vy')) {
        this.vy = initObj.vy
      }
      else {
        this.vy = 0.0;
      }
      if (initObj.hasOwnProperty('vz')) {
        this.vz = initObj.vz
      }
      else {
        this.vz = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LipParamsMsg
    // Serialize message field [first_pose]
    bufferOffset = _serializer.bool(obj.first_pose, buffer, bufferOffset);
    // Serialize message field [move_head]
    bufferOffset = _serializer.bool(obj.move_head, buffer, bufferOffset);
    // Serialize message field [walk_flag]
    bufferOffset = _serializer.bool(obj.walk_flag, buffer, bufferOffset);
    // Serialize message field [test_mode]
    bufferOffset = _serializer.bool(obj.test_mode, buffer, bufferOffset);
    // Serialize message field [zCCorr]
    bufferOffset = _serializer.float64(obj.zCCorr, buffer, bufferOffset);
    // Serialize message field [tS]
    bufferOffset = _serializer.float64(obj.tS, buffer, bufferOffset);
    // Serialize message field [tD]
    bufferOffset = _serializer.float64(obj.tD, buffer, bufferOffset);
    // Serialize message field [stepH]
    bufferOffset = _serializer.float64(obj.stepH, buffer, bufferOffset);
    // Serialize message field [delayR]
    bufferOffset = _serializer.float64(obj.delayR, buffer, bufferOffset);
    // Serialize message field [delayL]
    bufferOffset = _serializer.float64(obj.delayL, buffer, bufferOffset);
    // Serialize message field [delayAll]
    bufferOffset = _serializer.float64(obj.delayAll, buffer, bufferOffset);
    // Serialize message field [vx]
    bufferOffset = _serializer.float64(obj.vx, buffer, bufferOffset);
    // Serialize message field [vy]
    bufferOffset = _serializer.float64(obj.vy, buffer, bufferOffset);
    // Serialize message field [vz]
    bufferOffset = _serializer.float64(obj.vz, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LipParamsMsg
    let len;
    let data = new LipParamsMsg(null);
    // Deserialize message field [first_pose]
    data.first_pose = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [move_head]
    data.move_head = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [walk_flag]
    data.walk_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [test_mode]
    data.test_mode = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [zCCorr]
    data.zCCorr = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [tS]
    data.tS = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [tD]
    data.tD = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [stepH]
    data.stepH = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [delayR]
    data.delayR = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [delayL]
    data.delayL = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [delayAll]
    data.delayAll = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vx]
    data.vx = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vy]
    data.vy = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vz]
    data.vz = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 84;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/LipParamsMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6a778c748371c895283cbab464bdfc2f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool    first_pose
    bool    move_head
    bool    walk_flag
    bool    test_mode
    float64 zCCorr
    float64 tS
    float64 tD
    float64 stepH
    float64 delayR
    float64 delayL
    float64 delayAll
    float64 vx
    float64 vy
    float64 vz
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LipParamsMsg(null);
    if (msg.first_pose !== undefined) {
      resolved.first_pose = msg.first_pose;
    }
    else {
      resolved.first_pose = false
    }

    if (msg.move_head !== undefined) {
      resolved.move_head = msg.move_head;
    }
    else {
      resolved.move_head = false
    }

    if (msg.walk_flag !== undefined) {
      resolved.walk_flag = msg.walk_flag;
    }
    else {
      resolved.walk_flag = false
    }

    if (msg.test_mode !== undefined) {
      resolved.test_mode = msg.test_mode;
    }
    else {
      resolved.test_mode = false
    }

    if (msg.zCCorr !== undefined) {
      resolved.zCCorr = msg.zCCorr;
    }
    else {
      resolved.zCCorr = 0.0
    }

    if (msg.tS !== undefined) {
      resolved.tS = msg.tS;
    }
    else {
      resolved.tS = 0.0
    }

    if (msg.tD !== undefined) {
      resolved.tD = msg.tD;
    }
    else {
      resolved.tD = 0.0
    }

    if (msg.stepH !== undefined) {
      resolved.stepH = msg.stepH;
    }
    else {
      resolved.stepH = 0.0
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

    if (msg.vx !== undefined) {
      resolved.vx = msg.vx;
    }
    else {
      resolved.vx = 0.0
    }

    if (msg.vy !== undefined) {
      resolved.vy = msg.vy;
    }
    else {
      resolved.vy = 0.0
    }

    if (msg.vz !== undefined) {
      resolved.vz = msg.vz;
    }
    else {
      resolved.vz = 0.0
    }

    return resolved;
    }
};

module.exports = LipParamsMsg;
