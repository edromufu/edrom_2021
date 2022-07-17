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

class IDMapMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.map = null;
      this.jNames = null;
      this.robotDOF = null;
      this.urdfDOF = null;
      this.ikDOF = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('map')) {
        this.map = initObj.map
      }
      else {
        this.map = new std_msgs.msg.Int32MultiArray();
      }
      if (initObj.hasOwnProperty('jNames')) {
        this.jNames = initObj.jNames
      }
      else {
        this.jNames = [];
      }
      if (initObj.hasOwnProperty('robotDOF')) {
        this.robotDOF = initObj.robotDOF
      }
      else {
        this.robotDOF = 0;
      }
      if (initObj.hasOwnProperty('urdfDOF')) {
        this.urdfDOF = initObj.urdfDOF
      }
      else {
        this.urdfDOF = 0;
      }
      if (initObj.hasOwnProperty('ikDOF')) {
        this.ikDOF = initObj.ikDOF
      }
      else {
        this.ikDOF = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type IDMapMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [map]
    bufferOffset = std_msgs.msg.Int32MultiArray.serialize(obj.map, buffer, bufferOffset);
    // Serialize message field [jNames]
    bufferOffset = _arraySerializer.string(obj.jNames, buffer, bufferOffset, null);
    // Serialize message field [robotDOF]
    bufferOffset = _serializer.int32(obj.robotDOF, buffer, bufferOffset);
    // Serialize message field [urdfDOF]
    bufferOffset = _serializer.int32(obj.urdfDOF, buffer, bufferOffset);
    // Serialize message field [ikDOF]
    bufferOffset = _serializer.int32(obj.ikDOF, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type IDMapMsg
    let len;
    let data = new IDMapMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [map]
    data.map = std_msgs.msg.Int32MultiArray.deserialize(buffer, bufferOffset);
    // Deserialize message field [jNames]
    data.jNames = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [robotDOF]
    data.robotDOF = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [urdfDOF]
    data.urdfDOF = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [ikDOF]
    data.ikDOF = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += std_msgs.msg.Int32MultiArray.getMessageSize(object.map);
    object.jNames.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/IDMapMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1d05c13180a22938616df56def75e013';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new IDMapMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.map !== undefined) {
      resolved.map = std_msgs.msg.Int32MultiArray.Resolve(msg.map)
    }
    else {
      resolved.map = new std_msgs.msg.Int32MultiArray()
    }

    if (msg.jNames !== undefined) {
      resolved.jNames = msg.jNames;
    }
    else {
      resolved.jNames = []
    }

    if (msg.robotDOF !== undefined) {
      resolved.robotDOF = msg.robotDOF;
    }
    else {
      resolved.robotDOF = 0
    }

    if (msg.urdfDOF !== undefined) {
      resolved.urdfDOF = msg.urdfDOF;
    }
    else {
      resolved.urdfDOF = 0
    }

    if (msg.ikDOF !== undefined) {
      resolved.ikDOF = msg.ikDOF;
    }
    else {
      resolved.ikDOF = 0
    }

    return resolved;
    }
};

module.exports = IDMapMsg;
