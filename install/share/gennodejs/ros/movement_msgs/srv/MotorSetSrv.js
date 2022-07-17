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

class MotorSetSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.toGazebo = null;
      this.toRobot = null;
      this.page = null;
      this.pose = null;
    }
    else {
      if (initObj.hasOwnProperty('toGazebo')) {
        this.toGazebo = initObj.toGazebo
      }
      else {
        this.toGazebo = false;
      }
      if (initObj.hasOwnProperty('toRobot')) {
        this.toRobot = initObj.toRobot
      }
      else {
        this.toRobot = false;
      }
      if (initObj.hasOwnProperty('page')) {
        this.page = initObj.page
      }
      else {
        this.page = '';
      }
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotorSetSrvRequest
    // Serialize message field [toGazebo]
    bufferOffset = _serializer.bool(obj.toGazebo, buffer, bufferOffset);
    // Serialize message field [toRobot]
    bufferOffset = _serializer.bool(obj.toRobot, buffer, bufferOffset);
    // Serialize message field [page]
    bufferOffset = _serializer.string(obj.page, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = _serializer.string(obj.pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotorSetSrvRequest
    let len;
    let data = new MotorSetSrvRequest(null);
    // Deserialize message field [toGazebo]
    data.toGazebo = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [toRobot]
    data.toRobot = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [page]
    data.page = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.page);
    length += _getByteLength(object.pose);
    return length + 10;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/MotorSetSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ec1859e255b743457ecbab4cc3de4b47';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool   toGazebo
    bool   toRobot
    string page
    string pose
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MotorSetSrvRequest(null);
    if (msg.toGazebo !== undefined) {
      resolved.toGazebo = msg.toGazebo;
    }
    else {
      resolved.toGazebo = false
    }

    if (msg.toRobot !== undefined) {
      resolved.toRobot = msg.toRobot;
    }
    else {
      resolved.toRobot = false
    }

    if (msg.page !== undefined) {
      resolved.page = msg.page;
    }
    else {
      resolved.page = ''
    }

    if (msg.pose !== undefined) {
      resolved.pose = msg.pose;
    }
    else {
      resolved.pose = ''
    }

    return resolved;
    }
};

class MotorSetSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotorSetSrvResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotorSetSrvResponse
    let len;
    let data = new MotorSetSrvResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/MotorSetSrvResponse';
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
    const resolved = new MotorSetSrvResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: MotorSetSrvRequest,
  Response: MotorSetSrvResponse,
  md5sum() { return 'ec1859e255b743457ecbab4cc3de4b47'; },
  datatype() { return 'movement_msgs/MotorSetSrv'; }
};
