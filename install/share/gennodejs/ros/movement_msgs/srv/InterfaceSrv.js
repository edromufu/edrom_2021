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

let JointStateMsg = require('../msg/JointStateMsg.js');
let MotorPIDMsg = require('../msg/MotorPIDMsg.js');

//-----------------------------------------------------------

class InterfaceSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.toGazebo = null;
      this.toRobot = null;
      this.scanMotors = null;
      this.getPID = null;
      this.getMotorPos = null;
      this.send2Motor = null;
      this.setTorque = null;
      this.motorIds = null;
      this.fall = null;
      this.ping = null;
    }
    else {
      if (initObj.hasOwnProperty('toGazebo')) {
        this.toGazebo = initObj.toGazebo
      }
      else {
        this.toGazebo = false;
      }
      if (initObj.hasOwnProperty('toRobot')) {
        this.toRobot = initObj.toRobot
      }
      else {
        this.toRobot = false;
      }
      if (initObj.hasOwnProperty('scanMotors')) {
        this.scanMotors = initObj.scanMotors
      }
      else {
        this.scanMotors = false;
      }
      if (initObj.hasOwnProperty('getPID')) {
        this.getPID = initObj.getPID
      }
      else {
        this.getPID = false;
      }
      if (initObj.hasOwnProperty('getMotorPos')) {
        this.getMotorPos = initObj.getMotorPos
      }
      else {
        this.getMotorPos = false;
      }
      if (initObj.hasOwnProperty('send2Motor')) {
        this.send2Motor = initObj.send2Motor
      }
      else {
        this.send2Motor = false;
      }
      if (initObj.hasOwnProperty('setTorque')) {
        this.setTorque = initObj.setTorque
      }
      else {
        this.setTorque = [];
      }
      if (initObj.hasOwnProperty('motorIds')) {
        this.motorIds = initObj.motorIds
      }
      else {
        this.motorIds = 0;
      }
      if (initObj.hasOwnProperty('fall')) {
        this.fall = initObj.fall
      }
      else {
        this.fall = false;
      }
      if (initObj.hasOwnProperty('ping')) {
        this.ping = initObj.ping
      }
      else {
        this.ping = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type InterfaceSrvRequest
    // Serialize message field [toGazebo]
    bufferOffset = _serializer.bool(obj.toGazebo, buffer, bufferOffset);
    // Serialize message field [toRobot]
    bufferOffset = _serializer.bool(obj.toRobot, buffer, bufferOffset);
    // Serialize message field [scanMotors]
    bufferOffset = _serializer.bool(obj.scanMotors, buffer, bufferOffset);
    // Serialize message field [getPID]
    bufferOffset = _serializer.bool(obj.getPID, buffer, bufferOffset);
    // Serialize message field [getMotorPos]
    bufferOffset = _serializer.bool(obj.getMotorPos, buffer, bufferOffset);
    // Serialize message field [send2Motor]
    bufferOffset = _serializer.bool(obj.send2Motor, buffer, bufferOffset);
    // Serialize message field [setTorque]
    bufferOffset = _arraySerializer.bool(obj.setTorque, buffer, bufferOffset, null);
    // Serialize message field [motorIds]
    bufferOffset = _serializer.int16(obj.motorIds, buffer, bufferOffset);
    // Serialize message field [fall]
    bufferOffset = _serializer.bool(obj.fall, buffer, bufferOffset);
    // Serialize message field [ping]
    bufferOffset = _serializer.bool(obj.ping, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type InterfaceSrvRequest
    let len;
    let data = new InterfaceSrvRequest(null);
    // Deserialize message field [toGazebo]
    data.toGazebo = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [toRobot]
    data.toRobot = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [scanMotors]
    data.scanMotors = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [getPID]
    data.getPID = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [getMotorPos]
    data.getMotorPos = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [send2Motor]
    data.send2Motor = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [setTorque]
    data.setTorque = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [motorIds]
    data.motorIds = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [fall]
    data.fall = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [ping]
    data.ping = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.setTorque.length;
    return length + 14;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/InterfaceSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dd5045c9a9c8191cda69ed2ec4c1a725';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool toGazebo
    bool toRobot
    bool scanMotors
    bool getPID
    bool getMotorPos
    bool send2Motor
    bool[] setTorque
    int16  motorIds
    bool fall
    bool ping
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new InterfaceSrvRequest(null);
    if (msg.toGazebo !== undefined) {
      resolved.toGazebo = msg.toGazebo;
    }
    else {
      resolved.toGazebo = false
    }

    if (msg.toRobot !== undefined) {
      resolved.toRobot = msg.toRobot;
    }
    else {
      resolved.toRobot = false
    }

    if (msg.scanMotors !== undefined) {
      resolved.scanMotors = msg.scanMotors;
    }
    else {
      resolved.scanMotors = false
    }

    if (msg.getPID !== undefined) {
      resolved.getPID = msg.getPID;
    }
    else {
      resolved.getPID = false
    }

    if (msg.getMotorPos !== undefined) {
      resolved.getMotorPos = msg.getMotorPos;
    }
    else {
      resolved.getMotorPos = false
    }

    if (msg.send2Motor !== undefined) {
      resolved.send2Motor = msg.send2Motor;
    }
    else {
      resolved.send2Motor = false
    }

    if (msg.setTorque !== undefined) {
      resolved.setTorque = msg.setTorque;
    }
    else {
      resolved.setTorque = []
    }

    if (msg.motorIds !== undefined) {
      resolved.motorIds = msg.motorIds;
    }
    else {
      resolved.motorIds = 0
    }

    if (msg.fall !== undefined) {
      resolved.fall = msg.fall;
    }
    else {
      resolved.fall = false
    }

    if (msg.ping !== undefined) {
      resolved.ping = msg.ping;
    }
    else {
      resolved.ping = false
    }

    return resolved;
    }
};

class InterfaceSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motorState = null;
      this.motorPID = null;
      this.ids = null;
    }
    else {
      if (initObj.hasOwnProperty('motorState')) {
        this.motorState = initObj.motorState
      }
      else {
        this.motorState = new JointStateMsg();
      }
      if (initObj.hasOwnProperty('motorPID')) {
        this.motorPID = initObj.motorPID
      }
      else {
        this.motorPID = new MotorPIDMsg();
      }
      if (initObj.hasOwnProperty('ids')) {
        this.ids = initObj.ids
      }
      else {
        this.ids = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type InterfaceSrvResponse
    // Serialize message field [motorState]
    bufferOffset = JointStateMsg.serialize(obj.motorState, buffer, bufferOffset);
    // Serialize message field [motorPID]
    bufferOffset = MotorPIDMsg.serialize(obj.motorPID, buffer, bufferOffset);
    // Serialize message field [ids]
    bufferOffset = _arraySerializer.int16(obj.ids, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type InterfaceSrvResponse
    let len;
    let data = new InterfaceSrvResponse(null);
    // Deserialize message field [motorState]
    data.motorState = JointStateMsg.deserialize(buffer, bufferOffset);
    // Deserialize message field [motorPID]
    data.motorPID = MotorPIDMsg.deserialize(buffer, bufferOffset);
    // Deserialize message field [ids]
    data.ids = _arrayDeserializer.int16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += JointStateMsg.getMessageSize(object.motorState);
    length += MotorPIDMsg.getMessageSize(object.motorPID);
    length += 2 * object.ids.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/InterfaceSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9f6a712565425d1f45ef42e77c1863fd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    movement_msgs/JointStateMsg motorState
    movement_msgs/MotorPIDMsg   motorPID
    int16[]                     ids
    
    
    ================================================================================
    MSG: movement_msgs/JointStateMsg
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
    
    ================================================================================
    MSG: movement_msgs/MotorPIDMsg
    float64[]       kp
    float64[]       ki
    float64[]       kd
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new InterfaceSrvResponse(null);
    if (msg.motorState !== undefined) {
      resolved.motorState = JointStateMsg.Resolve(msg.motorState)
    }
    else {
      resolved.motorState = new JointStateMsg()
    }

    if (msg.motorPID !== undefined) {
      resolved.motorPID = MotorPIDMsg.Resolve(msg.motorPID)
    }
    else {
      resolved.motorPID = new MotorPIDMsg()
    }

    if (msg.ids !== undefined) {
      resolved.ids = msg.ids;
    }
    else {
      resolved.ids = []
    }

    return resolved;
    }
};

module.exports = {
  Request: InterfaceSrvRequest,
  Response: InterfaceSrvResponse,
  md5sum() { return 'df2744d447a21ef2bc8fc6392375798f'; },
  datatype() { return 'movement_msgs/InterfaceSrv'; }
};
