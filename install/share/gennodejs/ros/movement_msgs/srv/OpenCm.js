// Auto-generated. Do not edit!

// (in-package movement_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class OpenCmRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.write = null;
      this.data = null;
      this.vel = null;
      this.read = null;
    }
    else {
      if (initObj.hasOwnProperty('write')) {
        this.write = initObj.write
      }
      else {
        this.write = 0;
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = new Array(20).fill(0);
      }
      if (initObj.hasOwnProperty('vel')) {
        this.vel = initObj.vel
      }
      else {
        this.vel = new Array(20).fill(0);
      }
      if (initObj.hasOwnProperty('read')) {
        this.read = initObj.read
      }
      else {
        this.read = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OpenCmRequest
    // Serialize message field [write]
    bufferOffset = _serializer.uint8(obj.write, buffer, bufferOffset);
    // Check that the constant length array field [data] has the right length
    if (obj.data.length !== 20) {
      throw new Error('Unable to serialize array field data - length must be 20')
    }
    // Serialize message field [data]
    bufferOffset = _arraySerializer.uint16(obj.data, buffer, bufferOffset, 20);
    // Check that the constant length array field [vel] has the right length
    if (obj.vel.length !== 20) {
      throw new Error('Unable to serialize array field vel - length must be 20')
    }
    // Serialize message field [vel]
    bufferOffset = _arraySerializer.uint16(obj.vel, buffer, bufferOffset, 20);
    // Serialize message field [read]
    bufferOffset = _serializer.uint8(obj.read, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OpenCmRequest
    let len;
    let data = new OpenCmRequest(null);
    // Deserialize message field [write]
    data.write = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.uint16(buffer, bufferOffset, 20)
    // Deserialize message field [vel]
    data.vel = _arrayDeserializer.uint16(buffer, bufferOffset, 20)
    // Deserialize message field [read]
    data.read = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 82;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/OpenCmRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e1fa8516a67ccbbb759f9b9fe6ad3896';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 write
    uint16[20] data
    uint16[20] vel
    uint8 read 
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OpenCmRequest(null);
    if (msg.write !== undefined) {
      resolved.write = msg.write;
    }
    else {
      resolved.write = 0
    }

    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = new Array(20).fill(0)
    }

    if (msg.vel !== undefined) {
      resolved.vel = msg.vel;
    }
    else {
      resolved.vel = new Array(20).fill(0)
    }

    if (msg.read !== undefined) {
      resolved.read = msg.read;
    }
    else {
      resolved.read = 0
    }

    return resolved;
    }
};

class OpenCmResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OpenCmResponse
    // Serialize message field [result]
    bufferOffset = _arraySerializer.uint16(obj.result, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OpenCmResponse
    let len;
    let data = new OpenCmResponse(null);
    // Deserialize message field [result]
    data.result = _arrayDeserializer.uint16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 2 * object.result.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/OpenCmResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0f28a43bd8260b5272cff437c9698b1e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    uint16[] result
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OpenCmResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = []
    }

    return resolved;
    }
};

module.exports = {
  Request: OpenCmRequest,
  Response: OpenCmResponse,
  md5sum() { return 'ed318f5991a644927c9195494aa8898a'; },
  datatype() { return 'movement_msgs/OpenCm'; }
};
