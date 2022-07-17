// Generated by gencpp from file movement_msgs/LipCtrlSrvRequest.msg
// DO NOT EDIT!


#ifndef MOVEMENT_MSGS_MESSAGE_LIPCTRLSRVREQUEST_H
#define MOVEMENT_MSGS_MESSAGE_LIPCTRLSRVREQUEST_H


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
struct LipCtrlSrvRequest_
{
  typedef LipCtrlSrvRequest_<ContainerAllocator> Type;

  LipCtrlSrvRequest_()
    : walk_ctrl(false)
    , delayR(0.0)
    , delayL(0.0)
    , delayAll(0.0)  {
    }
  LipCtrlSrvRequest_(const ContainerAllocator& _alloc)
    : walk_ctrl(false)
    , delayR(0.0)
    , delayL(0.0)
    , delayAll(0.0)  {
  (void)_alloc;
    }



   typedef uint8_t _walk_ctrl_type;
  _walk_ctrl_type walk_ctrl;

   typedef double _delayR_type;
  _delayR_type delayR;

   typedef double _delayL_type;
  _delayL_type delayL;

   typedef double _delayAll_type;
  _delayAll_type delayAll;





  typedef boost::shared_ptr< ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator> const> ConstPtr;

}; // struct LipCtrlSrvRequest_

typedef ::movement_msgs::LipCtrlSrvRequest_<std::allocator<void> > LipCtrlSrvRequest;

typedef boost::shared_ptr< ::movement_msgs::LipCtrlSrvRequest > LipCtrlSrvRequestPtr;
typedef boost::shared_ptr< ::movement_msgs::LipCtrlSrvRequest const> LipCtrlSrvRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator1> & lhs, const ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator2> & rhs)
{
  return lhs.walk_ctrl == rhs.walk_ctrl &&
    lhs.delayR == rhs.delayR &&
    lhs.delayL == rhs.delayL &&
    lhs.delayAll == rhs.delayAll;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator1> & lhs, const ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace movement_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "19f7b1da62232e35c765032ea5c2cdaa";
  }

  static const char* value(const ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x19f7b1da62232e35ULL;
  static const uint64_t static_value2 = 0xc765032ea5c2cdaaULL;
};

template<class ContainerAllocator>
struct DataType< ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "movement_msgs/LipCtrlSrvRequest";
  }

  static const char* value(const ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool    walk_ctrl  #true for walking, false to stop\n"
"float64 delayR\n"
"float64 delayL\n"
"float64 delayAll\n"
;
  }

  static const char* value(const ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.walk_ctrl);
      stream.next(m.delayR);
      stream.next(m.delayL);
      stream.next(m.delayAll);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct LipCtrlSrvRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::movement_msgs::LipCtrlSrvRequest_<ContainerAllocator>& v)
  {
    s << indent << "walk_ctrl: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.walk_ctrl);
    s << indent << "delayR: ";
    Printer<double>::stream(s, indent + "  ", v.delayR);
    s << indent << "delayL: ";
    Printer<double>::stream(s, indent + "  ", v.delayL);
    s << indent << "delayAll: ";
    Printer<double>::stream(s, indent + "  ", v.delayAll);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOVEMENT_MSGS_MESSAGE_LIPCTRLSRVREQUEST_H
