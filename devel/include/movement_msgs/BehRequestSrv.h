// Generated by gencpp from file movement_msgs/BehRequestSrv.msg
// DO NOT EDIT!


#ifndef MOVEMENT_MSGS_MESSAGE_BEHREQUESTSRV_H
#define MOVEMENT_MSGS_MESSAGE_BEHREQUESTSRV_H

#include <ros/service_traits.h>


#include <movement_msgs/BehRequestSrvRequest.h>
#include <movement_msgs/BehRequestSrvResponse.h>


namespace movement_msgs
{

struct BehRequestSrv
{

typedef BehRequestSrvRequest Request;
typedef BehRequestSrvResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct BehRequestSrv
} // namespace movement_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::movement_msgs::BehRequestSrv > {
  static const char* value()
  {
    return "147c59713af21eb742ab556d1988f274";
  }

  static const char* value(const ::movement_msgs::BehRequestSrv&) { return value(); }
};

template<>
struct DataType< ::movement_msgs::BehRequestSrv > {
  static const char* value()
  {
    return "movement_msgs/BehRequestSrv";
  }

  static const char* value(const ::movement_msgs::BehRequestSrv&) { return value(); }
};


// service_traits::MD5Sum< ::movement_msgs::BehRequestSrvRequest> should match
// service_traits::MD5Sum< ::movement_msgs::BehRequestSrv >
template<>
struct MD5Sum< ::movement_msgs::BehRequestSrvRequest>
{
  static const char* value()
  {
    return MD5Sum< ::movement_msgs::BehRequestSrv >::value();
  }
  static const char* value(const ::movement_msgs::BehRequestSrvRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::movement_msgs::BehRequestSrvRequest> should match
// service_traits::DataType< ::movement_msgs::BehRequestSrv >
template<>
struct DataType< ::movement_msgs::BehRequestSrvRequest>
{
  static const char* value()
  {
    return DataType< ::movement_msgs::BehRequestSrv >::value();
  }
  static const char* value(const ::movement_msgs::BehRequestSrvRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::movement_msgs::BehRequestSrvResponse> should match
// service_traits::MD5Sum< ::movement_msgs::BehRequestSrv >
template<>
struct MD5Sum< ::movement_msgs::BehRequestSrvResponse>
{
  static const char* value()
  {
    return MD5Sum< ::movement_msgs::BehRequestSrv >::value();
  }
  static const char* value(const ::movement_msgs::BehRequestSrvResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::movement_msgs::BehRequestSrvResponse> should match
// service_traits::DataType< ::movement_msgs::BehRequestSrv >
template<>
struct DataType< ::movement_msgs::BehRequestSrvResponse>
{
  static const char* value()
  {
    return DataType< ::movement_msgs::BehRequestSrv >::value();
  }
  static const char* value(const ::movement_msgs::BehRequestSrvResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MOVEMENT_MSGS_MESSAGE_BEHREQUESTSRV_H
