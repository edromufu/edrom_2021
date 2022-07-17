// Generated by gencpp from file movement_msgs/WebotsMsg.msg
// DO NOT EDIT!


#ifndef MOVEMENT_MSGS_MESSAGE_WEBOTSMSG_H
#define MOVEMENT_MSGS_MESSAGE_WEBOTSMSG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace movement_msgs
{
template <class ContainerAllocator>
struct WebotsMsg_
{
  typedef WebotsMsg_<ContainerAllocator> Type;

  WebotsMsg_()
    : position()
    , velocity()
    , control()
    , motor_name()  {
      position.assign(0.0);

      velocity.assign(0.0);
  }
  WebotsMsg_(const ContainerAllocator& _alloc)
    : position()
    , velocity()
    , control(_alloc)
    , motor_name()  {
      position.assign(0.0);

      velocity.assign(0.0);

      motor_name.assign(std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > (_alloc));
  }



   typedef boost::array<double, 20>  _position_type;
  _position_type position;

   typedef boost::array<double, 20>  _velocity_type;
  _velocity_type velocity;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _control_type;
  _control_type control;

   typedef boost::array<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > , 20>  _motor_name_type;
  _motor_name_type motor_name;





  typedef boost::shared_ptr< ::movement_msgs::WebotsMsg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::movement_msgs::WebotsMsg_<ContainerAllocator> const> ConstPtr;

}; // struct WebotsMsg_

typedef ::movement_msgs::WebotsMsg_<std::allocator<void> > WebotsMsg;

typedef boost::shared_ptr< ::movement_msgs::WebotsMsg > WebotsMsgPtr;
typedef boost::shared_ptr< ::movement_msgs::WebotsMsg const> WebotsMsgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::movement_msgs::WebotsMsg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::movement_msgs::WebotsMsg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::movement_msgs::WebotsMsg_<ContainerAllocator1> & lhs, const ::movement_msgs::WebotsMsg_<ContainerAllocator2> & rhs)
{
  return lhs.position == rhs.position &&
    lhs.velocity == rhs.velocity &&
    lhs.control == rhs.control &&
    lhs.motor_name == rhs.motor_name;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::movement_msgs::WebotsMsg_<ContainerAllocator1> & lhs, const ::movement_msgs::WebotsMsg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace movement_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::movement_msgs::WebotsMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::movement_msgs::WebotsMsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::movement_msgs::WebotsMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::movement_msgs::WebotsMsg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::movement_msgs::WebotsMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::movement_msgs::WebotsMsg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::movement_msgs::WebotsMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "954ba293d4cc5b7067f7a1e881d6f143";
  }

  static const char* value(const ::movement_msgs::WebotsMsg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x954ba293d4cc5b70ULL;
  static const uint64_t static_value2 = 0x67f7a1e881d6f143ULL;
};

template<class ContainerAllocator>
struct DataType< ::movement_msgs::WebotsMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "movement_msgs/WebotsMsg";
  }

  static const char* value(const ::movement_msgs::WebotsMsg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::movement_msgs::WebotsMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64[20] position\n"
"float64[20] velocity\n"
"string control\n"
"string[20] motor_name\n"
;
  }

  static const char* value(const ::movement_msgs::WebotsMsg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::movement_msgs::WebotsMsg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.position);
      stream.next(m.velocity);
      stream.next(m.control);
      stream.next(m.motor_name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct WebotsMsg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::movement_msgs::WebotsMsg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::movement_msgs::WebotsMsg_<ContainerAllocator>& v)
  {
    s << indent << "position[]" << std::endl;
    for (size_t i = 0; i < v.position.size(); ++i)
    {
      s << indent << "  position[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.position[i]);
    }
    s << indent << "velocity[]" << std::endl;
    for (size_t i = 0; i < v.velocity.size(); ++i)
    {
      s << indent << "  velocity[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.velocity[i]);
    }
    s << indent << "control: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.control);
    s << indent << "motor_name[]" << std::endl;
    for (size_t i = 0; i < v.motor_name.size(); ++i)
    {
      s << indent << "  motor_name[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.motor_name[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOVEMENT_MSGS_MESSAGE_WEBOTSMSG_H
