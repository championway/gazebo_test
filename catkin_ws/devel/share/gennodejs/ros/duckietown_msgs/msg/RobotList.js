// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class RobotList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.robot = null;
    }
    else {
      if (initObj.hasOwnProperty('robot')) {
        this.robot = initObj.robot
      }
      else {
        this.robot = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotList
    // Serialize message field [robot]
    bufferOffset = _serializer.int32(obj.robot, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotList
    let len;
    let data = new RobotList(null);
    // Deserialize message field [robot]
    data.robot = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/RobotList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '19238a8d0c7746376713b235eefb7a53';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 robot
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotList(null);
    if (msg.robot !== undefined) {
      resolved.robot = msg.robot;
    }
    else {
      resolved.robot = 0
    }

    return resolved;
    }
};

module.exports = RobotList;
