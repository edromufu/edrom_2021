// Generated by gencpp from file vision_msgs/Rightgoalpost.msg
// DO NOT EDIT!


#ifndef VISION_MSGS_MESSAGE_RIGHTGOALPOST_H
#define VISION_MSGS_MESSAGE_RIGHTGOALPOST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace vision_msgs
{
template <class ContainerAllocator>
struct Rightgoalpost_
{
  typedef Rightgoalpost_<ContainerAllocator> Type;

  Rightgoalpost_()
    : found(false)
    , x(0)
    , y(0)
    , roi_width(0)
    , roi_height(0)  {
    }
  Rightgoalpost_(const ContainerAllocator& _alloc)
    : found(false)
    , x(0)
    , y(0)
    , roi_width(0)
    , roi_height(0)  {
  (void)_alloc;
    }



   typedef uint8_t _found_type;
  _found_type found;

   typedef int32_t _x_type;
  _x_type x;

   typedef int32_t _y_type;
  _y_type y;

   typedef int32_t _roi_width_type;
  _roi_width_type roi_width;

   typedef int32_t _roi_height_type;
  _roi_height_type roi_height;





  typedef boost::shared_ptr< ::vision_msgs::Rightgoalpost_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::vision_msgs::Rightgoalpost_<ContainerAllocator> const> ConstPtr;

}; // struct Rightgoalpost_

typedef ::vision_msgs::Rightgoalpost_<std::allocator<void> > Rightgoalpost;

typedef boost::shared_ptr< ::vision_msgs::Rightgoalpost > RightgoalpostPtr;
typedef boost::shared_ptr< ::vision_msgs::Rightgoalpost const> RightgoalpostConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::vision_msgs::Rightgoalpost_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::vision_msgs::Rightgoalpost_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::vision_msgs::Rightgoalpost_<ContainerAllocator1> & lhs, const ::vision_msgs::Rightgoalpost_<ContainerAllocator2> & rhs)
{
  return lhs.found == rhs.found &&
    lhs.x == rhs.x &&
    lhs.y == rhs.y &&
    lhs.roi_width == rhs.roi_width &&
    lhs.roi_height == rhs.roi_height;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::vision_msgs::Rightgoalpost_<ContainerAllocator1> & lhs, const ::vision_msgs::Rightgoalpost_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace vision_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::vision_msgs::Rightgoalpost_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::vision_msgs::Rightgoalpost_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::vision_msgs::Rightgoalpost_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::vision_msgs::Rightgoalpost_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vision_msgs::Rightgoalpost_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vision_msgs::Rightgoalpost_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::vision_msgs::Rightgoalpost_<ContainerAllocator> >
{
  static const char* value()
  {
    return "593e6a8c66231b4fe6d1d33cf452902c";
  }

  static const char* value(const ::vision_msgs::Rightgoalpost_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x593e6a8c66231b4fULL;
  static const uint64_t static_value2 = 0xe6d1d33cf452902cULL;
};

template<class ContainerAllocator>
struct DataType< ::vision_msgs::Rightgoalpost_<ContainerAllocator> >
{
  static const char* value()
  {
    return "vision_msgs/Rightgoalpost";
  }

  static const char* value(const ::vision_msgs::Rightgoalpost_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::vision_msgs::Rightgoalpost_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool found\n"
"int32 x\n"
"int32 y\n"
"int32 roi_width\n"
"int32 roi_height\n"
;
  }

  static const char* value(const ::vision_msgs::Rightgoalpost_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::vision_msgs::Rightgoalpost_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.found);
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.roi_width);
      stream.next(m.roi_height);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Rightgoalpost_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::vision_msgs::Rightgoalpost_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::vision_msgs::Rightgoalpost_<ContainerAllocator>& v)
  {
    s << indent << "found: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.found);
    s << indent << "x: ";
    Printer<int32_t>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<int32_t>::stream(s, indent + "  ", v.y);
    s << indent << "roi_width: ";
    Printer<int32_t>::stream(s, indent + "  ", v.roi_width);
    s << indent << "roi_height: ";
    Printer<int32_t>::stream(s, indent + "  ", v.roi_height);
  }
};

} // namespace message_operations
} // namespace ros

#endif // VISION_MSGS_MESSAGE_RIGHTGOALPOST_H
