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

class WebotsMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.position = null;
      this.velocity = null;
      this.control = null;
      this.motor_name = null;
    }
    else {
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new Array(20).fill(0);
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = new Array(20).fill(0);
      }
      if (initObj.hasOwnProperty('control')) {
        this.control = initObj.control
      }
      else {
        this.control = '';
      }
      if (initObj.hasOwnProperty('motor_name')) {
        this.motor_name = initObj.motor_name
      }
      else {
        this.motor_name = new Array(20).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WebotsMsg
    // Check that the constant length array field [position] has the right length
    if (obj.position.length !== 20) {
      throw new Error('Unable to serialize array field position - length must be 20')
    }
    // Serialize message field [position]
    bufferOffset = _arraySerializer.float64(obj.position, buffer, bufferOffset, 20);
    // Check that the constant length array field [velocity] has the right length
    if (obj.velocity.length !== 20) {
      throw new Error('Unable to serialize array field velocity - length must be 20')
    }
    // Serialize message field [velocity]
    bufferOffset = _arraySerializer.float64(obj.velocity, buffer, bufferOffset, 20);
    // Serialize message field [control]
    bufferOffset = _serializer.string(obj.control, buffer, bufferOffset);
    // Check that the constant length array field [motor_name] has the right length
    if (obj.motor_name.length !== 20) {
      throw new Error('Unable to serialize array field motor_name - length must be 20')
    }
    // Serialize message field [motor_name]
    bufferOffset = _arraySerializer.string(obj.motor_name, buffer, bufferOffset, 20);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WebotsMsg
    let len;
    let data = new WebotsMsg(null);
    // Deserialize message field [position]
    data.position = _arrayDeserializer.float64(buffer, bufferOffset, 20)
    // Deserialize message field [velocity]
    data.velocity = _arrayDeserializer.float64(buffer, bufferOffset, 20)
    // Deserialize message field [control]
    data.control = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [motor_name]
    data.motor_name = _arrayDeserializer.string(buffer, bufferOffset, 20)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.control);
    object.motor_name.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 324;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/WebotsMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '954ba293d4cc5b7067f7a1e881d6f143';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[20] position
    float64[20] velocity
    string control
    string[20] motor_name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WebotsMsg(null);
    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = new Array(20).fill(0)
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = new Array(20).fill(0)
    }

    if (msg.control !== undefined) {
      resolved.control = msg.control;
    }
    else {
      resolved.control = ''
    }

    if (msg.motor_name !== undefined) {
      resolved.motor_name = msg.motor_name;
    }
    else {
      resolved.motor_name = new Array(20).fill(0)
    }

    return resolved;
    }
};

module.exports = WebotsMsg;
