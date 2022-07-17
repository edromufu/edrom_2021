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

class MotorDatasMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.left_hip_yaw = null;
      this.left_hip_pitch = null;
      this.left_hip_roll = null;
      this.left_knee = null;
      this.left_ankle_pitch = null;
      this.left_ankle_roll = null;
      this.right_hip_yaw = null;
      this.right_hip_pitch = null;
      this.right_hip_roll = null;
      this.right_knee = null;
      this.right_ankle_pitch = null;
      this.right_ankle_roll = null;
    }
    else {
      if (initObj.hasOwnProperty('left_hip_yaw')) {
        this.left_hip_yaw = initObj.left_hip_yaw
      }
      else {
        this.left_hip_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('left_hip_pitch')) {
        this.left_hip_pitch = initObj.left_hip_pitch
      }
      else {
        this.left_hip_pitch = 0.0;
      }
      if (initObj.hasOwnProperty('left_hip_roll')) {
        this.left_hip_roll = initObj.left_hip_roll
      }
      else {
        this.left_hip_roll = 0.0;
      }
      if (initObj.hasOwnProperty('left_knee')) {
        this.left_knee = initObj.left_knee
      }
      else {
        this.left_knee = 0.0;
      }
      if (initObj.hasOwnProperty('left_ankle_pitch')) {
        this.left_ankle_pitch = initObj.left_ankle_pitch
      }
      else {
        this.left_ankle_pitch = 0.0;
      }
      if (initObj.hasOwnProperty('left_ankle_roll')) {
        this.left_ankle_roll = initObj.left_ankle_roll
      }
      else {
        this.left_ankle_roll = 0.0;
      }
      if (initObj.hasOwnProperty('right_hip_yaw')) {
        this.right_hip_yaw = initObj.right_hip_yaw
      }
      else {
        this.right_hip_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('right_hip_pitch')) {
        this.right_hip_pitch = initObj.right_hip_pitch
      }
      else {
        this.right_hip_pitch = 0.0;
      }
      if (initObj.hasOwnProperty('right_hip_roll')) {
        this.right_hip_roll = initObj.right_hip_roll
      }
      else {
        this.right_hip_roll = 0.0;
      }
      if (initObj.hasOwnProperty('right_knee')) {
        this.right_knee = initObj.right_knee
      }
      else {
        this.right_knee = 0.0;
      }
      if (initObj.hasOwnProperty('right_ankle_pitch')) {
        this.right_ankle_pitch = initObj.right_ankle_pitch
      }
      else {
        this.right_ankle_pitch = 0.0;
      }
      if (initObj.hasOwnProperty('right_ankle_roll')) {
        this.right_ankle_roll = initObj.right_ankle_roll
      }
      else {
        this.right_ankle_roll = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotorDatasMsg
    // Serialize message field [left_hip_yaw]
    bufferOffset = _serializer.float32(obj.left_hip_yaw, buffer, bufferOffset);
    // Serialize message field [left_hip_pitch]
    bufferOffset = _serializer.float32(obj.left_hip_pitch, buffer, bufferOffset);
    // Serialize message field [left_hip_roll]
    bufferOffset = _serializer.float32(obj.left_hip_roll, buffer, bufferOffset);
    // Serialize message field [left_knee]
    bufferOffset = _serializer.float32(obj.left_knee, buffer, bufferOffset);
    // Serialize message field [left_ankle_pitch]
    bufferOffset = _serializer.float32(obj.left_ankle_pitch, buffer, bufferOffset);
    // Serialize message field [left_ankle_roll]
    bufferOffset = _serializer.float32(obj.left_ankle_roll, buffer, bufferOffset);
    // Serialize message field [right_hip_yaw]
    bufferOffset = _serializer.float32(obj.right_hip_yaw, buffer, bufferOffset);
    // Serialize message field [right_hip_pitch]
    bufferOffset = _serializer.float32(obj.right_hip_pitch, buffer, bufferOffset);
    // Serialize message field [right_hip_roll]
    bufferOffset = _serializer.float32(obj.right_hip_roll, buffer, bufferOffset);
    // Serialize message field [right_knee]
    bufferOffset = _serializer.float32(obj.right_knee, buffer, bufferOffset);
    // Serialize message field [right_ankle_pitch]
    bufferOffset = _serializer.float32(obj.right_ankle_pitch, buffer, bufferOffset);
    // Serialize message field [right_ankle_roll]
    bufferOffset = _serializer.float32(obj.right_ankle_roll, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotorDatasMsg
    let len;
    let data = new MotorDatasMsg(null);
    // Deserialize message field [left_hip_yaw]
    data.left_hip_yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [left_hip_pitch]
    data.left_hip_pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [left_hip_roll]
    data.left_hip_roll = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [left_knee]
    data.left_knee = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [left_ankle_pitch]
    data.left_ankle_pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [left_ankle_roll]
    data.left_ankle_roll = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [right_hip_yaw]
    data.right_hip_yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [right_hip_pitch]
    data.right_hip_pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [right_hip_roll]
    data.right_hip_roll = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [right_knee]
    data.right_knee = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [right_ankle_pitch]
    data.right_ankle_pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [right_ankle_roll]
    data.right_ankle_roll = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/MotorDatasMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a20165a6a0e94f4795ab484f0c0e748e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 left_hip_yaw
    float32 left_hip_pitch
    float32 left_hip_roll
    float32 left_knee
    float32 left_ankle_pitch
    float32 left_ankle_roll
    float32 right_hip_yaw
    float32 right_hip_pitch
    float32 right_hip_roll
    float32 right_knee
    float32 right_ankle_pitch
    float32 right_ankle_roll
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MotorDatasMsg(null);
    if (msg.left_hip_yaw !== undefined) {
      resolved.left_hip_yaw = msg.left_hip_yaw;
    }
    else {
      resolved.left_hip_yaw = 0.0
    }

    if (msg.left_hip_pitch !== undefined) {
      resolved.left_hip_pitch = msg.left_hip_pitch;
    }
    else {
      resolved.left_hip_pitch = 0.0
    }

    if (msg.left_hip_roll !== undefined) {
      resolved.left_hip_roll = msg.left_hip_roll;
    }
    else {
      resolved.left_hip_roll = 0.0
    }

    if (msg.left_knee !== undefined) {
      resolved.left_knee = msg.left_knee;
    }
    else {
      resolved.left_knee = 0.0
    }

    if (msg.left_ankle_pitch !== undefined) {
      resolved.left_ankle_pitch = msg.left_ankle_pitch;
    }
    else {
      resolved.left_ankle_pitch = 0.0
    }

    if (msg.left_ankle_roll !== undefined) {
      resolved.left_ankle_roll = msg.left_ankle_roll;
    }
    else {
      resolved.left_ankle_roll = 0.0
    }

    if (msg.right_hip_yaw !== undefined) {
      resolved.right_hip_yaw = msg.right_hip_yaw;
    }
    else {
      resolved.right_hip_yaw = 0.0
    }

    if (msg.right_hip_pitch !== undefined) {
      resolved.right_hip_pitch = msg.right_hip_pitch;
    }
    else {
      resolved.right_hip_pitch = 0.0
    }

    if (msg.right_hip_roll !== undefined) {
      resolved.right_hip_roll = msg.right_hip_roll;
    }
    else {
      resolved.right_hip_roll = 0.0
    }

    if (msg.right_knee !== undefined) {
      resolved.right_knee = msg.right_knee;
    }
    else {
      resolved.right_knee = 0.0
    }

    if (msg.right_ankle_pitch !== undefined) {
      resolved.right_ankle_pitch = msg.right_ankle_pitch;
    }
    else {
      resolved.right_ankle_pitch = 0.0
    }

    if (msg.right_ankle_roll !== undefined) {
      resolved.right_ankle_roll = msg.right_ankle_roll;
    }
    else {
      resolved.right_ankle_roll = 0.0
    }

    return resolved;
    }
};

module.exports = MotorDatasMsg;
