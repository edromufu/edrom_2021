// Auto-generated. Do not edit!

// (in-package movement_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class EndEffMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pos = null;
      this.vel = null;
      this.acc = null;
      this.rot = null;
      this.type = null;
      this.flag = null;
      this.dt = null;
    }
    else {
      if (initObj.hasOwnProperty('pos')) {
        this.pos = initObj.pos
      }
      else {
        this.pos = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('vel')) {
        this.vel = initObj.vel
      }
      else {
        this.vel = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('acc')) {
        this.acc = initObj.acc
      }
      else {
        this.acc = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('rot')) {
        this.rot = initObj.rot
      }
      else {
        this.rot = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('flag')) {
        this.flag = initObj.flag
      }
      else {
        this.flag = 0;
      }
      if (initObj.hasOwnProperty('dt')) {
        this.dt = initObj.dt
      }
      else {
        this.dt = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EndEffMsg
    // Serialize message field [pos]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.pos, buffer, bufferOffset);
    // Serialize message field [vel]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.vel, buffer, bufferOffset);
    // Serialize message field [acc]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.acc, buffer, bufferOffset);
    // Serialize message field [rot]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.rot, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.int32(obj.type, buffer, bufferOffset);
    // Serialize message field [flag]
    bufferOffset = _serializer.int32(obj.flag, buffer, bufferOffset);
    // Serialize message field [dt]
    bufferOffset = _serializer.float64(obj.dt, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EndEffMsg
    let len;
    let data = new EndEffMsg(null);
    // Deserialize message field [pos]
    data.pos = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [vel]
    data.vel = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [acc]
    data.acc = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [rot]
    data.rot = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [flag]
    data.flag = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dt]
    data.dt = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 112;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/EndEffMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '25f406f2d522d107819391a084c12896';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point  pos
    geometry_msgs/Point  vel
    geometry_msgs/Point  acc
    geometry_msgs/Point  rot
    int32                type
    int32                flag
    float64              dt
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EndEffMsg(null);
    if (msg.pos !== undefined) {
      resolved.pos = geometry_msgs.msg.Point.Resolve(msg.pos)
    }
    else {
      resolved.pos = new geometry_msgs.msg.Point()
    }

    if (msg.vel !== undefined) {
      resolved.vel = geometry_msgs.msg.Point.Resolve(msg.vel)
    }
    else {
      resolved.vel = new geometry_msgs.msg.Point()
    }

    if (msg.acc !== undefined) {
      resolved.acc = geometry_msgs.msg.Point.Resolve(msg.acc)
    }
    else {
      resolved.acc = new geometry_msgs.msg.Point()
    }

    if (msg.rot !== undefined) {
      resolved.rot = geometry_msgs.msg.Point.Resolve(msg.rot)
    }
    else {
      resolved.rot = new geometry_msgs.msg.Point()
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.flag !== undefined) {
      resolved.flag = msg.flag;
    }
    else {
      resolved.flag = 0
    }

    if (msg.dt !== undefined) {
      resolved.dt = msg.dt;
    }
    else {
      resolved.dt = 0.0
    }

    return resolved;
    }
};

module.exports = EndEffMsg;
