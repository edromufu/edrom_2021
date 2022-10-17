// Generated by gencpp from file movement_msgs/OpencmResponseMsg.msg
// DO NOT EDIT!


#ifndef MOVEMENT_MSGS_MESSAGE_OPENCMRESPONSEMSG_H
#define MOVEMENT_MSGS_MESSAGE_OPENCMRESPONSEMSG_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace movement_msgs
{
template <class ContainerAllocator>
struct OpencmResponseMsg_
{
  typedef OpencmResponseMsg_<ContainerAllocator> Type;

  OpencmResponseMsg_()
    : motors_position()
    , motors_velocity()  {
      motors_position.assign(0);

      motors_velocity.assign(0);
  }
  OpencmResponseMsg_(const ContainerAllocator& _alloc)
    : motors_position()
    , motors_velocity()  {
  (void)_alloc;
      motors_position.assign(0);

      motors_velocity.assign(0);
  }



   typedef boost::array<int16_t, 20>  _motors_position_type;
  _motors_position_type motors_position;

   typedef boost::array<int16_t, 20>  _motors_velocity_type;
  _motors_velocity_type motors_velocity;





  typedef boost::shared_ptr< ::movement_msgs::OpencmResponseMsg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::movement_msgs::OpencmResponseMsg_<ContainerAllocator> const> ConstPtr;

}; // struct OpencmResponseMsg_

typedef ::movement_msgs::OpencmResponseMsg_<std::allocator<void> > OpencmResponseMsg;

typedef boost::shared_ptr< ::movement_msgs::OpencmResponseMsg > OpencmResponseMsgPtr;
typedef boost::shared_ptr< ::movement_msgs::OpencmResponseMsg const> OpencmResponseMsgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::movement_msgs::OpencmResponseMsg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::movement_msgs::OpencmResponseMsg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::movement_msgs::OpencmResponseMsg_<ContainerAllocator1> & lhs, const ::movement_msgs::OpencmResponseMsg_<ContainerAllocator2> & rhs)
{
  return lhs.motors_position == rhs.motors_position &&
    lhs.motors_velocity == rhs.motors_velocity;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::movement_msgs::OpencmResponseMsg_<ContainerAllocator1> & lhs, const ::movement_msgs::OpencmResponseMsg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace movement_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::movement_msgs::OpencmResponseMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::movement_msgs::OpencmResponseMsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::movement_msgs::OpencmResponseMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::movement_msgs::OpencmResponseMsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::movement_msgs::OpencmResponseMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::movement_msgs::OpencmResponseMsg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::movement_msgs::OpencmResponseMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f292bdc80699153415d4562d7f08a5e4";
  }

  static const char* value(const ::movement_msgs::OpencmResponseMsg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf292bdc806991534ULL;
  static const uint64_t static_value2 = 0x15d4562d7f08a5e4ULL;
};

template<class ContainerAllocator>
struct DataType< ::movement_msgs::OpencmResponseMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "movement_msgs/OpencmResponseMsg";
  }

  static const char* value(const ::movement_msgs::OpencmResponseMsg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::movement_msgs::OpencmResponseMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int16[20] motors_position\n"
"int16[20] motors_velocity\n"
;
  }

  static const char* value(const ::movement_msgs::OpencmResponseMsg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::movement_msgs::OpencmResponseMsg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.motors_position);
      stream.next(m.motors_velocity);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct OpencmResponseMsg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::movement_msgs::OpencmResponseMsg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::movement_msgs::OpencmResponseMsg_<ContainerAllocator>& v)
  {
    s << indent << "motors_position[]" << std::endl;
    for (size_t i = 0; i < v.motors_position.size(); ++i)
    {
      s << indent << "  motors_position[" << i << "]: ";
      Printer<int16_t>::stream(s, indent + "  ", v.motors_position[i]);
    }
    s << indent << "motors_velocity[]" << std::endl;
    for (size_t i = 0; i < v.motors_velocity.size(); ++i)
    {
      s << indent << "  motors_velocity[" << i << "]: ";
      Printer<int16_t>::stream(s, indent + "  ", v.motors_velocity[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOVEMENT_MSGS_MESSAGE_OPENCMRESPONSEMSG_H
