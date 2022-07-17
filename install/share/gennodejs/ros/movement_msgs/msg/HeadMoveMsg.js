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

class HeadMoveMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.xMove = null;
      this.yMove = null;
      this.pos = null;
      this.xPos = null;
      this.yPos = null;
    }
    else {
      if (initObj.hasOwnProperty('xMove')) {
        this.xMove = initObj.xMove
      }
      else {
        this.xMove = 0;
      }
      if (initObj.hasOwnProperty('yMove')) {
        this.yMove = initObj.yMove
      }
      else {
        this.yMove = 0;
      }
      if (initObj.hasOwnProperty('pos')) {
        this.pos = initObj.pos
      }
      else {
        this.pos = 0;
      }
      if (initObj.hasOwnProperty('xPos')) {
        this.xPos = initObj.xPos
      }
      else {
        this.xPos = 0.0;
      }
      if (initObj.hasOwnProperty('yPos')) {
        this.yPos = initObj.yPos
      }
      else {
        this.yPos = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HeadMoveMsg
    // Serialize message field [xMove]
    bufferOffset = _serializer.int32(obj.xMove, buffer, bufferOffset);
    // Serialize message field [yMove]
    bufferOffset = _serializer.int32(obj.yMove, buffer, bufferOffset);
    // Serialize message field [pos]
    bufferOffset = _serializer.int16(obj.pos, buffer, bufferOffset);
    // Serialize message field [xPos]
    bufferOffset = _serializer.float64(obj.xPos, buffer, bufferOffset);
    // Serialize message field [yPos]
    bufferOffset = _serializer.float64(obj.yPos, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HeadMoveMsg
    let len;
    let data = new HeadMoveMsg(null);
    // Deserialize message field [xMove]
    data.xMove = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [yMove]
    data.yMove = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pos]
    data.pos = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [xPos]
    data.xPos = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yPos]
    data.yPos = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 26;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/HeadMoveMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cfc3b4f883111d2901b09d0640ace5ea';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32    xMove  
    int32    yMove
    int16	 pos
    float64  xPos
    float64  yPos
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HeadMoveMsg(null);
    if (msg.xMove !== undefined) {
      resolved.xMove = msg.xMove;
    }
    else {
      resolved.xMove = 0
    }

    if (msg.yMove !== undefined) {
      resolved.yMove = msg.yMove;
    }
    else {
      resolved.yMove = 0
    }

    if (msg.pos !== undefined) {
      resolved.pos = msg.pos;
    }
    else {
      resolved.pos = 0
    }

    if (msg.xPos !== undefined) {
      resolved.xPos = msg.xPos;
    }
    else {
      resolved.xPos = 0.0
    }

    if (msg.yPos !== undefined) {
      resolved.yPos = msg.yPos;
    }
    else {
      resolved.yPos = 0.0
    }

    return resolved;
    }
};

module.exports = HeadMoveMsg;
