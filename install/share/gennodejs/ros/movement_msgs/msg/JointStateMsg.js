// Auto-generated. Do not edit!

// (in-package movement_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class JointStateMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.pos = null;
      this.vel = null;
      this.acc = null;
      this.torq = null;
      this.writeCommand = null;
      this.kind = null;
      this.readCommand = null;
      this.type = null;
      this.source = null;
      this.dt = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('pos')) {
        this.pos = initObj.pos
      }
      else {
        this.pos = [];
      }
      if (initObj.hasOwnProperty('vel')) {
        this.vel = initObj.vel
      }
      else {
        this.vel = [];
      }
      if (initObj.hasOwnProperty('acc')) {
        this.acc = initObj.acc
      }
      else {
        this.acc = [];
      }
      if (initObj.hasOwnProperty('torq')) {
        this.torq = initObj.torq
      }
      else {
        this.torq = [];
      }
      if (initObj.hasOwnProperty('writeCommand')) {
        this.writeCommand = initObj.writeCommand
      }
      else {
        this.writeCommand = '';
      }
      if (initObj.hasOwnProperty('kind')) {
        this.kind = initObj.kind
      }
      else {
        this.kind = '';
      }
      if (initObj.hasOwnProperty('readCommand')) {
        this.readCommand = initObj.readCommand
      }
      else {
        this.readCommand = '';
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('source')) {
        this.source = initObj.source
      }
      else {
        this.source = 0;
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
    // Serializes a message object of type JointStateMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [pos]
    bufferOffset = _arraySerializer.float64(obj.pos, buffer, bufferOffset, null);
    // Serialize message field [vel]
    bufferOffset = _arraySerializer.float64(obj.vel, buffer, bufferOffset, null);
    // Serialize message field [acc]
    bufferOffset = _arraySerializer.float64(obj.acc, buffer, bufferOffset, null);
    // Serialize message field [torq]
    bufferOffset = _arraySerializer.float64(obj.torq, buffer, bufferOffset, null);
    // Serialize message field [writeCommand]
    bufferOffset = _serializer.string(obj.writeCommand, buffer, bufferOffset);
    // Serialize message field [kind]
    bufferOffset = _serializer.string(obj.kind, buffer, bufferOffset);
    // Serialize message field [readCommand]
    bufferOffset = _serializer.string(obj.readCommand, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.int32(obj.type, buffer, bufferOffset);
    // Serialize message field [source]
    bufferOffset = _serializer.int32(obj.source, buffer, bufferOffset);
    // Serialize message field [dt]
    bufferOffset = _serializer.float64(obj.dt, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointStateMsg
    let len;
    let data = new JointStateMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [pos]
    data.pos = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [vel]
    data.vel = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [acc]
    data.acc = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [torq]
    data.torq = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [writeCommand]
    data.writeCommand = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [kind]
    data.kind = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [readCommand]
    data.readCommand = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [source]
    data.source = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dt]
    data.dt = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 8 * object.pos.length;
    length += 8 * object.vel.length;
    length += 8 * object.acc.length;
    length += 8 * object.torq.length;
    length += _getByteLength(object.writeCommand);
    length += _getByteLength(object.kind);
    length += _getByteLength(object.readCommand);
    return length + 44;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/JointStateMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd7972f556d5c14278ff625e52fac2b86';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header    header
    float64[] pos
    float64[] vel
    float64[] acc
    float64[] torq
    string  writeCommand
    string        kind
    string        readCommand
    int32         type
    int32         source
    float64       dt
    
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JointStateMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.pos !== undefined) {
      resolved.pos = msg.pos;
    }
    else {
      resolved.pos = []
    }

    if (msg.vel !== undefined) {
      resolved.vel = msg.vel;
    }
    else {
      resolved.vel = []
    }

    if (msg.acc !== undefined) {
      resolved.acc = msg.acc;
    }
    else {
      resolved.acc = []
    }

    if (msg.torq !== undefined) {
      resolved.torq = msg.torq;
    }
    else {
      resolved.torq = []
    }

    if (msg.writeCommand !== undefined) {
      resolved.writeCommand = msg.writeCommand;
    }
    else {
      resolved.writeCommand = ''
    }

    if (msg.kind !== undefined) {
      resolved.kind = msg.kind;
    }
    else {
      resolved.kind = ''
    }

    if (msg.readCommand !== undefined) {
      resolved.readCommand = msg.readCommand;
    }
    else {
      resolved.readCommand = ''
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.source !== undefined) {
      resolved.source = msg.source;
    }
    else {
      resolved.source = 0
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

module.exports = JointStateMsg;
