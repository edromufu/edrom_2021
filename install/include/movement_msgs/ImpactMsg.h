// Generated by gencpp from file movement_msgs/ImpactMsg.msg
// DO NOT EDIT!


#ifndef MOVEMENT_MSGS_MESSAGE_IMPACTMSG_H
#define MOVEMENT_MSGS_MESSAGE_IMPACTMSG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace movement_msgs
{
template <class ContainerAllocator>
struct ImpactMsg_
{
  typedef ImpactMsg_<ContainerAllocator> Type;

  ImpactMsg_()
    : header()
    , torque3()
    , torque4()
    , torqueF()
    , force()
    , gyroX()
    , gyroY()
    , gyroZ()
    , accX()
    , accY()
    , accZ()
    , angX()
    , angY()  {
    }
  ImpactMsg_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , torque3(_alloc)
    , torque4(_alloc)
    , torqueF(_alloc)
    , force(_alloc)
    , gyroX(_alloc)
    , gyroY(_alloc)
    , gyroZ(_alloc)
    , accX(_alloc)
    , accY(_alloc)
    , accZ(_alloc)
    , angX(_alloc)
    , angY(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _torque3_type;
  _torque3_type torque3;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _torque4_type;
  _torque4_type torque4;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _torqueF_type;
  _torqueF_type torqueF;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _force_type;
  _force_type force;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _gyroX_type;
  _gyroX_type gyroX;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _gyroY_type;
  _gyroY_type gyroY;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _gyroZ_type;
  _gyroZ_type gyroZ;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _accX_type;
  _accX_type accX;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _accY_type;
  _accY_type accY;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _accZ_type;
  _accZ_type accZ;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _angX_type;
  _angX_type angX;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _angY_type;
  _angY_type angY;





  typedef boost::shared_ptr< ::movement_msgs::ImpactMsg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::movement_msgs::ImpactMsg_<ContainerAllocator> const> ConstPtr;

}; // struct ImpactMsg_

typedef ::movement_msgs::ImpactMsg_<std::allocator<void> > ImpactMsg;

typedef boost::shared_ptr< ::movement_msgs::ImpactMsg > ImpactMsgPtr;
typedef boost::shared_ptr< ::movement_msgs::ImpactMsg const> ImpactMsgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::movement_msgs::ImpactMsg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::movement_msgs::ImpactMsg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::movement_msgs::ImpactMsg_<ContainerAllocator1> & lhs, const ::movement_msgs::ImpactMsg_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.torque3 == rhs.torque3 &&
    lhs.torque4 == rhs.torque4 &&
    lhs.torqueF == rhs.torqueF &&
    lhs.force == rhs.force &&
    lhs.gyroX == rhs.gyroX &&
    lhs.gyroY == rhs.gyroY &&
    lhs.gyroZ == rhs.gyroZ &&
    lhs.accX == rhs.accX &&
    lhs.accY == rhs.accY &&
    lhs.accZ == rhs.accZ &&
    lhs.angX == rhs.angX &&
    lhs.angY == rhs.angY;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::movement_msgs::ImpactMsg_<ContainerAllocator1> & lhs, const ::movement_msgs::ImpactMsg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace movement_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::movement_msgs::ImpactMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::movement_msgs::ImpactMsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::movement_msgs::ImpactMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::movement_msgs::ImpactMsg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::movement_msgs::ImpactMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::movement_msgs::ImpactMsg_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::movement_msgs::ImpactMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "357f66bf5373be40bb62fd4edd456730";
  }

  static const char* value(const ::movement_msgs::ImpactMsg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x357f66bf5373be40ULL;
  static const uint64_t static_value2 = 0xbb62fd4edd456730ULL;
};

template<class ContainerAllocator>
struct DataType< ::movement_msgs::ImpactMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "movement_msgs/ImpactMsg";
  }

  static const char* value(const ::movement_msgs::ImpactMsg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::movement_msgs::ImpactMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header    header\n"
"\n"
"float64[]   torque3\n"
"float64[]   torque4\n"
"float64[]   torqueF\n"
"float64[]   force\n"
"float64[]   gyroX\n"
"float64[]   gyroY\n"
"float64[]   gyroZ\n"
"float64[]   accX\n"
"float64[]   accY\n"
"float64[]   accZ\n"
"float64[]   angX\n"
"float64[]   angY\n"
"\n"
"\n"
"\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::movement_msgs::ImpactMsg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::movement_msgs::ImpactMsg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.torque3);
      stream.next(m.torque4);
      stream.next(m.torqueF);
      stream.next(m.force);
      stream.next(m.gyroX);
      stream.next(m.gyroY);
      stream.next(m.gyroZ);
      stream.next(m.accX);
      stream.next(m.accY);
      stream.next(m.accZ);
      stream.next(m.angX);
      stream.next(m.angY);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ImpactMsg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::movement_msgs::ImpactMsg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::movement_msgs::ImpactMsg_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "torque3[]" << std::endl;
    for (size_t i = 0; i < v.torque3.size(); ++i)
    {
      s << indent << "  torque3[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.torque3[i]);
    }
    s << indent << "torque4[]" << std::endl;
    for (size_t i = 0; i < v.torque4.size(); ++i)
    {
      s << indent << "  torque4[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.torque4[i]);
    }
    s << indent << "torqueF[]" << std::endl;
    for (size_t i = 0; i < v.torqueF.size(); ++i)
    {
      s << indent << "  torqueF[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.torqueF[i]);
    }
    s << indent << "force[]" << std::endl;
    for (size_t i = 0; i < v.force.size(); ++i)
    {
      s << indent << "  force[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.force[i]);
    }
    s << indent << "gyroX[]" << std::endl;
    for (size_t i = 0; i < v.gyroX.size(); ++i)
    {
      s << indent << "  gyroX[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.gyroX[i]);
    }
    s << indent << "gyroY[]" << std::endl;
    for (size_t i = 0; i < v.gyroY.size(); ++i)
    {
      s << indent << "  gyroY[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.gyroY[i]);
    }
    s << indent << "gyroZ[]" << std::endl;
    for (size_t i = 0; i < v.gyroZ.size(); ++i)
    {
      s << indent << "  gyroZ[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.gyroZ[i]);
    }
    s << indent << "accX[]" << std::endl;
    for (size_t i = 0; i < v.accX.size(); ++i)
    {
      s << indent << "  accX[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.accX[i]);
    }
    s << indent << "accY[]" << std::endl;
    for (size_t i = 0; i < v.accY.size(); ++i)
    {
      s << indent << "  accY[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.accY[i]);
    }
    s << indent << "accZ[]" << std::endl;
    for (size_t i = 0; i < v.accZ.size(); ++i)
    {
      s << indent << "  accZ[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.accZ[i]);
    }
    s << indent << "angX[]" << std::endl;
    for (size_t i = 0; i < v.angX.size(); ++i)
    {
      s << indent << "  angX[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.angX[i]);
    }
    s << indent << "angY[]" << std::endl;
    for (size_t i = 0; i < v.angY.size(); ++i)
    {
      s << indent << "  angY[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.angY[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOVEMENT_MSGS_MESSAGE_IMPACTMSG_H
