// Generated by gencpp from file movement_msgs/PredefinedMovementSrv.msg
// DO NOT EDIT!


#ifndef MOVEMENT_MSGS_MESSAGE_PREDEFINEDMOVEMENTSRV_H
#define MOVEMENT_MSGS_MESSAGE_PREDEFINEDMOVEMENTSRV_H

#include <ros/service_traits.h>


#include <movement_msgs/PredefinedMovementSrvRequest.h>
#include <movement_msgs/PredefinedMovementSrvResponse.h>


namespace movement_msgs
{

struct PredefinedMovementSrv
{

typedef PredefinedMovementSrvRequest Request;
typedef PredefinedMovementSrvResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct PredefinedMovementSrv
} // namespace movement_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::movement_msgs::PredefinedMovementSrv > {
  static const char* value()
  {
    return "bfd977d15515237025d35499f550165a";
  }

  static const char* value(const ::movement_msgs::PredefinedMovementSrv&) { return value(); }
};

template<>
struct DataType< ::movement_msgs::PredefinedMovementSrv > {
  static const char* value()
  {
    return "movement_msgs/PredefinedMovementSrv";
  }

  static const char* value(const ::movement_msgs::PredefinedMovementSrv&) { return value(); }
};


// service_traits::MD5Sum< ::movement_msgs::PredefinedMovementSrvRequest> should match
// service_traits::MD5Sum< ::movement_msgs::PredefinedMovementSrv >
template<>
struct MD5Sum< ::movement_msgs::PredefinedMovementSrvRequest>
{
  static const char* value()
  {
    return MD5Sum< ::movement_msgs::PredefinedMovementSrv >::value();
  }
  static const char* value(const ::movement_msgs::PredefinedMovementSrvRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::movement_msgs::PredefinedMovementSrvRequest> should match
// service_traits::DataType< ::movement_msgs::PredefinedMovementSrv >
template<>
struct DataType< ::movement_msgs::PredefinedMovementSrvRequest>
{
  static const char* value()
  {
    return DataType< ::movement_msgs::PredefinedMovementSrv >::value();
  }
  static const char* value(const ::movement_msgs::PredefinedMovementSrvRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::movement_msgs::PredefinedMovementSrvResponse> should match
// service_traits::MD5Sum< ::movement_msgs::PredefinedMovementSrv >
template<>
struct MD5Sum< ::movement_msgs::PredefinedMovementSrvResponse>
{
  static const char* value()
  {
    return MD5Sum< ::movement_msgs::PredefinedMovementSrv >::value();
  }
  static const char* value(const ::movement_msgs::PredefinedMovementSrvResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::movement_msgs::PredefinedMovementSrvResponse> should match
// service_traits::DataType< ::movement_msgs::PredefinedMovementSrv >
template<>
struct DataType< ::movement_msgs::PredefinedMovementSrvResponse>
{
  static const char* value()
  {
    return DataType< ::movement_msgs::PredefinedMovementSrv >::value();
  }
  static const char* value(const ::movement_msgs::PredefinedMovementSrvResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MOVEMENT_MSGS_MESSAGE_PREDEFINEDMOVEMENTSRV_H
