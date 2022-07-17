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

class CommandToOpenCMSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.opencm_command = null;
    }
    else {
      if (initObj.hasOwnProperty('opencm_command')) {
        this.opencm_command = initObj.opencm_command
      }
      else {
        this.opencm_command = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CommandToOpenCMSrvRequest
    // Serialize message field [opencm_command]
    bufferOffset = _serializer.int16(obj.opencm_command, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CommandToOpenCMSrvRequest
    let len;
    let data = new CommandToOpenCMSrvRequest(null);
    // Deserialize message field [opencm_command]
    data.opencm_command = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/CommandToOpenCMSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a989f0fa19549b89789ef4a2cbd63db3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 opencm_command
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CommandToOpenCMSrvRequest(null);
    if (msg.opencm_command !== undefined) {
      resolved.opencm_command = msg.opencm_command;
    }
    else {
      resolved.opencm_command = 0
    }

    return resolved;
    }
};

class CommandToOpenCMSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.command_executed = null;
    }
    else {
      if (initObj.hasOwnProperty('command_executed')) {
        this.command_executed = initObj.command_executed
      }
      else {
        this.command_executed = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CommandToOpenCMSrvResponse
    // Serialize message field [command_executed]
    bufferOffset = _serializer.bool(obj.command_executed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CommandToOpenCMSrvResponse
    let len;
    let data = new CommandToOpenCMSrvResponse(null);
    // Deserialize message field [command_executed]
    data.command_executed = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/CommandToOpenCMSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '84201e3713d34186a0242b6cb5f84aab';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool command_executed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CommandToOpenCMSrvResponse(null);
    if (msg.command_executed !== undefined) {
      resolved.command_executed = msg.command_executed;
    }
    else {
      resolved.command_executed = false
    }

    return resolved;
    }
};

module.exports = {
  Request: CommandToOpenCMSrvRequest,
  Response: CommandToOpenCMSrvResponse,
  md5sum() { return '006dfbee25aeee1268324ecc4e306ddb'; },
  datatype() { return 'movement_msgs/CommandToOpenCMSrv'; }
};
