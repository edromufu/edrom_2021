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

class MotorPIDMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.kp = null;
      this.ki = null;
      this.kd = null;
    }
    else {
      if (initObj.hasOwnProperty('kp')) {
        this.kp = initObj.kp
      }
      else {
        this.kp = [];
      }
      if (initObj.hasOwnProperty('ki')) {
        this.ki = initObj.ki
      }
      else {
        this.ki = [];
      }
      if (initObj.hasOwnProperty('kd')) {
        this.kd = initObj.kd
      }
      else {
        this.kd = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotorPIDMsg
    // Serialize message field [kp]
    bufferOffset = _arraySerializer.float64(obj.kp, buffer, bufferOffset, null);
    // Serialize message field [ki]
    bufferOffset = _arraySerializer.float64(obj.ki, buffer, bufferOffset, null);
    // Serialize message field [kd]
    bufferOffset = _arraySerializer.float64(obj.kd, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotorPIDMsg
    let len;
    let data = new MotorPIDMsg(null);
    // Deserialize message field [kp]
    data.kp = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [ki]
    data.ki = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [kd]
    data.kd = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.kp.length;
    length += 8 * object.ki.length;
    length += 8 * object.kd.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/MotorPIDMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4792326033ccf840aaf0bded51af3ebe';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[]       kp
    float64[]       ki
    float64[]       kd
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MotorPIDMsg(null);
    if (msg.kp !== undefined) {
      resolved.kp = msg.kp;
    }
    else {
      resolved.kp = []
    }

    if (msg.ki !== undefined) {
      resolved.ki = msg.ki;
    }
    else {
      resolved.ki = []
    }

    if (msg.kd !== undefined) {
      resolved.kd = msg.kd;
    }
    else {
      resolved.kd = []
    }

    return resolved;
    }
};

module.exports = MotorPIDMsg;
