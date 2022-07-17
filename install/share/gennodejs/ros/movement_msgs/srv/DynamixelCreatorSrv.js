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

class DynamixelCreatorSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.torque = null;
      this.wish = null;
    }
    else {
      if (initObj.hasOwnProperty('torque')) {
        this.torque = initObj.torque
      }
      else {
        this.torque = [];
      }
      if (initObj.hasOwnProperty('wish')) {
        this.wish = initObj.wish
      }
      else {
        this.wish = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DynamixelCreatorSrvRequest
    // Serialize message field [torque]
    bufferOffset = _arraySerializer.bool(obj.torque, buffer, bufferOffset, null);
    // Serialize message field [wish]
    bufferOffset = _serializer.string(obj.wish, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DynamixelCreatorSrvRequest
    let len;
    let data = new DynamixelCreatorSrvRequest(null);
    // Deserialize message field [torque]
    data.torque = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [wish]
    data.wish = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.torque.length;
    length += _getByteLength(object.wish);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/DynamixelCreatorSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '44c6f6ff6bf82ca49091d31c05b8eccc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool[] torque
    string wish 
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DynamixelCreatorSrvRequest(null);
    if (msg.torque !== undefined) {
      resolved.torque = msg.torque;
    }
    else {
      resolved.torque = []
    }

    if (msg.wish !== undefined) {
      resolved.wish = msg.wish;
    }
    else {
      resolved.wish = ''
    }

    return resolved;
    }
};

class DynamixelCreatorSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.feedbackPosition = null;
      this.feedbackTorque = null;
      this.feedbackVcc = null;
    }
    else {
      if (initObj.hasOwnProperty('feedbackPosition')) {
        this.feedbackPosition = initObj.feedbackPosition
      }
      else {
        this.feedbackPosition = new Array(20).fill(0);
      }
      if (initObj.hasOwnProperty('feedbackTorque')) {
        this.feedbackTorque = initObj.feedbackTorque
      }
      else {
        this.feedbackTorque = new Array(20).fill(0);
      }
      if (initObj.hasOwnProperty('feedbackVcc')) {
        this.feedbackVcc = initObj.feedbackVcc
      }
      else {
        this.feedbackVcc = new Array(20).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DynamixelCreatorSrvResponse
    // Check that the constant length array field [feedbackPosition] has the right length
    if (obj.feedbackPosition.length !== 20) {
      throw new Error('Unable to serialize array field feedbackPosition - length must be 20')
    }
    // Serialize message field [feedbackPosition]
    bufferOffset = _arraySerializer.float64(obj.feedbackPosition, buffer, bufferOffset, 20);
    // Check that the constant length array field [feedbackTorque] has the right length
    if (obj.feedbackTorque.length !== 20) {
      throw new Error('Unable to serialize array field feedbackTorque - length must be 20')
    }
    // Serialize message field [feedbackTorque]
    bufferOffset = _arraySerializer.bool(obj.feedbackTorque, buffer, bufferOffset, 20);
    // Check that the constant length array field [feedbackVcc] has the right length
    if (obj.feedbackVcc.length !== 20) {
      throw new Error('Unable to serialize array field feedbackVcc - length must be 20')
    }
    // Serialize message field [feedbackVcc]
    bufferOffset = _arraySerializer.float64(obj.feedbackVcc, buffer, bufferOffset, 20);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DynamixelCreatorSrvResponse
    let len;
    let data = new DynamixelCreatorSrvResponse(null);
    // Deserialize message field [feedbackPosition]
    data.feedbackPosition = _arrayDeserializer.float64(buffer, bufferOffset, 20)
    // Deserialize message field [feedbackTorque]
    data.feedbackTorque = _arrayDeserializer.bool(buffer, bufferOffset, 20)
    // Deserialize message field [feedbackVcc]
    data.feedbackVcc = _arrayDeserializer.float64(buffer, bufferOffset, 20)
    return data;
  }

  static getMessageSize(object) {
    return 340;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/DynamixelCreatorSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8223065620cdc5ef775559d5daa46c26';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[20] feedbackPosition
    bool[20] feedbackTorque
    float64[20] feedbackVcc
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DynamixelCreatorSrvResponse(null);
    if (msg.feedbackPosition !== undefined) {
      resolved.feedbackPosition = msg.feedbackPosition;
    }
    else {
      resolved.feedbackPosition = new Array(20).fill(0)
    }

    if (msg.feedbackTorque !== undefined) {
      resolved.feedbackTorque = msg.feedbackTorque;
    }
    else {
      resolved.feedbackTorque = new Array(20).fill(0)
    }

    if (msg.feedbackVcc !== undefined) {
      resolved.feedbackVcc = msg.feedbackVcc;
    }
    else {
      resolved.feedbackVcc = new Array(20).fill(0)
    }

    return resolved;
    }
};

module.exports = {
  Request: DynamixelCreatorSrvRequest,
  Response: DynamixelCreatorSrvResponse,
  md5sum() { return 'afc4a102e69ac104a3346382d7f6e9b9'; },
  datatype() { return 'movement_msgs/DynamixelCreatorSrv'; }
};
