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

class WalkCreatorRequestSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.enabledGain = null;
      this.stepGain = null;
      this.lateralGain = null;
      this.turnGain = null;
    }
    else {
      if (initObj.hasOwnProperty('enabledGain')) {
        this.enabledGain = initObj.enabledGain
      }
      else {
        this.enabledGain = 0;
      }
      if (initObj.hasOwnProperty('stepGain')) {
        this.stepGain = initObj.stepGain
      }
      else {
        this.stepGain = 0.0;
      }
      if (initObj.hasOwnProperty('lateralGain')) {
        this.lateralGain = initObj.lateralGain
      }
      else {
        this.lateralGain = 0.0;
      }
      if (initObj.hasOwnProperty('turnGain')) {
        this.turnGain = initObj.turnGain
      }
      else {
        this.turnGain = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WalkCreatorRequestSrvRequest
    // Serialize message field [enabledGain]
    bufferOffset = _serializer.int32(obj.enabledGain, buffer, bufferOffset);
    // Serialize message field [stepGain]
    bufferOffset = _serializer.float32(obj.stepGain, buffer, bufferOffset);
    // Serialize message field [lateralGain]
    bufferOffset = _serializer.float32(obj.lateralGain, buffer, bufferOffset);
    // Serialize message field [turnGain]
    bufferOffset = _serializer.float32(obj.turnGain, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WalkCreatorRequestSrvRequest
    let len;
    let data = new WalkCreatorRequestSrvRequest(null);
    // Deserialize message field [enabledGain]
    data.enabledGain = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [stepGain]
    data.stepGain = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [lateralGain]
    data.lateralGain = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [turnGain]
    data.turnGain = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/WalkCreatorRequestSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '66ee05dd20ea77a2d2a46b908512c7e4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32   enabledGain
    float32 stepGain
    float32 lateralGain
    float32 turnGain
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WalkCreatorRequestSrvRequest(null);
    if (msg.enabledGain !== undefined) {
      resolved.enabledGain = msg.enabledGain;
    }
    else {
      resolved.enabledGain = 0
    }

    if (msg.stepGain !== undefined) {
      resolved.stepGain = msg.stepGain;
    }
    else {
      resolved.stepGain = 0.0
    }

    if (msg.lateralGain !== undefined) {
      resolved.lateralGain = msg.lateralGain;
    }
    else {
      resolved.lateralGain = 0.0
    }

    if (msg.turnGain !== undefined) {
      resolved.turnGain = msg.turnGain;
    }
    else {
      resolved.turnGain = 0.0
    }

    return resolved;
    }
};

class WalkCreatorRequestSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WalkCreatorRequestSrvResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WalkCreatorRequestSrvResponse
    let len;
    let data = new WalkCreatorRequestSrvResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/WalkCreatorRequestSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WalkCreatorRequestSrvResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: WalkCreatorRequestSrvRequest,
  Response: WalkCreatorRequestSrvResponse,
  md5sum() { return '2ef0cc05178b854a3a3baabade41abc2'; },
  datatype() { return 'movement_msgs/WalkCreatorRequestSrv'; }
};
