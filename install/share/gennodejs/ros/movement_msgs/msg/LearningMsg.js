// Auto-generated. Do not edit!

// (in-package movement_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PerformanceMsg = require('./PerformanceMsg.js');
let HumanoidStateMsg = require('./HumanoidStateMsg.js');
let sensor_msgs = _finder('sensor_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class LearningMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.x = null;
      this.y = null;
      this.z = null;
      this.rFoot = null;
      this.lFoot = null;
      this.force = null;
      this.torque3 = null;
      this.torque4 = null;
      this.torqueF = null;
      this.imu = null;
      this.perf = null;
      this.df = null;
      this.state = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = new PerformanceMsg();
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = new PerformanceMsg();
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = new PerformanceMsg();
      }
      if (initObj.hasOwnProperty('rFoot')) {
        this.rFoot = initObj.rFoot
      }
      else {
        this.rFoot = new PerformanceMsg();
      }
      if (initObj.hasOwnProperty('lFoot')) {
        this.lFoot = initObj.lFoot
      }
      else {
        this.lFoot = new PerformanceMsg();
      }
      if (initObj.hasOwnProperty('force')) {
        this.force = initObj.force
      }
      else {
        this.force = [];
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
      if (initObj.hasOwnProperty('imu')) {
        this.imu = initObj.imu
      }
      else {
        this.imu = [];
      }
      if (initObj.hasOwnProperty('perf')) {
        this.perf = initObj.perf
      }
      else {
        this.perf = 0.0;
      }
      if (initObj.hasOwnProperty('df')) {
        this.df = initObj.df
      }
      else {
        this.df = 0.0;
      }
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = new HumanoidStateMsg();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LearningMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = PerformanceMsg.serialize(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = PerformanceMsg.serialize(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = PerformanceMsg.serialize(obj.z, buffer, bufferOffset);
    // Serialize message field [rFoot]
    bufferOffset = PerformanceMsg.serialize(obj.rFoot, buffer, bufferOffset);
    // Serialize message field [lFoot]
    bufferOffset = PerformanceMsg.serialize(obj.lFoot, buffer, bufferOffset);
    // Serialize message field [force]
    bufferOffset = _arraySerializer.float64(obj.force, buffer, bufferOffset, null);
    // Serialize message field [torque3]
    bufferOffset = _arraySerializer.float64(obj.torque3, buffer, bufferOffset, null);
    // Serialize message field [torque4]
    bufferOffset = _arraySerializer.float64(obj.torque4, buffer, bufferOffset, null);
    // Serialize message field [torqueF]
    bufferOffset = _arraySerializer.float64(obj.torqueF, buffer, bufferOffset, null);
    // Serialize message field [imu]
    // Serialize the length for message field [imu]
    bufferOffset = _serializer.uint32(obj.imu.length, buffer, bufferOffset);
    obj.imu.forEach((val) => {
      bufferOffset = sensor_msgs.msg.Imu.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [perf]
    bufferOffset = _serializer.float64(obj.perf, buffer, bufferOffset);
    // Serialize message field [df]
    bufferOffset = _serializer.float64(obj.df, buffer, bufferOffset);
    // Serialize message field [state]
    bufferOffset = HumanoidStateMsg.serialize(obj.state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LearningMsg
    let len;
    let data = new LearningMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = PerformanceMsg.deserialize(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = PerformanceMsg.deserialize(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = PerformanceMsg.deserialize(buffer, bufferOffset);
    // Deserialize message field [rFoot]
    data.rFoot = PerformanceMsg.deserialize(buffer, bufferOffset);
    // Deserialize message field [lFoot]
    data.lFoot = PerformanceMsg.deserialize(buffer, bufferOffset);
    // Deserialize message field [force]
    data.force = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [torque3]
    data.torque3 = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [torque4]
    data.torque4 = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [torqueF]
    data.torqueF = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [imu]
    // Deserialize array length for message field [imu]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.imu = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.imu[i] = sensor_msgs.msg.Imu.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [perf]
    data.perf = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [df]
    data.df = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [state]
    data.state = HumanoidStateMsg.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += PerformanceMsg.getMessageSize(object.x);
    length += PerformanceMsg.getMessageSize(object.y);
    length += PerformanceMsg.getMessageSize(object.z);
    length += PerformanceMsg.getMessageSize(object.rFoot);
    length += PerformanceMsg.getMessageSize(object.lFoot);
    length += 8 * object.force.length;
    length += 8 * object.torque3.length;
    length += 8 * object.torque4.length;
    length += 8 * object.torqueF.length;
    object.imu.forEach((val) => {
      length += sensor_msgs.msg.Imu.getMessageSize(val);
    });
    return length + 100;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_msgs/LearningMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bb9643324c03e2d257aa2412b115318f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header    header
    movement_msgs/PerformanceMsg x
    movement_msgs/PerformanceMsg y
    movement_msgs/PerformanceMsg z
    movement_msgs/PerformanceMsg rFoot
    movement_msgs/PerformanceMsg lFoot
    
    float64[]           force
    float64[]           torque3
    float64[]           torque4
    float64[]           torqueF
    sensor_msgs/Imu[]   imu
    
    float64   perf
    float64   df
    movement_msgs/HumanoidStateMsg  state
    
    
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
    MSG: movement_msgs/PerformanceMsg
    float64[] data
    float64[] bins
    float64   freq
    float64   amp
    float64   mean
    float64   integral
    float64   freqRef
    float64   freqRange
    float64   ampRef
    float64   ampRange
    float64   meanRef
    float64   meanRange
    
    float64   freqPerf
    float64   ampPerf
    float64   meanPerf
    
    float64   wFreq
    float64   wAmp
    float64   wMean
    
    float64   perf
    
    ================================================================================
    MSG: sensor_msgs/Imu
    # This is a message to hold data from an IMU (Inertial Measurement Unit)
    #
    # Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec
    #
    # If the covariance of the measurement is known, it should be filled in (if all you know is the 
    # variance of each measurement, e.g. from the datasheet, just put those along the diagonal)
    # A covariance matrix of all zeros will be interpreted as "covariance unknown", and to use the
    # data a covariance will have to be assumed or gotten from some other source
    #
    # If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation 
    # estimate), please set element 0 of the associated covariance matrix to -1
    # If you are interpreting this message, please check for a value of -1 in the first element of each 
    # covariance matrix, and disregard the associated estimate.
    
    Header header
    
    geometry_msgs/Quaternion orientation
    float64[9] orientation_covariance # Row major about x, y, z axes
    
    geometry_msgs/Vector3 angular_velocity
    float64[9] angular_velocity_covariance # Row major about x, y, z axes
    
    geometry_msgs/Vector3 linear_acceleration
    float64[9] linear_acceleration_covariance # Row major x, y z 
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: movement_msgs/HumanoidStateMsg
    float64 angX
    float64 angY
    
    float64 gyroX
    float64 gyroY
    float64 gyroZ
    
    float64 accX
    float64 accY
    float64 accZ
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LearningMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.x !== undefined) {
      resolved.x = PerformanceMsg.Resolve(msg.x)
    }
    else {
      resolved.x = new PerformanceMsg()
    }

    if (msg.y !== undefined) {
      resolved.y = PerformanceMsg.Resolve(msg.y)
    }
    else {
      resolved.y = new PerformanceMsg()
    }

    if (msg.z !== undefined) {
      resolved.z = PerformanceMsg.Resolve(msg.z)
    }
    else {
      resolved.z = new PerformanceMsg()
    }

    if (msg.rFoot !== undefined) {
      resolved.rFoot = PerformanceMsg.Resolve(msg.rFoot)
    }
    else {
      resolved.rFoot = new PerformanceMsg()
    }

    if (msg.lFoot !== undefined) {
      resolved.lFoot = PerformanceMsg.Resolve(msg.lFoot)
    }
    else {
      resolved.lFoot = new PerformanceMsg()
    }

    if (msg.force !== undefined) {
      resolved.force = msg.force;
    }
    else {
      resolved.force = []
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

    if (msg.imu !== undefined) {
      resolved.imu = new Array(msg.imu.length);
      for (let i = 0; i < resolved.imu.length; ++i) {
        resolved.imu[i] = sensor_msgs.msg.Imu.Resolve(msg.imu[i]);
      }
    }
    else {
      resolved.imu = []
    }

    if (msg.perf !== undefined) {
      resolved.perf = msg.perf;
    }
    else {
      resolved.perf = 0.0
    }

    if (msg.df !== undefined) {
      resolved.df = msg.df;
    }
    else {
      resolved.df = 0.0
    }

    if (msg.state !== undefined) {
      resolved.state = HumanoidStateMsg.Resolve(msg.state)
    }
    else {
      resolved.state = new HumanoidStateMsg()
    }

    return resolved;
    }
};

module.exports = LearningMsg;
