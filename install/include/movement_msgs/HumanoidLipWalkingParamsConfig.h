//#line 2 "/opt/ros/noetic/share/dynamic_reconfigure/cmake/../templates/ConfigType.h.template"
// *********************************************************
//
// File autogenerated for the movement_msgs package
// by the dynamic_reconfigure package.
// Please do not edit.
//
// ********************************************************/

#ifndef __movement_msgs__HUMANOIDLIPWALKINGPARAMSCONFIG_H__
#define __movement_msgs__HUMANOIDLIPWALKINGPARAMSCONFIG_H__

#if __cplusplus >= 201103L
#define DYNAMIC_RECONFIGURE_FINAL final
#else
#define DYNAMIC_RECONFIGURE_FINAL
#endif

#include <dynamic_reconfigure/config_tools.h>
#include <limits>
#include <ros/node_handle.h>
#include <dynamic_reconfigure/ConfigDescription.h>
#include <dynamic_reconfigure/ParamDescription.h>
#include <dynamic_reconfigure/Group.h>
#include <dynamic_reconfigure/config_init_mutex.h>
#include <boost/any.hpp>

namespace movement_msgs
{
  class HumanoidLipWalkingParamsConfigStatics;

  class HumanoidLipWalkingParamsConfig
  {
  public:
    class AbstractParamDescription : public dynamic_reconfigure::ParamDescription
    {
    public:
      AbstractParamDescription(std::string n, std::string t, uint32_t l,
          std::string d, std::string e)
      {
        name = n;
        type = t;
        level = l;
        description = d;
        edit_method = e;
      }
      virtual ~AbstractParamDescription() = default;

      virtual void clamp(HumanoidLipWalkingParamsConfig &config, const HumanoidLipWalkingParamsConfig &max, const HumanoidLipWalkingParamsConfig &min) const = 0;
      virtual void calcLevel(uint32_t &level, const HumanoidLipWalkingParamsConfig &config1, const HumanoidLipWalkingParamsConfig &config2) const = 0;
      virtual void fromServer(const ros::NodeHandle &nh, HumanoidLipWalkingParamsConfig &config) const = 0;
      virtual void toServer(const ros::NodeHandle &nh, const HumanoidLipWalkingParamsConfig &config) const = 0;
      virtual bool fromMessage(const dynamic_reconfigure::Config &msg, HumanoidLipWalkingParamsConfig &config) const = 0;
      virtual void toMessage(dynamic_reconfigure::Config &msg, const HumanoidLipWalkingParamsConfig &config) const = 0;
      virtual void getValue(const HumanoidLipWalkingParamsConfig &config, boost::any &val) const = 0;
    };

    typedef boost::shared_ptr<AbstractParamDescription> AbstractParamDescriptionPtr;
    typedef boost::shared_ptr<const AbstractParamDescription> AbstractParamDescriptionConstPtr;

    // Final keyword added to class because it has virtual methods and inherits
    // from a class with a non-virtual destructor.
    template <class T>
    class ParamDescription DYNAMIC_RECONFIGURE_FINAL : public AbstractParamDescription
    {
    public:
      ParamDescription(std::string a_name, std::string a_type, uint32_t a_level,
          std::string a_description, std::string a_edit_method, T HumanoidLipWalkingParamsConfig::* a_f) :
        AbstractParamDescription(a_name, a_type, a_level, a_description, a_edit_method),
        field(a_f)
      {}

      T HumanoidLipWalkingParamsConfig::* field;

      virtual void clamp(HumanoidLipWalkingParamsConfig &config, const HumanoidLipWalkingParamsConfig &max, const HumanoidLipWalkingParamsConfig &min) const override
      {
        if (config.*field > max.*field)
          config.*field = max.*field;

        if (config.*field < min.*field)
          config.*field = min.*field;
      }

      virtual void calcLevel(uint32_t &comb_level, const HumanoidLipWalkingParamsConfig &config1, const HumanoidLipWalkingParamsConfig &config2) const override
      {
        if (config1.*field != config2.*field)
          comb_level |= level;
      }

      virtual void fromServer(const ros::NodeHandle &nh, HumanoidLipWalkingParamsConfig &config) const override
      {
        nh.getParam(name, config.*field);
      }

      virtual void toServer(const ros::NodeHandle &nh, const HumanoidLipWalkingParamsConfig &config) const override
      {
        nh.setParam(name, config.*field);
      }

      virtual bool fromMessage(const dynamic_reconfigure::Config &msg, HumanoidLipWalkingParamsConfig &config) const override
      {
        return dynamic_reconfigure::ConfigTools::getParameter(msg, name, config.*field);
      }

      virtual void toMessage(dynamic_reconfigure::Config &msg, const HumanoidLipWalkingParamsConfig &config) const override
      {
        dynamic_reconfigure::ConfigTools::appendParameter(msg, name, config.*field);
      }

      virtual void getValue(const HumanoidLipWalkingParamsConfig &config, boost::any &val) const override
      {
        val = config.*field;
      }
    };

    class AbstractGroupDescription : public dynamic_reconfigure::Group
    {
      public:
      AbstractGroupDescription(std::string n, std::string t, int p, int i, bool s)
      {
        name = n;
        type = t;
        parent = p;
        state = s;
        id = i;
      }

      virtual ~AbstractGroupDescription() = default;

      std::vector<AbstractParamDescriptionConstPtr> abstract_parameters;
      bool state;

      virtual void toMessage(dynamic_reconfigure::Config &msg, const boost::any &config) const = 0;
      virtual bool fromMessage(const dynamic_reconfigure::Config &msg, boost::any &config) const =0;
      virtual void updateParams(boost::any &cfg, HumanoidLipWalkingParamsConfig &top) const= 0;
      virtual void setInitialState(boost::any &cfg) const = 0;


      void convertParams()
      {
        for(std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = abstract_parameters.begin(); i != abstract_parameters.end(); ++i)
        {
          parameters.push_back(dynamic_reconfigure::ParamDescription(**i));
        }
      }
    };

    typedef boost::shared_ptr<AbstractGroupDescription> AbstractGroupDescriptionPtr;
    typedef boost::shared_ptr<const AbstractGroupDescription> AbstractGroupDescriptionConstPtr;

    // Final keyword added to class because it has virtual methods and inherits
    // from a class with a non-virtual destructor.
    template<class T, class PT>
    class GroupDescription DYNAMIC_RECONFIGURE_FINAL : public AbstractGroupDescription
    {
    public:
      GroupDescription(std::string a_name, std::string a_type, int a_parent, int a_id, bool a_s, T PT::* a_f) : AbstractGroupDescription(a_name, a_type, a_parent, a_id, a_s), field(a_f)
      {
      }

      GroupDescription(const GroupDescription<T, PT>& g): AbstractGroupDescription(g.name, g.type, g.parent, g.id, g.state), field(g.field), groups(g.groups)
      {
        parameters = g.parameters;
        abstract_parameters = g.abstract_parameters;
      }

      virtual bool fromMessage(const dynamic_reconfigure::Config &msg, boost::any &cfg) const override
      {
        PT* config = boost::any_cast<PT*>(cfg);
        if(!dynamic_reconfigure::ConfigTools::getGroupState(msg, name, (*config).*field))
          return false;

        for(std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = groups.begin(); i != groups.end(); ++i)
        {
          boost::any n = &((*config).*field);
          if(!(*i)->fromMessage(msg, n))
            return false;
        }

        return true;
      }

      virtual void setInitialState(boost::any &cfg) const override
      {
        PT* config = boost::any_cast<PT*>(cfg);
        T* group = &((*config).*field);
        group->state = state;

        for(std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = groups.begin(); i != groups.end(); ++i)
        {
          boost::any n = boost::any(&((*config).*field));
          (*i)->setInitialState(n);
        }

      }

      virtual void updateParams(boost::any &cfg, HumanoidLipWalkingParamsConfig &top) const override
      {
        PT* config = boost::any_cast<PT*>(cfg);

        T* f = &((*config).*field);
        f->setParams(top, abstract_parameters);

        for(std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = groups.begin(); i != groups.end(); ++i)
        {
          boost::any n = &((*config).*field);
          (*i)->updateParams(n, top);
        }
      }

      virtual void toMessage(dynamic_reconfigure::Config &msg, const boost::any &cfg) const override
      {
        const PT config = boost::any_cast<PT>(cfg);
        dynamic_reconfigure::ConfigTools::appendGroup<T>(msg, name, id, parent, config.*field);

        for(std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = groups.begin(); i != groups.end(); ++i)
        {
          (*i)->toMessage(msg, config.*field);
        }
      }

      T PT::* field;
      std::vector<HumanoidLipWalkingParamsConfig::AbstractGroupDescriptionConstPtr> groups;
    };

class DEFAULT
{
  public:
    DEFAULT()
    {
      state = true;
      name = "Default";
    }

    void setParams(HumanoidLipWalkingParamsConfig &config, const std::vector<AbstractParamDescriptionConstPtr> params)
    {
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator _i = params.begin(); _i != params.end(); ++_i)
      {
        boost::any val;
        (*_i)->getValue(config, val);

        if("dt"==(*_i)->name){dt = boost::any_cast<double>(val);}
        if("lip_dt"==(*_i)->name){lip_dt = boost::any_cast<double>(val);}
        if("tS"==(*_i)->name){tS = boost::any_cast<double>(val);}
        if("tD"==(*_i)->name){tD = boost::any_cast<double>(val);}
        if("stepH"==(*_i)->name){stepH = boost::any_cast<double>(val);}
        if("zCCorr"==(*_i)->name){zCCorr = boost::any_cast<double>(val);}
        if("sinFreq"==(*_i)->name){sinFreq = boost::any_cast<double>(val);}
        if("sinAmp"==(*_i)->name){sinAmp = boost::any_cast<double>(val);}
        if("sinPhase"==(*_i)->name){sinPhase = boost::any_cast<double>(val);}
        if("curve"==(*_i)->name){curve = boost::any_cast<int>(val);}
      }
    }

    double dt;
double lip_dt;
double tS;
double tD;
double stepH;
double zCCorr;
double sinFreq;
double sinAmp;
double sinPhase;
int curve;

    bool state;
    std::string name;

    
}groups;



//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double dt;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double lip_dt;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double tS;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double tD;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double stepH;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double zCCorr;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double sinFreq;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double sinAmp;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double sinPhase;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      int curve;
//#line 231 "/opt/ros/noetic/share/dynamic_reconfigure/cmake/../templates/ConfigType.h.template"

    bool __fromMessage__(dynamic_reconfigure::Config &msg)
    {
      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      const std::vector<AbstractGroupDescriptionConstPtr> &__group_descriptions__ = __getGroupDescriptions__();

      int count = 0;
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        if ((*i)->fromMessage(msg, *this))
          count++;

      for (std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = __group_descriptions__.begin(); i != __group_descriptions__.end(); i ++)
      {
        if ((*i)->id == 0)
        {
          boost::any n = boost::any(this);
          (*i)->updateParams(n, *this);
          (*i)->fromMessage(msg, n);
        }
      }

      if (count != dynamic_reconfigure::ConfigTools::size(msg))
      {
        ROS_ERROR("HumanoidLipWalkingParamsConfig::__fromMessage__ called with an unexpected parameter.");
        ROS_ERROR("Booleans:");
        for (unsigned int i = 0; i < msg.bools.size(); i++)
          ROS_ERROR("  %s", msg.bools[i].name.c_str());
        ROS_ERROR("Integers:");
        for (unsigned int i = 0; i < msg.ints.size(); i++)
          ROS_ERROR("  %s", msg.ints[i].name.c_str());
        ROS_ERROR("Doubles:");
        for (unsigned int i = 0; i < msg.doubles.size(); i++)
          ROS_ERROR("  %s", msg.doubles[i].name.c_str());
        ROS_ERROR("Strings:");
        for (unsigned int i = 0; i < msg.strs.size(); i++)
          ROS_ERROR("  %s", msg.strs[i].name.c_str());
        // @todo Check that there are no duplicates. Make this error more
        // explicit.
        return false;
      }
      return true;
    }

    // This version of __toMessage__ is used during initialization of
    // statics when __getParamDescriptions__ can't be called yet.
    void __toMessage__(dynamic_reconfigure::Config &msg, const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__, const std::vector<AbstractGroupDescriptionConstPtr> &__group_descriptions__) const
    {
      dynamic_reconfigure::ConfigTools::clear(msg);
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        (*i)->toMessage(msg, *this);

      for (std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = __group_descriptions__.begin(); i != __group_descriptions__.end(); ++i)
      {
        if((*i)->id == 0)
        {
          (*i)->toMessage(msg, *this);
        }
      }
    }

    void __toMessage__(dynamic_reconfigure::Config &msg) const
    {
      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      const std::vector<AbstractGroupDescriptionConstPtr> &__group_descriptions__ = __getGroupDescriptions__();
      __toMessage__(msg, __param_descriptions__, __group_descriptions__);
    }

    void __toServer__(const ros::NodeHandle &nh) const
    {
      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        (*i)->toServer(nh, *this);
    }

    void __fromServer__(const ros::NodeHandle &nh)
    {
      static bool setup=false;

      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        (*i)->fromServer(nh, *this);

      const std::vector<AbstractGroupDescriptionConstPtr> &__group_descriptions__ = __getGroupDescriptions__();
      for (std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = __group_descriptions__.begin(); i != __group_descriptions__.end(); i++){
        if (!setup && (*i)->id == 0) {
          setup = true;
          boost::any n = boost::any(this);
          (*i)->setInitialState(n);
        }
      }
    }

    void __clamp__()
    {
      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      const HumanoidLipWalkingParamsConfig &__max__ = __getMax__();
      const HumanoidLipWalkingParamsConfig &__min__ = __getMin__();
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        (*i)->clamp(*this, __max__, __min__);
    }

    uint32_t __level__(const HumanoidLipWalkingParamsConfig &config) const
    {
      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      uint32_t level = 0;
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        (*i)->calcLevel(level, config, *this);
      return level;
    }

    static const dynamic_reconfigure::ConfigDescription &__getDescriptionMessage__();
    static const HumanoidLipWalkingParamsConfig &__getDefault__();
    static const HumanoidLipWalkingParamsConfig &__getMax__();
    static const HumanoidLipWalkingParamsConfig &__getMin__();
    static const std::vector<AbstractParamDescriptionConstPtr> &__getParamDescriptions__();
    static const std::vector<AbstractGroupDescriptionConstPtr> &__getGroupDescriptions__();

  private:
    static const HumanoidLipWalkingParamsConfigStatics *__get_statics__();
  };

  template <> // Max and min are ignored for strings.
  inline void HumanoidLipWalkingParamsConfig::ParamDescription<std::string>::clamp(HumanoidLipWalkingParamsConfig &config, const HumanoidLipWalkingParamsConfig &max, const HumanoidLipWalkingParamsConfig &min) const
  {
    (void) config;
    (void) min;
    (void) max;
    return;
  }

  class HumanoidLipWalkingParamsConfigStatics
  {
    friend class HumanoidLipWalkingParamsConfig;

    HumanoidLipWalkingParamsConfigStatics()
    {
HumanoidLipWalkingParamsConfig::GroupDescription<HumanoidLipWalkingParamsConfig::DEFAULT, HumanoidLipWalkingParamsConfig> Default("Default", "", 0, 0, true, &HumanoidLipWalkingParamsConfig::groups);
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.dt = 0.001;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.dt = 0.1;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.dt = 0.07;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("dt", "double", 0, "Update Time", "", &HumanoidLipWalkingParamsConfig::dt)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("dt", "double", 0, "Update Time", "", &HumanoidLipWalkingParamsConfig::dt)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.lip_dt = 0.001;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.lip_dt = 0.1;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.lip_dt = 0.005;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("lip_dt", "double", 0, "Update Lip Time", "", &HumanoidLipWalkingParamsConfig::lip_dt)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("lip_dt", "double", 0, "Update Lip Time", "", &HumanoidLipWalkingParamsConfig::lip_dt)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.tS = 0.1;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.tS = 2.0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.tS = 0.3;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("tS", "double", 1, "Time for Single Support", "", &HumanoidLipWalkingParamsConfig::tS)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("tS", "double", 1, "Time for Single Support", "", &HumanoidLipWalkingParamsConfig::tS)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.tD = 0.0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.tD = 1.0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.tD = 0.1;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("tD", "double", 2, "Time for Double Support", "", &HumanoidLipWalkingParamsConfig::tD)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("tD", "double", 2, "Time for Double Support", "", &HumanoidLipWalkingParamsConfig::tD)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.stepH = 0.0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.stepH = 0.1;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.stepH = 0.05;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("stepH", "double", 4, "Step Height", "", &HumanoidLipWalkingParamsConfig::stepH)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("stepH", "double", 4, "Step Height", "", &HumanoidLipWalkingParamsConfig::stepH)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.zCCorr = 0.1;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.zCCorr = 3.0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.zCCorr = 1.0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("zCCorr", "double", 6, "Correction for the COM Height", "", &HumanoidLipWalkingParamsConfig::zCCorr)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("zCCorr", "double", 6, "Correction for the COM Height", "", &HumanoidLipWalkingParamsConfig::zCCorr)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.sinFreq = 0.0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.sinFreq = 10.0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.sinFreq = 1.0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("sinFreq", "double", 7, "Sin Freq", "", &HumanoidLipWalkingParamsConfig::sinFreq)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("sinFreq", "double", 7, "Sin Freq", "", &HumanoidLipWalkingParamsConfig::sinFreq)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.sinAmp = -15.0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.sinAmp = 15.0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.sinAmp = 0.0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("sinAmp", "double", 8, "Sin Amplitude", "", &HumanoidLipWalkingParamsConfig::sinAmp)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("sinAmp", "double", 8, "Sin Amplitude", "", &HumanoidLipWalkingParamsConfig::sinAmp)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.sinPhase = -1.0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.sinPhase = 1.0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.sinPhase = 0.0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("sinPhase", "double", 8, "Sin Phase", "", &HumanoidLipWalkingParamsConfig::sinPhase)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<double>("sinPhase", "double", 8, "Sin Phase", "", &HumanoidLipWalkingParamsConfig::sinPhase)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.curve = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.curve = 2;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.curve = 1;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<int>("curve", "int", 0, "The type of curve", "{'enum': [{'name': 'SIN', 'type': 'int', 'value': 0, 'srcline': 17, 'srcfile': '/home/kirlin/edrom/src/movement/movement_msgs/cfg/HumanoidLipWalkingParams.cfg', 'description': 'SIN CURVE', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'SIN_2', 'type': 'int', 'value': 1, 'srcline': 18, 'srcfile': '/home/kirlin/edrom/src/movement/movement_msgs/cfg/HumanoidLipWalkingParams.cfg', 'description': 'SIN SQUARED CURVE', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'CUSTOM', 'type': 'int', 'value': 2, 'srcline': 19, 'srcfile': '/home/kirlin/edrom/src/movement/movement_msgs/cfg/HumanoidLipWalkingParams.cfg', 'description': 'CUSTOM CURVE', 'ctype': 'int', 'cconsttype': 'const int'}], 'enum_description': 'CURVE TYPE'}", &HumanoidLipWalkingParamsConfig::curve)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::ParamDescription<int>("curve", "int", 0, "The type of curve", "{'enum': [{'name': 'SIN', 'type': 'int', 'value': 0, 'srcline': 17, 'srcfile': '/home/kirlin/edrom/src/movement/movement_msgs/cfg/HumanoidLipWalkingParams.cfg', 'description': 'SIN CURVE', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'SIN_2', 'type': 'int', 'value': 1, 'srcline': 18, 'srcfile': '/home/kirlin/edrom/src/movement/movement_msgs/cfg/HumanoidLipWalkingParams.cfg', 'description': 'SIN SQUARED CURVE', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'CUSTOM', 'type': 'int', 'value': 2, 'srcline': 19, 'srcfile': '/home/kirlin/edrom/src/movement/movement_msgs/cfg/HumanoidLipWalkingParams.cfg', 'description': 'CUSTOM CURVE', 'ctype': 'int', 'cconsttype': 'const int'}], 'enum_description': 'CURVE TYPE'}", &HumanoidLipWalkingParamsConfig::curve)));
//#line 246 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.convertParams();
//#line 246 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __group_descriptions__.push_back(HumanoidLipWalkingParamsConfig::AbstractGroupDescriptionConstPtr(new HumanoidLipWalkingParamsConfig::GroupDescription<HumanoidLipWalkingParamsConfig::DEFAULT, HumanoidLipWalkingParamsConfig>(Default)));
//#line 369 "/opt/ros/noetic/share/dynamic_reconfigure/cmake/../templates/ConfigType.h.template"

      for (std::vector<HumanoidLipWalkingParamsConfig::AbstractGroupDescriptionConstPtr>::const_iterator i = __group_descriptions__.begin(); i != __group_descriptions__.end(); ++i)
      {
        __description_message__.groups.push_back(**i);
      }
      __max__.__toMessage__(__description_message__.max, __param_descriptions__, __group_descriptions__);
      __min__.__toMessage__(__description_message__.min, __param_descriptions__, __group_descriptions__);
      __default__.__toMessage__(__description_message__.dflt, __param_descriptions__, __group_descriptions__);
    }
    std::vector<HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr> __param_descriptions__;
    std::vector<HumanoidLipWalkingParamsConfig::AbstractGroupDescriptionConstPtr> __group_descriptions__;
    HumanoidLipWalkingParamsConfig __max__;
    HumanoidLipWalkingParamsConfig __min__;
    HumanoidLipWalkingParamsConfig __default__;
    dynamic_reconfigure::ConfigDescription __description_message__;

    static const HumanoidLipWalkingParamsConfigStatics *get_instance()
    {
      // Split this off in a separate function because I know that
      // instance will get initialized the first time get_instance is
      // called, and I am guaranteeing that get_instance gets called at
      // most once.
      static HumanoidLipWalkingParamsConfigStatics instance;
      return &instance;
    }
  };

  inline const dynamic_reconfigure::ConfigDescription &HumanoidLipWalkingParamsConfig::__getDescriptionMessage__()
  {
    return __get_statics__()->__description_message__;
  }

  inline const HumanoidLipWalkingParamsConfig &HumanoidLipWalkingParamsConfig::__getDefault__()
  {
    return __get_statics__()->__default__;
  }

  inline const HumanoidLipWalkingParamsConfig &HumanoidLipWalkingParamsConfig::__getMax__()
  {
    return __get_statics__()->__max__;
  }

  inline const HumanoidLipWalkingParamsConfig &HumanoidLipWalkingParamsConfig::__getMin__()
  {
    return __get_statics__()->__min__;
  }

  inline const std::vector<HumanoidLipWalkingParamsConfig::AbstractParamDescriptionConstPtr> &HumanoidLipWalkingParamsConfig::__getParamDescriptions__()
  {
    return __get_statics__()->__param_descriptions__;
  }

  inline const std::vector<HumanoidLipWalkingParamsConfig::AbstractGroupDescriptionConstPtr> &HumanoidLipWalkingParamsConfig::__getGroupDescriptions__()
  {
    return __get_statics__()->__group_descriptions__;
  }

  inline const HumanoidLipWalkingParamsConfigStatics *HumanoidLipWalkingParamsConfig::__get_statics__()
  {
    const static HumanoidLipWalkingParamsConfigStatics *statics;

    if (statics) // Common case
      return statics;

    boost::mutex::scoped_lock lock(dynamic_reconfigure::__init_mutex__);

    if (statics) // In case we lost a race.
      return statics;

    statics = HumanoidLipWalkingParamsConfigStatics::get_instance();

    return statics;
  }

//#line 17 "/home/kirlin/edrom/src/movement/movement_msgs/cfg/HumanoidLipWalkingParams.cfg"
      const int HumanoidLipWalkingParams_SIN = 0;
//#line 18 "/home/kirlin/edrom/src/movement/movement_msgs/cfg/HumanoidLipWalkingParams.cfg"
      const int HumanoidLipWalkingParams_SIN_2 = 1;
//#line 19 "/home/kirlin/edrom/src/movement/movement_msgs/cfg/HumanoidLipWalkingParams.cfg"
      const int HumanoidLipWalkingParams_CUSTOM = 2;
}

#undef DYNAMIC_RECONFIGURE_FINAL

#endif // __HUMANOIDLIPWALKINGPARAMSRECONFIGURATOR_H__
