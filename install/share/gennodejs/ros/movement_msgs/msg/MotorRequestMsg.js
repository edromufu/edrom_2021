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

class MotorRequestMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.source = null;
      this.writeCommand = null;
      this.data = null;
      this.velocity = null;
      this.readCommand = null;
    }
    else {
      if (initObj.hasOwnProperty('source')) {
        this.source = initObj.source
      }
      else {
        this.source = '';
      }
      if (initObj.hasOwnProperty('writeCommand')) {
        this.writeCommand = initObj.writeCommand
      }
      else {
        this.writeCommand = '';
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = [];
      }
      if (initObj.hasOwnProperty('readCommand')) {
        this.readCommand = initObj.readCommand
      }
      else {
        this.readCommand = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotorRequestMsg
    // Serialize message field [source]
    bufferOffset = _serializer.string(obj.source, buffer, bufferOffset);
    // Serialize message field [writeCommand]
    bufferOffset = _serializer.string(obj.writeCommand, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = _arraySerializer.float64(obj.data, buffer, bufferOffset, null);
    // Serialize message field [velocity]
    bufferOffset = _arraySerializer.float64(obj.velocity, buffer, bufferOffset, null);
    // Serialize message field [readCommand]
    bufferOffset = _serializer.string(obj.readCommand, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotorRequestMsg
    let len;
    let data = new MotorRequestMsg(null);
    // Deserialize message field [source]
    data.source = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [writeCommand]
    data.writeCommand = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [velocity]
    data.velocity = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [readCommand]
    data.readCommand = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.source);
    length += _getByteLength(object.writeCommand);
    length += 8 * object.data.length;
    length += 8 * object.velocity.length;
    length += _getByteLength(object.readCommand);
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/MotorRequestMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '298878b70cf41c7555ec4b3aacf8d255';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string source
    string writeCommand
    float64[] data
    float64[] velocity
    string readCommand
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MotorRequestMsg(null);
    if (msg.source !== undefined) {
      resolved.source = msg.source;
    }
    else {
      resolved.source = ''
    }

    if (msg.writeCommand !== undefined) {
      resolved.writeCommand = msg.writeCommand;
    }
    else {
      resolved.writeCommand = ''
    }

    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = []
    }

    if (msg.readCommand !== undefined) {
      resolved.readCommand = msg.readCommand;
    }
    else {
      resolved.readCommand = ''
    }

    return resolved;
    }
};

module.exports = MotorRequestMsg;
