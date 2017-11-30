// Generated by gencpp from file duckietown_msgs/SetFSMStateResponse.msg
// DO NOT EDIT!


#ifndef DUCKIETOWN_MSGS_MESSAGE_SETFSMSTATERESPONSE_H
#define DUCKIETOWN_MSGS_MESSAGE_SETFSMSTATERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace duckietown_msgs
{
template <class ContainerAllocator>
struct SetFSMStateResponse_
{
  typedef SetFSMStateResponse_<ContainerAllocator> Type;

  SetFSMStateResponse_()
    {
    }
  SetFSMStateResponse_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }






  typedef boost::shared_ptr< ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator> const> ConstPtr;

}; // struct SetFSMStateResponse_

typedef ::duckietown_msgs::SetFSMStateResponse_<std::allocator<void> > SetFSMStateResponse;

typedef boost::shared_ptr< ::duckietown_msgs::SetFSMStateResponse > SetFSMStateResponsePtr;
typedef boost::shared_ptr< ::duckietown_msgs::SetFSMStateResponse const> SetFSMStateResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace duckietown_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'duckietown_msgs': ['/home/david/gazebo_test/catkin_ws/src/duckietown_msgs/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "duckietown_msgs/SetFSMStateResponse";
  }

  static const char* value(const ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
";
  }

  static const char* value(const ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetFSMStateResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::duckietown_msgs::SetFSMStateResponse_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // DUCKIETOWN_MSGS_MESSAGE_SETFSMSTATERESPONSE_H
