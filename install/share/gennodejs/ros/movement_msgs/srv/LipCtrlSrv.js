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

class LipCtrlSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.walk_ctrl = null;
      this.delayR = null;
      this.delayL = null;
      this.delayAll = null;
    }
    else {
      if (initObj.hasOwnProperty('walk_ctrl')) {
        this.walk_ctrl = initObj.walk_ctrl
      }
      else {
        this.walk_ctrl = false;
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
    // Serializes a message object of type LipCtrlSrvRequest
    // Serialize message field [walk_ctrl]
    bufferOffset = _serializer.bool(obj.walk_ctrl, buffer, bufferOffset);
    // Serialize message field [delayR]
    bufferOffset = _serializer.float64(obj.delayR, buffer, bufferOffset);
    // Serialize message field [delayL]
    bufferOffset = _serializer.float64(obj.delayL, buffer, bufferOffset);
    // Serialize message field [delayAll]
    bufferOffset = _serializer.float64(obj.delayAll, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LipCtrlSrvRequest
    let len;
    let data = new LipCtrlSrvRequest(null);
    // Deserialize message field [walk_ctrl]
    data.walk_ctrl = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [delayR]
    data.delayR = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [delayL]
    data.delayL = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [delayAll]
    data.delayAll = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 25;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/LipCtrlSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '19f7b1da62232e35c765032ea5c2cdaa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool    walk_ctrl  #true for walking, false to stop
    float64 delayR
    float64 delayL
    float64 delayAll
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LipCtrlSrvRequest(null);
    if (msg.walk_ctrl !== undefined) {
      resolved.walk_ctrl = msg.walk_ctrl;
    }
    else {
      resolved.walk_ctrl = false
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

class LipCtrlSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LipCtrlSrvResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LipCtrlSrvResponse
    let len;
    let data = new LipCtrlSrvResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/LipCtrlSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LipCtrlSrvResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: LipCtrlSrvRequest,
  Response: LipCtrlSrvResponse,
  md5sum() { return '19f7b1da62232e35c765032ea5c2cdaa'; },
  datatype() { return 'movement_msgs/LipCtrlSrv'; }
};
