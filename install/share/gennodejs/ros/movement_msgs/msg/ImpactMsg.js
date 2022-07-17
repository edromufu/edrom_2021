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

class ImpactMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.torque3 = null;
      this.torque4 = null;
      this.torqueF = null;
      this.force = null;
      this.gyroX = null;
      this.gyroY = null;
      this.gyroZ = null;
      this.accX = null;
      this.accY = null;
      this.accZ = null;
      this.angX = null;
      this.angY = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('torque3')) {
        this.torque3 = initObj.torque3
      }
      else {
        this.torque3 = [];
      }
      if (initObj.hasOwnProperty('torque4')) {
        this.torque4 = initObj.torque4
      }
      else {
        this.torque4 = [];
      }
      if (initObj.hasOwnProperty('torqueF')) {
        this.torqueF = initObj.torqueF
      }
      else {
        this.torqueF = [];
      }
      if (initObj.hasOwnProperty('force')) {
        this.force = initObj.force
      }
      else {
        this.force = [];
      }
      if (initObj.hasOwnProperty('gyroX')) {
        this.gyroX = initObj.gyroX
      }
      else {
        this.gyroX = [];
      }
      if (initObj.hasOwnProperty('gyroY')) {
        this.gyroY = initObj.gyroY
      }
      else {
        this.gyroY = [];
      }
      if (initObj.hasOwnProperty('gyroZ')) {
        this.gyroZ = initObj.gyroZ
      }
      else {
        this.gyroZ = [];
      }
      if (initObj.hasOwnProperty('accX')) {
        this.accX = initObj.accX
      }
      else {
        this.accX = [];
      }
      if (initObj.hasOwnProperty('accY')) {
        this.accY = initObj.accY
      }
      else {
        this.accY = [];
      }
      if (initObj.hasOwnProperty('accZ')) {
        this.accZ = initObj.accZ
      }
      else {
        this.accZ = [];
      }
      if (initObj.hasOwnProperty('angX')) {
        this.angX = initObj.angX
      }
      else {
        this.angX = [];
      }
      if (initObj.hasOwnProperty('angY')) {
        this.angY = initObj.angY
      }
      else {
        this.angY = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ImpactMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [torque3]
    bufferOffset = _arraySerializer.float64(obj.torque3, buffer, bufferOffset, null);
    // Serialize message field [torque4]
    bufferOffset = _arraySerializer.float64(obj.torque4, buffer, bufferOffset, null);
    // Serialize message field [torqueF]
    bufferOffset = _arraySerializer.float64(obj.torqueF, buffer, bufferOffset, null);
    // Serialize message field [force]
    bufferOffset = _arraySerializer.float64(obj.force, buffer, bufferOffset, null);
    // Serialize message field [gyroX]
    bufferOffset = _arraySerializer.float64(obj.gyroX, buffer, bufferOffset, null);
    // Serialize message field [gyroY]
    bufferOffset = _arraySerializer.float64(obj.gyroY, buffer, bufferOffset, null);
    // Serialize message field [gyroZ]
    bufferOffset = _arraySerializer.float64(obj.gyroZ, buffer, bufferOffset, null);
    // Serialize message field [accX]
    bufferOffset = _arraySerializer.float64(obj.accX, buffer, bufferOffset, null);
    // Serialize message field [accY]
    bufferOffset = _arraySerializer.float64(obj.accY, buffer, bufferOffset, null);
    // Serialize message field [accZ]
    bufferOffset = _arraySerializer.float64(obj.accZ, buffer, bufferOffset, null);
    // Serialize message field [angX]
    bufferOffset = _arraySerializer.float64(obj.angX, buffer, bufferOffset, null);
    // Serialize message field [angY]
    bufferOffset = _arraySerializer.float64(obj.angY, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImpactMsg
    let len;
    let data = new ImpactMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [torque3]
    data.torque3 = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [torque4]
    data.torque4 = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [torqueF]
    data.torqueF = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [force]
    data.force = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [gyroX]
    data.gyroX = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [gyroY]
    data.gyroY = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [gyroZ]
    data.gyroZ = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [accX]
    data.accX = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [accY]
    data.accY = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [accZ]
    data.accZ = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [angX]
    data.angX = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [angY]
    data.angY = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 8 * object.torque3.length;
    length += 8 * object.torque4.length;
    length += 8 * object.torqueF.length;
    length += 8 * object.force.length;
    length += 8 * object.gyroX.length;
    length += 8 * object.gyroY.length;
    length += 8 * object.gyroZ.length;
    length += 8 * object.accX.length;
    length += 8 * object.accY.length;
    length += 8 * object.accZ.length;
    length += 8 * object.angX.length;
    length += 8 * object.angY.length;
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/ImpactMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '357f66bf5373be40bb62fd4edd456730';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header    header
    
    float64[]   torque3
    float64[]   torque4
    float64[]   torqueF
    float64[]   force
    float64[]   gyroX
    float64[]   gyroY
    float64[]   gyroZ
    float64[]   accX
    float64[]   accY
    float64[]   accZ
    float64[]   angX
    float64[]   angY
    
    
    
    
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
    const resolved = new ImpactMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.torque3 !== undefined) {
      resolved.torque3 = msg.torque3;
    }
    else {
      resolved.torque3 = []
    }

    if (msg.torque4 !== undefined) {
      resolved.torque4 = msg.torque4;
    }
    else {
      resolved.torque4 = []
    }

    if (msg.torqueF !== undefined) {
      resolved.torqueF = msg.torqueF;
    }
    else {
      resolved.torqueF = []
    }

    if (msg.force !== undefined) {
      resolved.force = msg.force;
    }
    else {
      resolved.force = []
    }

    if (msg.gyroX !== undefined) {
      resolved.gyroX = msg.gyroX;
    }
    else {
      resolved.gyroX = []
    }

    if (msg.gyroY !== undefined) {
      resolved.gyroY = msg.gyroY;
    }
    else {
      resolved.gyroY = []
    }

    if (msg.gyroZ !== undefined) {
      resolved.gyroZ = msg.gyroZ;
    }
    else {
      resolved.gyroZ = []
    }

    if (msg.accX !== undefined) {
      resolved.accX = msg.accX;
    }
    else {
      resolved.accX = []
    }

    if (msg.accY !== undefined) {
      resolved.accY = msg.accY;
    }
    else {
      resolved.accY = []
    }

    if (msg.accZ !== undefined) {
      resolved.accZ = msg.accZ;
    }
    else {
      resolved.accZ = []
    }

    if (msg.angX !== undefined) {
      resolved.angX = msg.angX;
    }
    else {
      resolved.angX = []
    }

    if (msg.angY !== undefined) {
      resolved.angY = msg.angY;
    }
    else {
      resolved.angY = []
    }

    return resolved;
    }
};

module.exports = ImpactMsg;
