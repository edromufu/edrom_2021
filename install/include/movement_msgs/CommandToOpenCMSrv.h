// Generated by gencpp from file movement_msgs/CommandToOpenCMSrv.msg
// DO NOT EDIT!


#ifndef MOVEMENT_MSGS_MESSAGE_COMMANDTOOPENCMSRV_H
#define MOVEMENT_MSGS_MESSAGE_COMMANDTOOPENCMSRV_H

#include <ros/service_traits.h>


#include <movement_msgs/CommandToOpenCMSrvRequest.h>
#include <movement_msgs/CommandToOpenCMSrvResponse.h>


namespace movement_msgs
{

struct CommandToOpenCMSrv
{

typedef CommandToOpenCMSrvRequest Request;
typedef CommandToOpenCMSrvResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct CommandToOpenCMSrv
} // namespace movement_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::movement_msgs::CommandToOpenCMSrv > {
  static const char* value()
  {
    return "4de78da2a6cc02a56fee1788f2bfe738";
  }

  static const char* value(const ::movement_msgs::CommandToOpenCMSrv&) { return value(); }
};

template<>
struct DataType< ::movement_msgs::CommandToOpenCMSrv > {
  static const char* value()
  {
    return "movement_msgs/CommandToOpenCMSrv";
  }

  static const char* value(const ::movement_msgs::CommandToOpenCMSrv&) { return value(); }
};


// service_traits::MD5Sum< ::movement_msgs::CommandToOpenCMSrvRequest> should match
// service_traits::MD5Sum< ::movement_msgs::CommandToOpenCMSrv >
template<>
struct MD5Sum< ::movement_msgs::CommandToOpenCMSrvRequest>
{
  static const char* value()
  {
    return MD5Sum< ::movement_msgs::CommandToOpenCMSrv >::value();
  }
  static const char* value(const ::movement_msgs::CommandToOpenCMSrvRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::movement_msgs::CommandToOpenCMSrvRequest> should match
// service_traits::DataType< ::movement_msgs::CommandToOpenCMSrv >
template<>
struct DataType< ::movement_msgs::CommandToOpenCMSrvRequest>
{
  static const char* value()
  {
    return DataType< ::movement_msgs::CommandToOpenCMSrv >::value();
  }
  static const char* value(const ::movement_msgs::CommandToOpenCMSrvRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::movement_msgs::CommandToOpenCMSrvResponse> should match
// service_traits::MD5Sum< ::movement_msgs::CommandToOpenCMSrv >
template<>
struct MD5Sum< ::movement_msgs::CommandToOpenCMSrvResponse>
{
  static const char* value()
  {
    return MD5Sum< ::movement_msgs::CommandToOpenCMSrv >::value();
  }
  static const char* value(const ::movement_msgs::CommandToOpenCMSrvResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::movement_msgs::CommandToOpenCMSrvResponse> should match
// service_traits::DataType< ::movement_msgs::CommandToOpenCMSrv >
template<>
struct DataType< ::movement_msgs::CommandToOpenCMSrvResponse>
{
  static const char* value()
  {
    return DataType< ::movement_msgs::CommandToOpenCMSrv >::value();
  }
  static const char* value(const ::movement_msgs::CommandToOpenCMSrvResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MOVEMENT_MSGS_MESSAGE_COMMANDTOOPENCMSRV_H
