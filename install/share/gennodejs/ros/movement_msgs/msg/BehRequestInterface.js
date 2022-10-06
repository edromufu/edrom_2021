// Auto-generated. Do not edit!

// (in-package movement_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class BehRequestInterface {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.required_movement = null;
      this.required_status = null;
    }
    else {
      if (initObj.hasOwnProperty('required_movement')) {
        this.required_movement = initObj.required_movement
      }
      else {
        this.required_movement = '';
      }
      if (initObj.hasOwnProperty('required_status')) {
        this.required_status = initObj.required_status
      }
      else {
        this.required_status = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BehRequestInterface
    // Serialize message field [required_movement]
    bufferOffset = _serializer.string(obj.required_movement, buffer, bufferOffset);
    // Serialize message field [required_status]
    bufferOffset = _serializer.bool(obj.required_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BehRequestInterface
    let len;
    let data = new BehRequestInterface(null);
    // Deserialize message field [required_movement]
    data.required_movement = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [required_status]
    data.required_status = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.required_movement);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/BehRequestInterface';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a8e8e1d113594f935b637fde0165e779';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string required_movement
    bool required_status
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BehRequestInterface(null);
    if (msg.required_movement !== undefined) {
      resolved.required_movement = msg.required_movement;
    }
    else {
      resolved.required_movement = ''
    }

    if (msg.required_status !== undefined) {
      resolved.required_status = msg.required_status;
    }
    else {
      resolved.required_status = false
    }

    return resolved;
    }
};

module.exports = BehRequestInterface;
