cmake_minimum_required(VERSION 3.3)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS_RELEASE "-O3")

set(CATKIN_ENABLE_TESTING OFF)
project(registrationml)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
#find_package(catkin REQUIRED COMPONENTS roscpp rospy std_msgs roscpp message_generation cv_bridge ping360_sonar_msgs commonbluerovmsg dynamic_reconfigure waterlinked_dvl)
#find_package(PCL 1.10 REQUIRED COMPONENTS common io visualization)
#find_package (Eigen3 3.3 REQUIRED NO_MODULE)
#find_package(eigen3_cmake_module REQUIRED)
#find_package(Eigen3)
#find_package(tf2 REQUIRED)

find_package(ament_cmake REQUIRED)
find_package(ament_cmake_python REQUIRED)

find_package(rosidl_default_generators REQUIRED)
find_package(builtin_interfaces REQUIRED)

find_package(rclpy REQUIRED)
find_package(std_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(sensor_msgs REQUIRED)

rosidl_generate_interfaces(registrationml

        "srv/RequestOnePotentialSolution3D.srv"

        DEPENDENCIES builtin_interfaces
        DEPENDENCIES std_msgs
        DEPENDENCIES geometry_msgs
        DEPENDENCIES sensor_msgs
)



ament_python_install_package(${PROJECT_NAME})

#install(PROGRAMS
#        scripts/pwmServicesTopTube.py
#        scripts/pwmServicesSensorTube.py
#        scripts/leakageSensorTopTube.py
#        scripts/leakageSensorSensorTube.py
#        scripts/powerControlBotomTube.py
#        scripts/mjpeg_cam_python.py
#        bashScripts/xrcClientStart.sh
#        bashScripts/startpigpiod.sh
#        DESTINATION lib/${PROJECT_NAME}
#)


ament_export_dependencies(rosidl_default_runtime)
ament_package()


