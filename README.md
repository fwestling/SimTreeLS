# V-LiDAR: A system for generating virtual LiDAR data

To install, you need [Comma](https://github.com/acfr/comma) and [Snark](https://github.com/acfr/snark) (by ACFR). The `install.sh` script may successfully install these, but no promises.

We include Arbaro for tree generation, presented [here](https://www2.cs.duke.edu/courses/cps124/spring08/assign/07_papers/p119-weber.pdf) and licensed under GNU General Public License version 2.0 (GPLv2).

Currently this has only been tested on Ubuntu; it will install and run on WSL2 for Windows 10, but some features (namely visualisations) will fail.

If everything worked correctly, `generate-pointcloud` is the main entry point function; it takes in some parameters and generates a point cloud by simulating a LiDAR trajectory.

## Parameters:

`generate-pointcloud` is a script that requires some specific inputs...

First of all, it needs to be fed a tree definition (XML) generated in Arbaro.

It also needs a sensor definition. The way this is defined is by a binary file
which lists a set of lines generated by the LiDAR sensor at any one point in the
trajectory of the sensor. For instance, the Zeb1 sensor scans across 270
degrees at a 0.625 degree interval, with a maximum distance (outside) of 15m.
The "low-quality" fake sensor has a 1 degree interval and a maximum distance of 8m.
The line length in this sensor definition is important, as is the orientation
of the sensor plane.

The last thing that's needed is a sensor trajectory - how the sensor will move
around the generated stand of trees to generate the point cloud.
For instance, the Zeb1 sensor is bounced around in a circle around the tree.
The LiDAR on Shrimp spins continuously while travelling in straight lines.
These trajectories need to be defined in a specific global reference frame,
and rotation must be defined by quaternion. The reference frame used currently
derives from the definition provided by GeoSLAM in the Zebedee output files.