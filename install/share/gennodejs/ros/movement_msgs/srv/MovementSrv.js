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

class MovementSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.page = null;
    }
    else {
      if (initObj.hasOwnProperty('page')) {
        this.page = initObj.page
      }
      else {
        this.page = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MovementSrvRequest
    // Serialize message field [page]
    bufferOffset = _serializer.string(obj.page, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MovementSrvRequest
    let len;
    let data = new MovementSrvRequest(null);
    // Deserialize message field [page]
    data.page = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.page);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/MovementSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '25b28a799524944e4ad8b7de784a2cad';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string 		     page
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MovementSrvRequest(null);
    if (msg.page !== undefined) {
      resolved.page = msg.page;
    }
    else {
      resolved.page = ''
    }

    return resolved;
    }
};

class MovementSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.confirmation = null;
      this.path = null;
    }
    else {
      if (initObj.hasOwnProperty('confirmation')) {
        this.confirmation = initObj.confirmation
      }
      else {
        this.confirmation = '';
      }
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MovementSrvResponse
    // Serialize message field [confirmation]
    bufferOffset = _serializer.string(obj.confirmation, buffer, bufferOffset);
    // Serialize message field [path]
    bufferOffset = _serializer.string(obj.path, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MovementSrvResponse
    let len;
    let data = new MovementSrvResponse(null);
    // Deserialize message field [confirmation]
    data.confirmation = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [path]
    data.path = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.confirmation);
    length += _getByteLength(object.path);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/MovementSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '542fc7537a8cde71530b57eeb1e6ef8d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string 		     confirmation
    string			     path
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MovementSrvResponse(null);
    if (msg.confirmation !== undefined) {
      resolved.confirmation = msg.confirmation;
    }
    else {
      resolved.confirmation = ''
    }

    if (msg.path !== undefined) {
      resolved.path = msg.path;
    }
    else {
      resolved.path = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: MovementSrvRequest,
  Response: MovementSrvResponse,
  md5sum() { return '4c660c3667764df7d0c43d544ef98351'; },
  datatype() { return 'movement_msgs/MovementSrv'; }
};
