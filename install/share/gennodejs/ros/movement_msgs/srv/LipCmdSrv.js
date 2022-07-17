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

class LipCmdSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.first_pose = null;
      this.move_head = null;
      this.walk_flag = null;
      this.reset_walk = null;
      this.test_mode = null;
      this.vx = null;
      this.vy = null;
      this.vz = null;
    }
    else {
      if (initObj.hasOwnProperty('first_pose')) {
        this.first_pose = initObj.first_pose
      }
      else {
        this.first_pose = false;
      }
      if (initObj.hasOwnProperty('move_head')) {
        this.move_head = initObj.move_head
      }
      else {
        this.move_head = false;
      }
      if (initObj.hasOwnProperty('walk_flag')) {
        this.walk_flag = initObj.walk_flag
      }
      else {
        this.walk_flag = false;
      }
      if (initObj.hasOwnProperty('reset_walk')) {
        this.reset_walk = initObj.reset_walk
      }
      else {
        this.reset_walk = false;
      }
      if (initObj.hasOwnProperty('test_mode')) {
        this.test_mode = initObj.test_mode
      }
      else {
        this.test_mode = false;
      }
      if (initObj.hasOwnProperty('vx')) {
        this.vx = initObj.vx
      }
      else {
        this.vx = 0.0;
      }
      if (initObj.hasOwnProperty('vy')) {
        this.vy = initObj.vy
      }
      else {
        this.vy = 0.0;
      }
      if (initObj.hasOwnProperty('vz')) {
        this.vz = initObj.vz
      }
      else {
        this.vz = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LipCmdSrvRequest
    // Serialize message field [first_pose]
    bufferOffset = _serializer.bool(obj.first_pose, buffer, bufferOffset);
    // Serialize message field [move_head]
    bufferOffset = _serializer.bool(obj.move_head, buffer, bufferOffset);
    // Serialize message field [walk_flag]
    bufferOffset = _serializer.bool(obj.walk_flag, buffer, bufferOffset);
    // Serialize message field [reset_walk]
    bufferOffset = _serializer.bool(obj.reset_walk, buffer, bufferOffset);
    // Serialize message field [test_mode]
    bufferOffset = _serializer.bool(obj.test_mode, buffer, bufferOffset);
    // Serialize message field [vx]
    bufferOffset = _serializer.float64(obj.vx, buffer, bufferOffset);
    // Serialize message field [vy]
    bufferOffset = _serializer.float64(obj.vy, buffer, bufferOffset);
    // Serialize message field [vz]
    bufferOffset = _serializer.float64(obj.vz, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LipCmdSrvRequest
    let len;
    let data = new LipCmdSrvRequest(null);
    // Deserialize message field [first_pose]
    data.first_pose = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [move_head]
    data.move_head = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [walk_flag]
    data.walk_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [reset_walk]
    data.reset_walk = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [test_mode]
    data.test_mode = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [vx]
    data.vx = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vy]
    data.vy = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vz]
    data.vz = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 29;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/LipCmdSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4433778752b474643548f0d3ce287ab0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool    first_pose
    bool    move_head
    bool    walk_flag
    bool    reset_walk 
    bool    test_mode
    float64 vx
    float64 vy
    float64 vz
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LipCmdSrvRequest(null);
    if (msg.first_pose !== undefined) {
      resolved.first_pose = msg.first_pose;
    }
    else {
      resolved.first_pose = false
    }

    if (msg.move_head !== undefined) {
      resolved.move_head = msg.move_head;
    }
    else {
      resolved.move_head = false
    }

    if (msg.walk_flag !== undefined) {
      resolved.walk_flag = msg.walk_flag;
    }
    else {
      resolved.walk_flag = false
    }

    if (msg.reset_walk !== undefined) {
      resolved.reset_walk = msg.reset_walk;
    }
    else {
      resolved.reset_walk = false
    }

    if (msg.test_mode !== undefined) {
      resolved.test_mode = msg.test_mode;
    }
    else {
      resolved.test_mode = false
    }

    if (msg.vx !== undefined) {
      resolved.vx = msg.vx;
    }
    else {
      resolved.vx = 0.0
    }

    if (msg.vy !== undefined) {
      resolved.vy = msg.vy;
    }
    else {
      resolved.vy = 0.0
    }

    if (msg.vz !== undefined) {
      resolved.vz = msg.vz;
    }
    else {
      resolved.vz = 0.0
    }

    return resolved;
    }
};

class LipCmdSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LipCmdSrvResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LipCmdSrvResponse
    let len;
    let data = new LipCmdSrvResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/LipCmdSrvResponse';
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
    const resolved = new LipCmdSrvResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: LipCmdSrvRequest,
  Response: LipCmdSrvResponse,
  md5sum() { return '4433778752b474643548f0d3ce287ab0'; },
  datatype() { return 'movement_msgs/LipCmdSrv'; }
};
