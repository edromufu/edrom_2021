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

class HumanoidPropertiesMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.squat = null;
      this.open = null;
      this.incl = null;
      this.sideIncl = null;
      this.footIncl = null;
      this.zmpPoint = null;
      this.comPoint = null;
      this.footComPoint = null;
      this.torq = null;
    }
    else {
      if (initObj.hasOwnProperty('squat')) {
        this.squat = initObj.squat
      }
      else {
        this.squat = 0.0;
      }
      if (initObj.hasOwnProperty('open')) {
        this.open = initObj.open
      }
      else {
        this.open = 0.0;
      }
      if (initObj.hasOwnProperty('incl')) {
        this.incl = initObj.incl
      }
      else {
        this.incl = 0.0;
      }
      if (initObj.hasOwnProperty('sideIncl')) {
        this.sideIncl = initObj.sideIncl
      }
      else {
        this.sideIncl = 0.0;
      }
      if (initObj.hasOwnProperty('footIncl')) {
        this.footIncl = initObj.footIncl
      }
      else {
        this.footIncl = 0.0;
      }
      if (initObj.hasOwnProperty('zmpPoint')) {
        this.zmpPoint = initObj.zmpPoint
      }
      else {
        this.zmpPoint = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('comPoint')) {
        this.comPoint = initObj.comPoint
      }
      else {
        this.comPoint = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('footComPoint')) {
        this.footComPoint = initObj.footComPoint
      }
      else {
        this.footComPoint = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('torq')) {
        this.torq = initObj.torq
      }
      else {
        this.torq = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HumanoidPropertiesMsg
    // Serialize message field [squat]
    bufferOffset = _serializer.float64(obj.squat, buffer, bufferOffset);
    // Serialize message field [open]
    bufferOffset = _serializer.float64(obj.open, buffer, bufferOffset);
    // Serialize message field [incl]
    bufferOffset = _serializer.float64(obj.incl, buffer, bufferOffset);
    // Serialize message field [sideIncl]
    bufferOffset = _serializer.float64(obj.sideIncl, buffer, bufferOffset);
    // Serialize message field [footIncl]
    bufferOffset = _serializer.float64(obj.footIncl, buffer, bufferOffset);
    // Serialize message field [zmpPoint]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.zmpPoint, buffer, bufferOffset);
    // Serialize message field [comPoint]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.comPoint, buffer, bufferOffset);
    // Serialize message field [footComPoint]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.footComPoint, buffer, bufferOffset);
    // Serialize message field [torq]
    bufferOffset = _arraySerializer.float64(obj.torq, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HumanoidPropertiesMsg
    let len;
    let data = new HumanoidPropertiesMsg(null);
    // Deserialize message field [squat]
    data.squat = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [open]
    data.open = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [incl]
    data.incl = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sideIncl]
    data.sideIncl = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [footIncl]
    data.footIncl = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [zmpPoint]
    data.zmpPoint = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [comPoint]
    data.comPoint = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [footComPoint]
    data.footComPoint = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [torq]
    data.torq = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.torq.length;
    return length + 116;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/HumanoidPropertiesMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ed5d141b03975d3cb4615c633a218029';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64               squat
    float64               open
    float64               incl
    float64               sideIncl
    float64               footIncl
    geometry_msgs/Point  zmpPoint
    geometry_msgs/Point  comPoint
    geometry_msgs/Point  footComPoint
    float64[]            torq
    
    
    
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
    const resolved = new HumanoidPropertiesMsg(null);
    if (msg.squat !== undefined) {
      resolved.squat = msg.squat;
    }
    else {
      resolved.squat = 0.0
    }

    if (msg.open !== undefined) {
      resolved.open = msg.open;
    }
    else {
      resolved.open = 0.0
    }

    if (msg.incl !== undefined) {
      resolved.incl = msg.incl;
    }
    else {
      resolved.incl = 0.0
    }

    if (msg.sideIncl !== undefined) {
      resolved.sideIncl = msg.sideIncl;
    }
    else {
      resolved.sideIncl = 0.0
    }

    if (msg.footIncl !== undefined) {
      resolved.footIncl = msg.footIncl;
    }
    else {
      resolved.footIncl = 0.0
    }

    if (msg.zmpPoint !== undefined) {
      resolved.zmpPoint = geometry_msgs.msg.Point.Resolve(msg.zmpPoint)
    }
    else {
      resolved.zmpPoint = new geometry_msgs.msg.Point()
    }

    if (msg.comPoint !== undefined) {
      resolved.comPoint = geometry_msgs.msg.Point.Resolve(msg.comPoint)
    }
    else {
      resolved.comPoint = new geometry_msgs.msg.Point()
    }

    if (msg.footComPoint !== undefined) {
      resolved.footComPoint = geometry_msgs.msg.Point.Resolve(msg.footComPoint)
    }
    else {
      resolved.footComPoint = new geometry_msgs.msg.Point()
    }

    if (msg.torq !== undefined) {
      resolved.torq = msg.torq;
    }
    else {
      resolved.torq = []
    }

    return resolved;
    }
};

module.exports = HumanoidPropertiesMsg;
