
"use strict";

let ObstacleProjectedDetection = require('./ObstacleProjectedDetection.js');
let VehicleCorners = require('./VehicleCorners.js');
let AprilTagDetection = require('./AprilTagDetection.js');
let SceneSegments = require('./SceneSegments.js');
let KinematicsParameters = require('./KinematicsParameters.js');
let Twist2DStamped = require('./Twist2DStamped.js');
let ObstacleImageDetection = require('./ObstacleImageDetection.js');
let AprilTagDetectionArray = require('./AprilTagDetectionArray.js');
let TagInfo = require('./TagInfo.js');
let LanePose = require('./LanePose.js');
let LEDInterpreter = require('./LEDInterpreter.js');
let Segment = require('./Segment.js');
let SignalsDetection = require('./SignalsDetection.js');
let TagDetection = require('./TagDetection.js');
let AprilTagsWithInfos = require('./AprilTagsWithInfos.js');
let KinematicsWeights = require('./KinematicsWeights.js');
let VehiclePose = require('./VehiclePose.js');
let LEDDetection = require('./LEDDetection.js');
let ObstacleType = require('./ObstacleType.js');
let CoordinationSignal = require('./CoordinationSignal.js');
let DuckieSensor = require('./DuckieSensor.js');
let SegmentList = require('./SegmentList.js');
let StreetNameDetection = require('./StreetNameDetection.js');
let RobotName = require('./RobotName.js');
let SourceTargetNodes = require('./SourceTargetNodes.js');
let WheelsCmd = require('./WheelsCmd.js');
let Rect = require('./Rect.js');
let CarControl = require('./CarControl.js');
let LEDDetectionDebugInfo = require('./LEDDetectionDebugInfo.js');
let Pixel = require('./Pixel.js');
let Vsample = require('./Vsample.js');
let PatrolBot = require('./PatrolBot.js');
let FSMState = require('./FSMState.js');
let RobotList = require('./RobotList.js');
let AprilTags = require('./AprilTags.js');
let ObstacleImageDetectionList = require('./ObstacleImageDetectionList.js');
let StopLineReading = require('./StopLineReading.js');
let Trajectory = require('./Trajectory.js');
let Pose2DStamped = require('./Pose2DStamped.js');
let ObstacleProjectedDetectionList = require('./ObstacleProjectedDetectionList.js');
let ThetaDotSample = require('./ThetaDotSample.js');
let BoolStamped = require('./BoolStamped.js');
let WheelsCmdStamped = require('./WheelsCmdStamped.js');
let Rects = require('./Rects.js');
let CoordinationClearance = require('./CoordinationClearance.js');
let Vector2D = require('./Vector2D.js');
let AntiInstagramTransform = require('./AntiInstagramTransform.js');
let StreetNames = require('./StreetNames.js');
let AntiInstagramHealth = require('./AntiInstagramHealth.js');
let LEDDetectionArray = require('./LEDDetectionArray.js');

module.exports = {
  ObstacleProjectedDetection: ObstacleProjectedDetection,
  VehicleCorners: VehicleCorners,
  AprilTagDetection: AprilTagDetection,
  SceneSegments: SceneSegments,
  KinematicsParameters: KinematicsParameters,
  Twist2DStamped: Twist2DStamped,
  ObstacleImageDetection: ObstacleImageDetection,
  AprilTagDetectionArray: AprilTagDetectionArray,
  TagInfo: TagInfo,
  LanePose: LanePose,
  LEDInterpreter: LEDInterpreter,
  Segment: Segment,
  SignalsDetection: SignalsDetection,
  TagDetection: TagDetection,
  AprilTagsWithInfos: AprilTagsWithInfos,
  KinematicsWeights: KinematicsWeights,
  VehiclePose: VehiclePose,
  LEDDetection: LEDDetection,
  ObstacleType: ObstacleType,
  CoordinationSignal: CoordinationSignal,
  DuckieSensor: DuckieSensor,
  SegmentList: SegmentList,
  StreetNameDetection: StreetNameDetection,
  RobotName: RobotName,
  SourceTargetNodes: SourceTargetNodes,
  WheelsCmd: WheelsCmd,
  Rect: Rect,
  CarControl: CarControl,
  LEDDetectionDebugInfo: LEDDetectionDebugInfo,
  Pixel: Pixel,
  Vsample: Vsample,
  PatrolBot: PatrolBot,
  FSMState: FSMState,
  RobotList: RobotList,
  AprilTags: AprilTags,
  ObstacleImageDetectionList: ObstacleImageDetectionList,
  StopLineReading: StopLineReading,
  Trajectory: Trajectory,
  Pose2DStamped: Pose2DStamped,
  ObstacleProjectedDetectionList: ObstacleProjectedDetectionList,
  ThetaDotSample: ThetaDotSample,
  BoolStamped: BoolStamped,
  WheelsCmdStamped: WheelsCmdStamped,
  Rects: Rects,
  CoordinationClearance: CoordinationClearance,
  Vector2D: Vector2D,
  AntiInstagramTransform: AntiInstagramTransform,
  StreetNames: StreetNames,
  AntiInstagramHealth: AntiInstagramHealth,
  LEDDetectionArray: LEDDetectionArray,
};
