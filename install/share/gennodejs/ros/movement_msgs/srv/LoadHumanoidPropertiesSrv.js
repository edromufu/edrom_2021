// Auto-generated. Do not edit!

// (in-package movement_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let JointStateMsg = require('../msg/JointStateMsg.js');
let EndEffStateMsg = require('../msg/EndEffStateMsg.js');
let std_msgs = _finder('std_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class LoadHumanoidPropertiesSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.joint = null;
      this.endEff = null;
      this.ikRef = null;
      this.calcZMP = null;
      this.calcCOM = null;
      this.calcInvDyn = null;
      this.setIkRef = null;
      this.setComAsIkRef = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('joint')) {
        this.joint = initObj.joint
      }
      else {
        this.joint = new JointStateMsg();
      }
      if (initObj.hasOwnProperty('endEff')) {
        this.endEff = initObj.endEff
      }
      else {
        this.endEff = new EndEffStateMsg();
      }
      if (initObj.hasOwnProperty('ikRef')) {
        this.ikRef = initObj.ikRef
      }
      else {
        this.ikRef = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('calcZMP')) {
        this.calcZMP = initObj.calcZMP
      }
      else {
        this.calcZMP = false;
      }
      if (initObj.hasOwnProperty('calcCOM')) {
        this.calcCOM = initObj.calcCOM
      }
      else {
        this.calcCOM = false;
      }
      if (initObj.hasOwnProperty('calcInvDyn')) {
        this.calcInvDyn = initObj.calcInvDyn
      }
      else {
        this.calcInvDyn = false;
      }
      if (initObj.hasOwnProperty('setIkRef')) {
        this.setIkRef = initObj.setIkRef
      }
      else {
        this.setIkRef = false;
      }
      if (initObj.hasOwnProperty('setComAsIkRef')) {
        this.setComAsIkRef = initObj.setComAsIkRef
      }
      else {
        this.setComAsIkRef = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LoadHumanoidPropertiesSrvRequest
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [joint]
    bufferOffset = JointStateMsg.serialize(obj.joint, buffer, bufferOffset);
    // Serialize message field [endEff]
    bufferOffset = EndEffStateMsg.serialize(obj.endEff, buffer, bufferOffset);
    // Serialize message field [ikRef]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.ikRef, buffer, bufferOffset);
    // Serialize message field [calcZMP]
    bufferOffset = _serializer.bool(obj.calcZMP, buffer, bufferOffset);
    // Serialize message field [calcCOM]
    bufferOffset = _serializer.bool(obj.calcCOM, buffer, bufferOffset);
    // Serialize message field [calcInvDyn]
    bufferOffset = _serializer.bool(obj.calcInvDyn, buffer, bufferOffset);
    // Serialize message field [setIkRef]
    bufferOffset = _serializer.bool(obj.setIkRef, buffer, bufferOffset);
    // Serialize message field [setComAsIkRef]
    bufferOffset = _serializer.bool(obj.setComAsIkRef, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LoadHumanoidPropertiesSrvRequest
    let len;
    let data = new LoadHumanoidPropertiesSrvRequest(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [joint]
    data.joint = JointStateMsg.deserialize(buffer, bufferOffset);
    // Deserialize message field [endEff]
    data.endEff = EndEffStateMsg.deserialize(buffer, bufferOffset);
    // Deserialize message field [ikRef]
    data.ikRef = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [calcZMP]
    data.calcZMP = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [calcCOM]
    data.calcCOM = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [calcInvDyn]
    data.calcInvDyn = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [setIkRef]
    data.setIkRef = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [setComAsIkRef]
    data.setComAsIkRef = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += JointStateMsg.getMessageSize(object.joint);
    length += EndEffStateMsg.getMessageSize(object.endEff);
    return length + 29;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/LoadHumanoidPropertiesSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1843db99d8df7f28f948fe93eedb228a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header                       header
    movement_msgs/JointStateMsg  joint
    movement_msgs/EndEffStateMsg endEff
    geometry_msgs/Point          ikRef
    
    bool                         calcZMP
    bool                         calcCOM
    bool                         calcInvDyn
    bool                         setIkRef
    bool                         setComAsIkRef
    
    
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
    MSG: movement_msgs/EndEffStateMsg
    Header                     header
    movement_msgs/EndEffMsg[]  endEff
    
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
    const resolved = new LoadHumanoidPropertiesSrvRequest(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.joint !== undefined) {
      resolved.joint = JointStateMsg.Resolve(msg.joint)
    }
    else {
      resolved.joint = new JointStateMsg()
    }

    if (msg.endEff !== undefined) {
      resolved.endEff = EndEffStateMsg.Resolve(msg.endEff)
    }
    else {
      resolved.endEff = new EndEffStateMsg()
    }

    if (msg.ikRef !== undefined) {
      resolved.ikRef = geometry_msgs.msg.Point.Resolve(msg.ikRef)
    }
    else {
      resolved.ikRef = new geometry_msgs.msg.Point()
    }

    if (msg.calcZMP !== undefined) {
      resolved.calcZMP = msg.calcZMP;
    }
    else {
      resolved.calcZMP = false
    }

    if (msg.calcCOM !== undefined) {
      resolved.calcCOM = msg.calcCOM;
    }
    else {
      resolved.calcCOM = false
    }

    if (msg.calcInvDyn !== undefined) {
      resolved.calcInvDyn = msg.calcInvDyn;
    }
    else {
      resolved.calcInvDyn = false
    }

    if (msg.setIkRef !== undefined) {
      resolved.setIkRef = msg.setIkRef;
    }
    else {
      resolved.setIkRef = false
    }

    if (msg.setComAsIkRef !== undefined) {
      resolved.setComAsIkRef = msg.setComAsIkRef;
    }
    else {
      resolved.setComAsIkRef = false
    }

    return resolved;
    }
};

class LoadHumanoidPropertiesSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.zmpPoint = null;
      this.comPoint = null;
      this.footComPoint = null;
      this.torq = null;
    }
    else {
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
    // Serializes a message object of type LoadHumanoidPropertiesSrvResponse
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
    //deserializes a message object of type LoadHumanoidPropertiesSrvResponse
    let len;
    let data = new LoadHumanoidPropertiesSrvResponse(null);
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
    return length + 76;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/LoadHumanoidPropertiesSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a7a33232467fc746c475c5575da5109a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
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
    const resolved = new LoadHumanoidPropertiesSrvResponse(null);
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

module.exports = {
  Request: LoadHumanoidPropertiesSrvRequest,
  Response: LoadHumanoidPropertiesSrvResponse,
  md5sum() { return '3e2b196ffde962aa21d86738ea07bc83'; },
  datatype() { return 'movement_msgs/LoadHumanoidPropertiesSrv'; }
};
