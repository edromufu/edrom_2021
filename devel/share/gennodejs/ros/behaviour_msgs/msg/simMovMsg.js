// Auto-generated. Do not edit!

// (in-package behaviour_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class simMovMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.positions = null;
    }
    else {
      if (initObj.hasOwnProperty('positions')) {
        this.positions = initObj.positions
      }
      else {
        this.positions = new Array(2).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type simMovMsg
    // Check that the constant length array field [positions] has the right length
    if (obj.positions.length !== 2) {
      throw new Error('Unable to serialize array field positions - length must be 2')
    }
    // Serialize message field [positions]
    bufferOffset = _arraySerializer.float64(obj.positions, buffer, bufferOffset, 2);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type simMovMsg
    let len;
    let data = new simMovMsg(null);
    // Deserialize message field [positions]
    data.positions = _arrayDeserializer.float64(buffer, bufferOffset, 2)
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'behaviour_msgs/simMovMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2ea60a9dc19d0a4ca4c6af232a5cfe7f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[2] positions
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new simMovMsg(null);
    if (msg.positions !== undefined) {
      resolved.positions = msg.positions;
    }
    else {
      resolved.positions = new Array(2).fill(0)
    }

    return resolved;
    }
};

module.exports = simMovMsg;
