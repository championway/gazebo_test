# yury_gazebo
Yury's gazebo stuff

Proof of concept for swimming models in Gazebo. Buggy.

To use it, install this package first: https://github.com/freefloating-gazebo

The package itself is called "gazebo_simulation", not "yury_gazebo".

Main launch file: 
**roslaunch gazebo_simulation demo.launch**

You can control the boat with joystick, collisions are switched off (they break the freefloating plugin with current settings OR the plugin itself was born broken).
Inertia is simulated using self-written software, and is really approximate. This approach will be ditched, since gazebo can handle this. Instead, the bouyancy will be simulated using self-written program/another plugin (at first a simple model similar to freefloating_gazebo).

Current issues:
1. Simulation breaks in cases of:
* Collisions.
* Applying torque.
* Changing bouyancy application point.

All models are in urdf folder (mostly in xacro format). Scale is 1:1 to toy boat and toy duckies. 
Models are created in Solidworks, exported to Meshlab (via STL format) for simplification/scaling/parameter computation (volume, inertia tensor etc), then exported to SketchUp (via Collada format) for painting/positioning of origin and finally exported to another Collada file to use with SDF/URDF/Xacro.

! No guarantee it will work on your machine for now.
