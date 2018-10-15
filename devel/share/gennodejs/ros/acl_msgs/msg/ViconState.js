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

class ViconState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.pose = null;
      this.Eulers = null;
      this.twist = null;
      this.pos_accel = null;
      this.Eulers_accel = null;
      this.has_pose = null;
      this.has_twist = null;
      this.has_accel = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('Eulers')) {
        this.Eulers = initObj.Eulers
      }
      else {
        this.Eulers = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('twist')) {
        this.twist = initObj.twist
      }
      else {
        this.twist = new geometry_msgs.msg.Twist();
      }
      if (initObj.hasOwnProperty('pos_accel')) {
        this.pos_accel = initObj.pos_accel
      }
      else {
        this.pos_accel = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('Eulers_accel')) {
        this.Eulers_accel = initObj.Eulers_accel
      }
      else {
        this.Eulers_accel = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('has_pose')) {
        this.has_pose = initObj.has_pose
      }
      else {
        this.has_pose = false;
      }
      if (initObj.hasOwnProperty('has_twist')) {
        this.has_twist = initObj.has_twist
      }
      else {
        this.has_twist = false;
      }
      if (initObj.hasOwnProperty('has_accel')) {
        this.has_accel = initObj.has_accel
      }
      else {
        this.has_accel = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ViconState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.pose, buffer, bufferOffset);
    // Serialize message field [Eulers]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.Eulers, buffer, bufferOffset);
    // Serialize message field [twist]
    bufferOffset = geometry_msgs.msg.Twist.serialize(obj.twist, buffer, bufferOffset);
    // Serialize message field [pos_accel]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.pos_accel, buffer, bufferOffset);
    // Serialize message field [Eulers_accel]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.Eulers_accel, buffer, bufferOffset);
    // Serialize message field [has_pose]
    bufferOffset = _serializer.bool(obj.has_pose, buffer, bufferOffset);
    // Serialize message field [has_twist]
    bufferOffset = _serializer.bool(obj.has_twist, buffer, bufferOffset);
    // Serialize message field [has_accel]
    bufferOffset = _serializer.bool(obj.has_accel, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ViconState
    let len;
    let data = new ViconState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [Eulers]
    data.Eulers = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [twist]
    data.twist = geometry_msgs.msg.Twist.deserialize(buffer, bufferOffset);
    // Deserialize message field [pos_accel]
    data.pos_accel = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [Eulers_accel]
    data.Eulers_accel = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [has_pose]
    data.has_pose = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [has_twist]
    data.has_twist = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [has_accel]
    data.has_accel = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 179;
  }

  static datatype() {
    // Returns string type for a message object
    return 'acl_msgs/ViconState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b7e43266dac9a0f8e73e309a192f76b9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    geometry_msgs/Pose pose
    geometry_msgs/Vector3 Eulers
    geometry_msgs/Twist twist
    geometry_msgs/Vector3 pos_accel
    geometry_msgs/Vector3 Eulers_accel
    bool has_pose
    bool has_twist
    bool has_accel
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
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
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
    MSG: geometry_msgs/Twist
    # This expresses velocity in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ViconState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.pose !== undefined) {
      resolved.pose = geometry_msgs.msg.Pose.Resolve(msg.pose)
    }
    else {
      resolved.pose = new geometry_msgs.msg.Pose()
    }

    if (msg.Eulers !== undefined) {
      resolved.Eulers = geometry_msgs.msg.Vector3.Resolve(msg.Eulers)
    }
    else {
      resolved.Eulers = new geometry_msgs.msg.Vector3()
    }

    if (msg.twist !== undefined) {
      resolved.twist = geometry_msgs.msg.Twist.Resolve(msg.twist)
    }
    else {
      resolved.twist = new geometry_msgs.msg.Twist()
    }

    if (msg.pos_accel !== undefined) {
      resolved.pos_accel = geometry_msgs.msg.Vector3.Resolve(msg.pos_accel)
    }
    else {
      resolved.pos_accel = new geometry_msgs.msg.Vector3()
    }

    if (msg.Eulers_accel !== undefined) {
      resolved.Eulers_accel = geometry_msgs.msg.Vector3.Resolve(msg.Eulers_accel)
    }
    else {
      resolved.Eulers_accel = new geometry_msgs.msg.Vector3()
    }

    if (msg.has_pose !== undefined) {
      resolved.has_pose = msg.has_pose;
    }
    else {
      resolved.has_pose = false
    }

    if (msg.has_twist !== undefined) {
      resolved.has_twist = msg.has_twist;
    }
    else {
      resolved.has_twist = false
    }

    if (msg.has_accel !== undefined) {
      resolved.has_accel = msg.has_accel;
    }
    else {
      resolved.has_accel = false
    }

    return resolved;
    }
};

module.exports = ViconState;
