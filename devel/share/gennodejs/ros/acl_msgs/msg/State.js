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

class State {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.state_stamp = null;
      this.pos = null;
      this.vel = null;
      this.quat = null;
      this.w = null;
      this.abias = null;
      this.gbias = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('state_stamp')) {
        this.state_stamp = initObj.state_stamp
      }
      else {
        this.state_stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('pos')) {
        this.pos = initObj.pos
      }
      else {
        this.pos = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('vel')) {
        this.vel = initObj.vel
      }
      else {
        this.vel = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('quat')) {
        this.quat = initObj.quat
      }
      else {
        this.quat = new geometry_msgs.msg.Quaternion();
      }
      if (initObj.hasOwnProperty('w')) {
        this.w = initObj.w
      }
      else {
        this.w = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('abias')) {
        this.abias = initObj.abias
      }
      else {
        this.abias = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('gbias')) {
        this.gbias = initObj.gbias
      }
      else {
        this.gbias = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type State
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [state_stamp]
    bufferOffset = _serializer.time(obj.state_stamp, buffer, bufferOffset);
    // Serialize message field [pos]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.pos, buffer, bufferOffset);
    // Serialize message field [vel]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.vel, buffer, bufferOffset);
    // Serialize message field [quat]
    bufferOffset = geometry_msgs.msg.Quaternion.serialize(obj.quat, buffer, bufferOffset);
    // Serialize message field [w]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.w, buffer, bufferOffset);
    // Serialize message field [abias]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.abias, buffer, bufferOffset);
    // Serialize message field [gbias]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.gbias, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type State
    let len;
    let data = new State(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [state_stamp]
    data.state_stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [pos]
    data.pos = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [vel]
    data.vel = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [quat]
    data.quat = geometry_msgs.msg.Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [w]
    data.w = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [abias]
    data.abias = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [gbias]
    data.gbias = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 160;
  }

  static datatype() {
    // Returns string type for a message object
    return 'acl_msgs/State';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd541639d4febb63bce9ed67bfaf4f2ba';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    time state_stamp
    geometry_msgs/Vector3 pos
    geometry_msgs/Vector3 vel
    geometry_msgs/Quaternion quat
    geometry_msgs/Vector3 w
    geometry_msgs/Vector3 abias
    geometry_msgs/Vector3 gbias
    
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
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new State(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.state_stamp !== undefined) {
      resolved.state_stamp = msg.state_stamp;
    }
    else {
      resolved.state_stamp = {secs: 0, nsecs: 0}
    }

    if (msg.pos !== undefined) {
      resolved.pos = geometry_msgs.msg.Vector3.Resolve(msg.pos)
    }
    else {
      resolved.pos = new geometry_msgs.msg.Vector3()
    }

    if (msg.vel !== undefined) {
      resolved.vel = geometry_msgs.msg.Vector3.Resolve(msg.vel)
    }
    else {
      resolved.vel = new geometry_msgs.msg.Vector3()
    }

    if (msg.quat !== undefined) {
      resolved.quat = geometry_msgs.msg.Quaternion.Resolve(msg.quat)
    }
    else {
      resolved.quat = new geometry_msgs.msg.Quaternion()
    }

    if (msg.w !== undefined) {
      resolved.w = geometry_msgs.msg.Vector3.Resolve(msg.w)
    }
    else {
      resolved.w = new geometry_msgs.msg.Vector3()
    }

    if (msg.abias !== undefined) {
      resolved.abias = geometry_msgs.msg.Vector3.Resolve(msg.abias)
    }
    else {
      resolved.abias = new geometry_msgs.msg.Vector3()
    }

    if (msg.gbias !== undefined) {
      resolved.gbias = geometry_msgs.msg.Vector3.Resolve(msg.gbias)
    }
    else {
      resolved.gbias = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

module.exports = State;
