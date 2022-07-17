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

class PredefinedMovementSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.request = null;
    }
    else {
      if (initObj.hasOwnProperty('request')) {
        this.request = initObj.request
      }
      else {
        this.request = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PredefinedMovementSrvRequest
    // Serialize message field [request]
    bufferOffset = _serializer.string(obj.request, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PredefinedMovementSrvRequest
    let len;
    let data = new PredefinedMovementSrvRequest(null);
    // Deserialize message field [request]
    data.request = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.request);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/PredefinedMovementSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9b13f31f7a0a36901919f7ec0d9f40d4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string request
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PredefinedMovementSrvRequest(null);
    if (msg.request !== undefined) {
      resolved.request = msg.request;
    }
    else {
      resolved.request = ''
    }

    return resolved;
    }
};

class PredefinedMovementSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sucess = null;
    }
    else {
      if (initObj.hasOwnProperty('sucess')) {
        this.sucess = initObj.sucess
      }
      else {
        this.sucess = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PredefinedMovementSrvResponse
    // Serialize message field [sucess]
    bufferOffset = _serializer.bool(obj.sucess, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PredefinedMovementSrvResponse
    let len;
    let data = new PredefinedMovementSrvResponse(null);
    // Deserialize message field [sucess]
    data.sucess = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/PredefinedMovementSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3e8ad2f62d0edf01ac96b1e92459b490';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    bool sucess
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PredefinedMovementSrvResponse(null);
    if (msg.sucess !== undefined) {
      resolved.sucess = msg.sucess;
    }
    else {
      resolved.sucess = false
    }

    return resolved;
    }
};

module.exports = {
  Request: PredefinedMovementSrvRequest,
  Response: PredefinedMovementSrvResponse,
  md5sum() { return 'bfd977d15515237025d35499f550165a'; },
  datatype() { return 'movement_msgs/PredefinedMovementSrv'; }
};
