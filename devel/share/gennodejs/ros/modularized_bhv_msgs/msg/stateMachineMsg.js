// Auto-generated. Do not edit!

// (in-package modularized_bhv_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class stateMachineMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.fallState = null;
      this.ballFound = null;
      this.ballClose = null;
      this.ballRelativePosition = null;
      this.verAngleAccomplished = null;
      this.headPossibleMovements = null;
      this.horMotorOutOfCenter = null;
      this.horMotorPosition = null;
    }
    else {
      if (initObj.hasOwnProperty('fallState')) {
        this.fallState = initObj.fallState
      }
      else {
        this.fallState = '';
      }
      if (initObj.hasOwnProperty('ballFound')) {
        this.ballFound = initObj.ballFound
      }
      else {
        this.ballFound = false;
      }
      if (initObj.hasOwnProperty('ballClose')) {
        this.ballClose = initObj.ballClose
      }
      else {
        this.ballClose = false;
      }
      if (initObj.hasOwnProperty('ballRelativePosition')) {
        this.ballRelativePosition = initObj.ballRelativePosition
      }
      else {
        this.ballRelativePosition = '';
      }
      if (initObj.hasOwnProperty('verAngleAccomplished')) {
        this.verAngleAccomplished = initObj.verAngleAccomplished
      }
      else {
        this.verAngleAccomplished = false;
      }
      if (initObj.hasOwnProperty('headPossibleMovements')) {
        this.headPossibleMovements = initObj.headPossibleMovements
      }
      else {
        this.headPossibleMovements = [];
      }
      if (initObj.hasOwnProperty('horMotorOutOfCenter')) {
        this.horMotorOutOfCenter = initObj.horMotorOutOfCenter
      }
      else {
        this.horMotorOutOfCenter = false;
      }
      if (initObj.hasOwnProperty('horMotorPosition')) {
        this.horMotorPosition = initObj.horMotorPosition
      }
      else {
        this.horMotorPosition = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type stateMachineMsg
    // Serialize message field [fallState]
    bufferOffset = _serializer.string(obj.fallState, buffer, bufferOffset);
    // Serialize message field [ballFound]
    bufferOffset = _serializer.bool(obj.ballFound, buffer, bufferOffset);
    // Serialize message field [ballClose]
    bufferOffset = _serializer.bool(obj.ballClose, buffer, bufferOffset);
    // Serialize message field [ballRelativePosition]
    bufferOffset = _serializer.string(obj.ballRelativePosition, buffer, bufferOffset);
    // Serialize message field [verAngleAccomplished]
    bufferOffset = _serializer.bool(obj.verAngleAccomplished, buffer, bufferOffset);
    // Serialize message field [headPossibleMovements]
    bufferOffset = _arraySerializer.string(obj.headPossibleMovements, buffer, bufferOffset, null);
    // Serialize message field [horMotorOutOfCenter]
    bufferOffset = _serializer.bool(obj.horMotorOutOfCenter, buffer, bufferOffset);
    // Serialize message field [horMotorPosition]
    bufferOffset = _serializer.float32(obj.horMotorPosition, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type stateMachineMsg
    let len;
    let data = new stateMachineMsg(null);
    // Deserialize message field [fallState]
    data.fallState = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [ballFound]
    data.ballFound = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [ballClose]
    data.ballClose = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [ballRelativePosition]
    data.ballRelativePosition = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [verAngleAccomplished]
    data.verAngleAccomplished = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [headPossibleMovements]
    data.headPossibleMovements = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [horMotorOutOfCenter]
    data.horMotorOutOfCenter = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [horMotorPosition]
    data.horMotorPosition = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.fallState);
    length += _getByteLength(object.ballRelativePosition);
    object.headPossibleMovements.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'modularized_bhv_msgs/stateMachineMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fef8165d0297ca5e6f3b8c591ed6dfff';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string fallState
    bool ballFound
    bool ballClose
    string ballRelativePosition
    bool verAngleAccomplished
    string[] headPossibleMovements
    bool horMotorOutOfCenter
    float32 horMotorPosition
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new stateMachineMsg(null);
    if (msg.fallState !== undefined) {
      resolved.fallState = msg.fallState;
    }
    else {
      resolved.fallState = ''
    }

    if (msg.ballFound !== undefined) {
      resolved.ballFound = msg.ballFound;
    }
    else {
      resolved.ballFound = false
    }

    if (msg.ballClose !== undefined) {
      resolved.ballClose = msg.ballClose;
    }
    else {
      resolved.ballClose = false
    }

    if (msg.ballRelativePosition !== undefined) {
      resolved.ballRelativePosition = msg.ballRelativePosition;
    }
    else {
      resolved.ballRelativePosition = ''
    }

    if (msg.verAngleAccomplished !== undefined) {
      resolved.verAngleAccomplished = msg.verAngleAccomplished;
    }
    else {
      resolved.verAngleAccomplished = false
    }

    if (msg.headPossibleMovements !== undefined) {
      resolved.headPossibleMovements = msg.headPossibleMovements;
    }
    else {
      resolved.headPossibleMovements = []
    }

    if (msg.horMotorOutOfCenter !== undefined) {
      resolved.horMotorOutOfCenter = msg.horMotorOutOfCenter;
    }
    else {
      resolved.horMotorOutOfCenter = false
    }

    if (msg.horMotorPosition !== undefined) {
      resolved.horMotorPosition = msg.horMotorPosition;
    }
    else {
      resolved.horMotorPosition = 0.0
    }

    return resolved;
    }
};

module.exports = stateMachineMsg;
