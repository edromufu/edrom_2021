// Generated by gencpp from file movement_msgs/WalkCreatorRequestSrvResponse.msg
// DO NOT EDIT!


#ifndef MOVEMENT_MSGS_MESSAGE_WALKCREATORREQUESTSRVRESPONSE_H
#define MOVEMENT_MSGS_MESSAGE_WALKCREATORREQUESTSRVRESPONSE_H


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
struct WalkCreatorRequestSrvResponse_
{
  typedef WalkCreatorRequestSrvResponse_<ContainerAllocator> Type;

  WalkCreatorRequestSrvResponse_()
    : success(false)  {
    }
  WalkCreatorRequestSrvResponse_(const ContainerAllocator& _alloc)
    : success(false)  {
  (void)_alloc;
    }



   typedef uint8_t _success_type;
  _success_type success;





  typedef boost::shared_ptr< ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator> const> ConstPtr;

}; // struct WalkCreatorRequestSrvResponse_

typedef ::movement_msgs::WalkCreatorRequestSrvResponse_<std::allocator<void> > WalkCreatorRequestSrvResponse;

typedef boost::shared_ptr< ::movement_msgs::WalkCreatorRequestSrvResponse > WalkCreatorRequestSrvResponsePtr;
typedef boost::shared_ptr< ::movement_msgs::WalkCreatorRequestSrvResponse const> WalkCreatorRequestSrvResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator1> & lhs, const ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator2> & rhs)
{
  return lhs.success == rhs.success;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator1> & lhs, const ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace movement_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "358e233cde0c8a8bcfea4ce193f8fc15";
  }

  static const char* value(const ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x358e233cde0c8a8bULL;
  static const uint64_t static_value2 = 0xcfea4ce193f8fc15ULL;
};

template<class ContainerAllocator>
struct DataType< ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "movement_msgs/WalkCreatorRequestSrvResponse";
  }

  static const char* value(const ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool success\n"
;
  }

  static const char* value(const ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct WalkCreatorRequestSrvResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::movement_msgs::WalkCreatorRequestSrvResponse_<ContainerAllocator>& v)
  {
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOVEMENT_MSGS_MESSAGE_WALKCREATORREQUESTSRVRESPONSE_H
