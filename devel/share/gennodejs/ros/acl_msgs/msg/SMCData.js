// Auto-generated. Do not edit!

// (in-package acl_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SMCData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.q_des = null;
      this.q_act = null;
      this.q_err = null;
      this.w_des = null;
      this.w_act = null;
      this.w_err = null;
      this.s = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('q_des')) {
        this.q_des = initObj.q_des
      }
      else {
        this.q_des = new geometry_msgs.msg.Quaternion();
      }
      if (initObj.hasOwnProperty('q_act')) {
        this.q_act = initObj.q_act
      }
      else {
        this.q_act = new geometry_msgs.msg.Quaternion();
      }
      if (initObj.hasOwnProperty('q_err')) {
        this.q_err = initObj.q_err
      }
      else {
        this.q_err = new geometry_msgs.msg.Quaternion();
      }
      if (initObj.hasOwnProperty('w_des')) {
        this.w_des = initObj.w_des
      }
      else {
        this.w_des = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('w_act')) {
        this.w_act = initObj.w_act
      }
      else {
        this.w_act = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('w_err')) {
        this.w_err = initObj.w_err
      }
      else {
        this.w_err = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('s')) {
        this.s = initObj.s
      }
      else {
        this.s = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SMCData
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [q_des]
    bufferOffset = geometry_msgs.msg.Quaternion.serialize(obj.q_des, buffer, bufferOffset);
    // Serialize message field [q_act]
    bufferOffset = geometry_msgs.msg.Quaternion.serialize(obj.q_act, buffer, bufferOffset);
    // Serialize message field [q_err]
    bufferOffset = geometry_msgs.msg.Quaternion.serialize(obj.q_err, buffer, bufferOffset);
    // Serialize message field [w_des]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.w_des, buffer, bufferOffset);
    // Serialize message field [w_act]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.w_act, buffer, bufferOffset);
    // Serialize message field [w_err]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.w_err, buffer, bufferOffset);
    // Serialize message field [s]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.s, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SMCData
    let len;
    let data = new SMCData(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [q_des]
    data.q_des = geometry_msgs.msg.Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [q_act]
    data.q_act = geometry_msgs.msg.Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [q_err]
    data.q_err = geometry_msgs.msg.Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [w_des]
    data.w_des = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [w_act]
    data.w_act = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [w_err]
    data.w_err = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [s]
    data.s = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 192;
  }

  static datatype() {
    // Returns string type for a message object
    return 'acl_msgs/SMCData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c369b167744f4400cc4a61aab630dae0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    geometry_msgs/Quaternion q_des
    geometry_msgs/Quaternion q_act
    geometry_msgs/Quaternion q_err
    
    geometry_msgs/Vector3 w_des
    geometry_msgs/Vector3 w_act
    geometry_msgs/Vector3 w_err
    
    geometry_msgs/Vector3 s
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
    # 0: no frame
    # 1: global frame
    string frame_id
    
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SMCData(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.q_des !== undefined) {
      resolved.q_des = geometry_msgs.msg.Quaternion.Resolve(msg.q_des)
    }
    else {
      resolved.q_des = new geometry_msgs.msg.Quaternion()
    }

    if (msg.q_act !== undefined) {
      resolved.q_act = geometry_msgs.msg.Quaternion.Resolve(msg.q_act)
    }
    else {
      resolved.q_act = new geometry_msgs.msg.Quaternion()
    }

    if (msg.q_err !== undefined) {
      resolved.q_err = geometry_msgs.msg.Quaternion.Resolve(msg.q_err)
    }
    else {
      resolved.q_err = new geometry_msgs.msg.Quaternion()
    }

    if (msg.w_des !== undefined) {
      resolved.w_des = geometry_msgs.msg.Vector3.Resolve(msg.w_des)
    }
    else {
      resolved.w_des = new geometry_msgs.msg.Vector3()
    }

    if (msg.w_act !== undefined) {
      resolved.w_act = geometry_msgs.msg.Vector3.Resolve(msg.w_act)
    }
    else {
      resolved.w_act = new geometry_msgs.msg.Vector3()
    }

    if (msg.w_err !== undefined) {
      resolved.w_err = geometry_msgs.msg.Vector3.Resolve(msg.w_err)
    }
    else {
      resolved.w_err = new geometry_msgs.msg.Vector3()
    }

    if (msg.s !== undefined) {
      resolved.s = geometry_msgs.msg.Vector3.Resolve(msg.s)
    }
    else {
      resolved.s = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

module.exports = SMCData;
