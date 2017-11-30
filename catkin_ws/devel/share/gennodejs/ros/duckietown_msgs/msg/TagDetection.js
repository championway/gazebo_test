// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class TagDetection {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.good = null;
      this.id = null;
      this.p = null;
      this.cxy = null;
      this.observedPerimeter = null;
      this.homography = null;
      this.orientation = null;
      this.hxy = null;
      this.transform = null;
    }
    else {
      if (initObj.hasOwnProperty('good')) {
        this.good = initObj.good
      }
      else {
        this.good = false;
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('p')) {
        this.p = initObj.p
      }
      else {
        this.p = [];
      }
      if (initObj.hasOwnProperty('cxy')) {
        this.cxy = initObj.cxy
      }
      else {
        this.cxy = [];
      }
      if (initObj.hasOwnProperty('observedPerimeter')) {
        this.observedPerimeter = initObj.observedPerimeter
      }
      else {
        this.observedPerimeter = 0.0;
      }
      if (initObj.hasOwnProperty('homography')) {
        this.homography = initObj.homography
      }
      else {
        this.homography = [];
      }
      if (initObj.hasOwnProperty('orientation')) {
        this.orientation = initObj.orientation
      }
      else {
        this.orientation = 0.0;
      }
      if (initObj.hasOwnProperty('hxy')) {
        this.hxy = initObj.hxy
      }
      else {
        this.hxy = [];
      }
      if (initObj.hasOwnProperty('transform')) {
        this.transform = initObj.transform
      }
      else {
        this.transform = new geometry_msgs.msg.Transform();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TagDetection
    // Serialize message field [good]
    bufferOffset = _serializer.bool(obj.good, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [p]
    bufferOffset = _arraySerializer.float32(obj.p, buffer, bufferOffset, null);
    // Serialize message field [cxy]
    bufferOffset = _arraySerializer.float32(obj.cxy, buffer, bufferOffset, null);
    // Serialize message field [observedPerimeter]
    bufferOffset = _serializer.float32(obj.observedPerimeter, buffer, bufferOffset);
    // Serialize message field [homography]
    bufferOffset = _arraySerializer.float32(obj.homography, buffer, bufferOffset, null);
    // Serialize message field [orientation]
    bufferOffset = _serializer.float32(obj.orientation, buffer, bufferOffset);
    // Serialize message field [hxy]
    bufferOffset = _arraySerializer.float32(obj.hxy, buffer, bufferOffset, null);
    // Serialize message field [transform]
    bufferOffset = geometry_msgs.msg.Transform.serialize(obj.transform, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TagDetection
    let len;
    let data = new TagDetection(null);
    // Deserialize message field [good]
    data.good = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [p]
    data.p = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [cxy]
    data.cxy = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [observedPerimeter]
    data.observedPerimeter = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [homography]
    data.homography = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [orientation]
    data.orientation = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [hxy]
    data.hxy = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [transform]
    data.transform = geometry_msgs.msg.Transform.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.p.length;
    length += 4 * object.cxy.length;
    length += 4 * object.homography.length;
    length += 4 * object.hxy.length;
    return length + 85;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/TagDetection';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4b7d45baa0b18dbb969cc3d0e5133e7f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #Mirrors TagDetection.h in the apriltags pkg
    bool good
    int32 id
    float32[] p
    float32[] cxy
    float32 observedPerimeter
    float32[] homography
    float32 orientation
    float32[] hxy
    geometry_msgs/Transform transform
    
    ================================================================================
    MSG: geometry_msgs/Transform
    # This represents the transform between two coordinate frames in free space.
    
    Vector3 translation
    Quaternion rotation
    
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
    const resolved = new TagDetection(null);
    if (msg.good !== undefined) {
      resolved.good = msg.good;
    }
    else {
      resolved.good = false
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.p !== undefined) {
      resolved.p = msg.p;
    }
    else {
      resolved.p = []
    }

    if (msg.cxy !== undefined) {
      resolved.cxy = msg.cxy;
    }
    else {
      resolved.cxy = []
    }

    if (msg.observedPerimeter !== undefined) {
      resolved.observedPerimeter = msg.observedPerimeter;
    }
    else {
      resolved.observedPerimeter = 0.0
    }

    if (msg.homography !== undefined) {
      resolved.homography = msg.homography;
    }
    else {
      resolved.homography = []
    }

    if (msg.orientation !== undefined) {
      resolved.orientation = msg.orientation;
    }
    else {
      resolved.orientation = 0.0
    }

    if (msg.hxy !== undefined) {
      resolved.hxy = msg.hxy;
    }
    else {
      resolved.hxy = []
    }

    if (msg.transform !== undefined) {
      resolved.transform = geometry_msgs.msg.Transform.Resolve(msg.transform)
    }
    else {
      resolved.transform = new geometry_msgs.msg.Transform()
    }

    return resolved;
    }
};

module.exports = TagDetection;
