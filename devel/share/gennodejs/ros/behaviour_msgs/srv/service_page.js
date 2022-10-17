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

class service_pageRequest {
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
    // Serializes a message object of type service_pageRequest
    // Serialize message field [page]
    bufferOffset = _serializer.string(obj.page, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type service_pageRequest
    let len;
    let data = new service_pageRequest(null);
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
    return 'behaviour_msgs/service_pageRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '25b28a799524944e4ad8b7de784a2cad';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string page
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new service_pageRequest(null);
    if (msg.page !== undefined) {
      resolved.page = msg.page;
    }
    else {
      resolved.page = ''
    }

    return resolved;
    }
};

class service_pageResponse {
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
    // Serializes a message object of type service_pageResponse
    // Serialize message field [confirmation]
    bufferOffset = _serializer.string(obj.confirmation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type service_pageResponse
    let len;
    let data = new service_pageResponse(null);
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
    return 'behaviour_msgs/service_pageResponse';
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
    const resolved = new service_pageResponse(null);
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
  Request: service_pageRequest,
  Response: service_pageResponse,
  md5sum() { return 'e13299641855e63d2249efe085c03277'; },
  datatype() { return 'behaviour_msgs/service_page'; }
};
