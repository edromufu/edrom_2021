// Generated by gencpp from file movement_msgs/ApprovedMovementMsg.msg
// DO NOT EDIT!


#ifndef MOVEMENT_MSGS_MESSAGE_APPROVEDMOVEMENTMSG_H
#define MOVEMENT_MSGS_MESSAGE_APPROVEDMOVEMENTMSG_H


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
struct ApprovedMovementMsg_
{
  typedef ApprovedMovementMsg_<ContainerAllocator> Type;

  ApprovedMovementMsg_()
    : approved_movement()  {
    }
  ApprovedMovementMsg_(const ContainerAllocator& _alloc)
    : approved_movement(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _approved_movement_type;
  _approved_movement_type approved_movement;





  typedef boost::shared_ptr< ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator> const> ConstPtr;

}; // struct ApprovedMovementMsg_

typedef ::movement_msgs::ApprovedMovementMsg_<std::allocator<void> > ApprovedMovementMsg;

typedef boost::shared_ptr< ::movement_msgs::ApprovedMovementMsg > ApprovedMovementMsgPtr;
typedef boost::shared_ptr< ::movement_msgs::ApprovedMovementMsg const> ApprovedMovementMsgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator1> & lhs, const ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator2> & rhs)
{
  return lhs.approved_movement == rhs.approved_movement;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator1> & lhs, const ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace movement_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "255fbce3bb4374d8b5382cbf8e9f1840";
  }

  static const char* value(const ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x255fbce3bb4374d8ULL;
  static const uint64_t static_value2 = 0xb5382cbf8e9f1840ULL;
};

template<class ContainerAllocator>
struct DataType< ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "movement_msgs/ApprovedMovementMsg";
  }

  static const char* value(const ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string approved_movement\n"
"\n"
;
  }

  static const char* value(const ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.approved_movement);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ApprovedMovementMsg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::movement_msgs::ApprovedMovementMsg_<ContainerAllocator>& v)
  {
    s << indent << "approved_movement: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.approved_movement);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOVEMENT_MSGS_MESSAGE_APPROVEDMOVEMENTMSG_H
