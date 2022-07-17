// Auto-generated. Do not edit!

// (in-package movement_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

let IDMapMsg = require('../msg/IDMapMsg.js');

//-----------------------------------------------------------

class LoadMapConfigsSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.fEnum = null;
      this.fRobot = null;
      this.fUrdf = null;
      this.fIk = null;
      this.update = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('fEnum')) {
        this.fEnum = initObj.fEnum
      }
      else {
        this.fEnum = '';
      }
      if (initObj.hasOwnProperty('fRobot')) {
        this.fRobot = initObj.fRobot
      }
      else {
        this.fRobot = '';
      }
      if (initObj.hasOwnProperty('fUrdf')) {
        this.fUrdf = initObj.fUrdf
      }
      else {
        this.fUrdf = '';
      }
      if (initObj.hasOwnProperty('fIk')) {
        this.fIk = initObj.fIk
      }
      else {
        this.fIk = '';
      }
      if (initObj.hasOwnProperty('update')) {
        this.update = initObj.update
      }
      else {
        this.update = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LoadMapConfigsSrvRequest
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [fEnum]
    bufferOffset = _serializer.string(obj.fEnum, buffer, bufferOffset);
    // Serialize message field [fRobot]
    bufferOffset = _serializer.string(obj.fRobot, buffer, bufferOffset);
    // Serialize message field [fUrdf]
    bufferOffset = _serializer.string(obj.fUrdf, buffer, bufferOffset);
    // Serialize message field [fIk]
    bufferOffset = _serializer.string(obj.fIk, buffer, bufferOffset);
    // Serialize message field [update]
    bufferOffset = _serializer.bool(obj.update, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LoadMapConfigsSrvRequest
    let len;
    let data = new LoadMapConfigsSrvRequest(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [fEnum]
    data.fEnum = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [fRobot]
    data.fRobot = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [fUrdf]
    data.fUrdf = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [fIk]
    data.fIk = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [update]
    data.update = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.fEnum);
    length += _getByteLength(object.fRobot);
    length += _getByteLength(object.fUrdf);
    length += _getByteLength(object.fIk);
    return length + 17;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/LoadMapConfigsSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '87df5d2fa1bb2cecad32bfb2cadd2eb6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    string fEnum
    string fRobot
    string fUrdf
    string fIk
    bool   update
    
    
    
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
    const resolved = new LoadMapConfigsSrvRequest(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.fEnum !== undefined) {
      resolved.fEnum = msg.fEnum;
    }
    else {
      resolved.fEnum = ''
    }

    if (msg.fRobot !== undefined) {
      resolved.fRobot = msg.fRobot;
    }
    else {
      resolved.fRobot = ''
    }

    if (msg.fUrdf !== undefined) {
      resolved.fUrdf = msg.fUrdf;
    }
    else {
      resolved.fUrdf = ''
    }

    if (msg.fIk !== undefined) {
      resolved.fIk = msg.fIk;
    }
    else {
      resolved.fIk = ''
    }

    if (msg.update !== undefined) {
      resolved.update = msg.update;
    }
    else {
      resolved.update = false
    }

    return resolved;
    }
};

class LoadMapConfigsSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.idMap = null;
    }
    else {
      if (initObj.hasOwnProperty('idMap')) {
        this.idMap = initObj.idMap
      }
      else {
        this.idMap = new IDMapMsg();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LoadMapConfigsSrvResponse
    // Serialize message field [idMap]
    bufferOffset = IDMapMsg.serialize(obj.idMap, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LoadMapConfigsSrvResponse
    let len;
    let data = new LoadMapConfigsSrvResponse(null);
    // Deserialize message field [idMap]
    data.idMap = IDMapMsg.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += IDMapMsg.getMessageSize(object.idMap);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_msgs/LoadMapConfigsSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '23b63436cd0e468319455113fa36e5ec';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    movement_msgs/IDMapMsg  idMap
    
    
    
    ================================================================================
    MSG: movement_msgs/IDMapMsg
    Header                    header
    std_msgs/Int32MultiArray  map
    string[]                  jNames
    int32                     robotDOF
    int32                     urdfDOF
    int32                     ikDOF
    
    
    
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
    MSG: std_msgs/Int32MultiArray
    # Please look at the MultiArrayLayout message definition for
    # documentation on all multiarrays.
    
    MultiArrayLayout  layout        # specification of data layout
    int32[]           data          # array of data
    
    
    ================================================================================
    MSG: std_msgs/MultiArrayLayout
    # The multiarray declares a generic multi-dimensional array of a
    # particular data type.  Dimensions are ordered from outer most
    # to inner most.
    
    MultiArrayDimension[] dim # Array of dimension properties
    uint32 data_offset        # padding elements at front of data
    
    # Accessors should ALWAYS be written in terms of dimension stride
    # and specified outer-most dimension first.
    # 
    # multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
    #
    # A standard, 3-channel 640x480 image with interleaved color channels
    # would be specified as:
    #
    # dim[0].label  = "height"
    # dim[0].size   = 480
    # dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
    # dim[1].label  = "width"
    # dim[1].size   = 640
    # dim[1].stride = 3*640 = 1920
    # dim[2].label  = "channel"
    # dim[2].size   = 3
    # dim[2].stride = 3
    #
    # multiarray(i,j,k) refers to the ith row, jth column, and kth channel.
    
    ================================================================================
    MSG: std_msgs/MultiArrayDimension
    string label   # label of given dimension
    uint32 size    # size of given dimension (in type units)
    uint32 stride  # stride of given dimension
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LoadMapConfigsSrvResponse(null);
    if (msg.idMap !== undefined) {
      resolved.idMap = IDMapMsg.Resolve(msg.idMap)
    }
    else {
      resolved.idMap = new IDMapMsg()
    }

    return resolved;
    }
};

module.exports = {
  Request: LoadMapConfigsSrvRequest,
  Response: LoadMapConfigsSrvResponse,
  md5sum() { return '90c8e8e79a383c29a071f7abd2119ce5'; },
  datatype() { return 'movement_msgs/LoadMapConfigsSrv'; }
};
