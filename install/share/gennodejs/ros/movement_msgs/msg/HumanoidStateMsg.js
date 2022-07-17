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

class HumanoidStateMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.angX = null;
      this.angY = null;
      this.gyroX = null;
      this.gyroY = null;
      this.gyroZ = null;
      this.accX = null;
      this.accY = null;
      this.accZ = null;
    }
    else {
      if (initObj.hasOwnProperty('angX')) {
        this.angX = initObj.angX
      }
      else {
        this.angX = 0.0;
      }
      if (initObj.hasOwnProperty('angY')) {
        this.angY = initObj.angY
      }
      else {
        this.angY = 0.0;
      }
      if (initObj.hasOwnProperty('gyroX')) {
        this.gyroX = initObj.gyroX
      }
      else {
        this.gyroX = 0.0;
      }
      if (initObj.hasOwnProperty('gyroY')) {
        this.gyroY = initObj.gyroY
      }
      else {
        this.gyroY = 0.0;
      }
      if (initObj.hasOwnProperty('gyroZ')) {
        this.gyroZ = initObj.gyroZ
      }
      else {
        this.gyroZ = 0.0;
      }
      if (initObj.hasOwnProperty('accX')) {
        this.accX = initObj.accX
      }
      else {
        this.accX = 0.0;
      }
      if (initObj.hasOwnProperty('accY')) {
        this.accY = initObj.accY
      }
      else {
        this.accY = 0.0;
      }
      if (initObj.hasOwnProperty('accZ')) {
        this.accZ = initObj.accZ
      }
      else {
        this.accZ = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HumanoidStateMsg
    // Serialize message field [angX]
    bufferOffset = _serializer.float64(obj.angX, buffer, bufferOffset);
    // Serialize message field [angY]
    bufferOffset = _serializer.float64(obj.angY, buffer, bufferOffset);
    // Serialize message field [gyroX]
    bufferOffset = _serializer.float64(obj.gyroX, buffer, bufferOffset);
    // Serialize message field [gyroY]
    bufferOffset = _serializer.float64(obj.gyroY, buffer, bufferOffset);
    // Serialize message field [gyroZ]
    bufferOffset = _serializer.float64(obj.gyroZ, buffer, bufferOffset);
    // Serialize message field [accX]
    bufferOffset = _serializer.float64(obj.accX, buffer, bufferOffset);
    // Serialize message field [accY]
    bufferOffset = _serializer.float64(obj.accY, buffer, bufferOffset);
    // Serialize message field [accZ]
    bufferOffset = _serializer.float64(obj.accZ, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HumanoidStateMsg
    let len;
    let data = new HumanoidStateMsg(null);
    // Deserialize message field [angX]
    data.angX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angY]
    data.angY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [gyroX]
    data.gyroX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [gyroY]
    data.gyroY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [gyroZ]
    data.gyroZ = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [accX]
    data.accX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [accY]
    data.accY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [accZ]
    data.accZ = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/HumanoidStateMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7110852ac7d0bacf26e5ea1ead1abb25';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 angX
    float64 angY
    
    float64 gyroX
    float64 gyroY
    float64 gyroZ
    
    float64 accX
    float64 accY
    float64 accZ
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HumanoidStateMsg(null);
    if (msg.angX !== undefined) {
      resolved.angX = msg.angX;
    }
    else {
      resolved.angX = 0.0
    }

    if (msg.angY !== undefined) {
      resolved.angY = msg.angY;
    }
    else {
      resolved.angY = 0.0
    }

    if (msg.gyroX !== undefined) {
      resolved.gyroX = msg.gyroX;
    }
    else {
      resolved.gyroX = 0.0
    }

    if (msg.gyroY !== undefined) {
      resolved.gyroY = msg.gyroY;
    }
    else {
      resolved.gyroY = 0.0
    }

    if (msg.gyroZ !== undefined) {
      resolved.gyroZ = msg.gyroZ;
    }
    else {
      resolved.gyroZ = 0.0
    }

    if (msg.accX !== undefined) {
      resolved.accX = msg.accX;
    }
    else {
      resolved.accX = 0.0
    }

    if (msg.accY !== undefined) {
      resolved.accY = msg.accY;
    }
    else {
      resolved.accY = 0.0
    }

    if (msg.accZ !== undefined) {
      resolved.accZ = msg.accZ;
    }
    else {
      resolved.accZ = 0.0
    }

    return resolved;
    }
};

module.exports = HumanoidStateMsg;
