// Auto-generated. Do not edit!

// (in-package movement_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let EndEffMsg = require('./EndEffMsg.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class EndEffStateMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.endEff = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('endEff')) {
        this.endEff = initObj.endEff
      }
      else {
        this.endEff = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EndEffStateMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [endEff]
    // Serialize the length for message field [endEff]
    bufferOffset = _serializer.uint32(obj.endEff.length, buffer, bufferOffset);
    obj.endEff.forEach((val) => {
      bufferOffset = EndEffMsg.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EndEffStateMsg
    let len;
    let data = new EndEffStateMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [endEff]
    // Deserialize array length for message field [endEff]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.endEff = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.endEff[i] = EndEffMsg.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 112 * object.endEff.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/EndEffStateMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '62edf4d89ed16d8d1d54b58ace855e91';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header                     header
    movement_msgs/EndEffMsg[]  endEff
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: movement_msgs/EndEffMsg
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
    const resolved = new EndEffStateMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.endEff !== undefined) {
      resolved.endEff = new Array(msg.endEff.length);
      for (let i = 0; i < resolved.endEff.length; ++i) {
        resolved.endEff[i] = EndEffMsg.Resolve(msg.endEff[i]);
      }
    }
    else {
      resolved.endEff = []
    }

    return resolved;
    }
};

module.exports = EndEffStateMsg;
