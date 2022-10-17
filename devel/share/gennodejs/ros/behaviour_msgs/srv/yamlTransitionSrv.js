// Auto-generated. Do not edit!

// (in-package behaviour_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class yamlTransitionSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.decision = null;
    }
    else {
      if (initObj.hasOwnProperty('decision')) {
        this.decision = initObj.decision
      }
      else {
        this.decision = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type yamlTransitionSrvRequest
    // Serialize message field [decision]
    bufferOffset = _serializer.string(obj.decision, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type yamlTransitionSrvRequest
    let len;
    let data = new yamlTransitionSrvRequest(null);
    // Deserialize message field [decision]
    data.decision = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.decision);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'behaviour_msgs/yamlTransitionSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '87ff97832d5405e41358fe1b7204e781';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string decision
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new yamlTransitionSrvRequest(null);
    if (msg.decision !== undefined) {
      resolved.decision = msg.decision;
    }
    else {
      resolved.decision = ''
    }

    return resolved;
    }
};

class yamlTransitionSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.confirmation = null;
    }
    else {
      if (initObj.hasOwnProperty('confirmation')) {
        this.confirmation = initObj.confirmation
      }
      else {
        this.confirmation = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type yamlTransitionSrvResponse
    // Serialize message field [confirmation]
    bufferOffset = _serializer.string(obj.confirmation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type yamlTransitionSrvResponse
    let len;
    let data = new yamlTransitionSrvResponse(null);
    // Deserialize message field [confirmation]
    data.confirmation = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.confirmation);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'behaviour_msgs/yamlTransitionSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5fdcda0f95399f6b72fea1643acc7e4b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string confirmation
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new yamlTransitionSrvResponse(null);
    if (msg.confirmation !== undefined) {
      resolved.confirmation = msg.confirmation;
    }
    else {
      resolved.confirmation = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: yamlTransitionSrvRequest,
  Response: yamlTransitionSrvResponse,
  md5sum() { return '74ae6a711767847beb795a6d289ea68e'; },
  datatype() { return 'behaviour_msgs/yamlTransitionSrv'; }
};
