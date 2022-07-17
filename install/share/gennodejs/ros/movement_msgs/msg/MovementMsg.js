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

class MovementMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.xHead = null;
      this.yHead = null;
      this.roll = null;
      this.pitch = null;
      this.yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('xHead')) {
        this.xHead = initObj.xHead
      }
      else {
        this.xHead = 0.0;
      }
      if (initObj.hasOwnProperty('yHead')) {
        this.yHead = initObj.yHead
      }
      else {
        this.yHead = 0.0;
      }
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = 0.0;
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MovementMsg
    // Serialize message field [xHead]
    bufferOffset = _serializer.float64(obj.xHead, buffer, bufferOffset);
    // Serialize message field [yHead]
    bufferOffset = _serializer.float64(obj.yHead, buffer, bufferOffset);
    // Serialize message field [roll]
    bufferOffset = _serializer.float64(obj.roll, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = _serializer.float64(obj.pitch, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float64(obj.yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MovementMsg
    let len;
    let data = new MovementMsg(null);
    // Deserialize message field [xHead]
    data.xHead = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yHead]
    data.yHead = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [roll]
    data.roll = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/MovementMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1f55457e70c178e855a6ca79758abeb7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 xHead
    float64 yHead
    float64 roll
    float64 pitch
    float64 yaw
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MovementMsg(null);
    if (msg.xHead !== undefined) {
      resolved.xHead = msg.xHead;
    }
    else {
      resolved.xHead = 0.0
    }

    if (msg.yHead !== undefined) {
      resolved.yHead = msg.yHead;
    }
    else {
      resolved.yHead = 0.0
    }

    if (msg.roll !== undefined) {
      resolved.roll = msg.roll;
    }
    else {
      resolved.roll = 0.0
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    return resolved;
    }
};

module.exports = MovementMsg;
