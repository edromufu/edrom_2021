## *********************************************************
##
## File autogenerated for the movement_msgs package
## by the dynamic_reconfigure package.
## Please do not edit.
##
## ********************************************************/

from dynamic_reconfigure.encoding import extract_params

inf = float('inf')

config_description = {'name': 'Default', 'type': '', 'state': True, 'cstate': 'true', 'id': 0, 'parent': 0, 'parameters': [{'name': 'rArm0', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'rArm0', 'min': -90.0, 'max': 90.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'rArm1', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'rArm1', 'min': 0.0, 'max': 90.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'rArm2', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'rArm2', 'min': -90.0, 'max': 90.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'lArm0', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'lArm0', 'min': -90.0, 'max': 90.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'lArm1', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'lArm1', 'min': 0.0, 'max': 90.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'lArm2', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'lArm2', 'min': -90.0, 'max': 90.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'rFootX', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'rFootX', 'min': -0.3, 'max': 0.3, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'rFootY', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'rFootY', 'min': -0.3, 'max': 0.3, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'rFootZ', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'rFootZ', 'min': 0.0, 'max': 0.45, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'rFootRX', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'rFootRX', 'min': -60.0, 'max': 60.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'rFootRY', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'rFootRY', 'min': -60.0, 'max': 60.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'rFootRZ', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'rFootRZ', 'min': -60.0, 'max': 60.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'lFootX', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'lFootX', 'min': -0.3, 'max': 0.3, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'lFootY', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'lFootY', 'min': -0.3, 'max': 0.3, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'lFootZ', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'lFootZ', 'min': 0.0, 'max': 0.45, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'lFootRX', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'lFootRX', 'min': -60.0, 'max': 60.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'lFootRY', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'lFootRY', 'min': -60.0, 'max': 60.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'lFootRZ', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'lFootRZ', 'min': -60.0, 'max': 60.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'on', 'type': 'bool', 'default': False, 'level': 0, 'description': 'Use IK for pose creating', 'min': False, 'max': True, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'bool', 'cconsttype': 'const bool'}, {'name': 'toJointState', 'type': 'bool', 'default': False, 'level': 0, 'description': 'send the current pose to jointState topic', 'min': False, 'max': True, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'bool', 'cconsttype': 'const bool'}, {'name': 'toMotorState', 'type': 'bool', 'default': False, 'level': 0, 'description': 'send the current pose to get_jointState topic', 'min': False, 'max': True, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'bool', 'cconsttype': 'const bool'}], 'groups': [], 'srcline': 246, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'class': 'DEFAULT', 'parentclass': '', 'parentname': 'Default', 'field': 'default', 'upper': 'DEFAULT', 'lower': 'groups'}

min = {}
max = {}
defaults = {}
level = {}
type = {}
all_level = 0

#def extract_params(config):
#    params = []
#    params.extend(config['parameters'])
#    for group in config['groups']:
#        params.extend(extract_params(group))
#    return params

for param in extract_params(config_description):
    min[param['name']] = param['min']
    max[param['name']] = param['max']
    defaults[param['name']] = param['default']
    level[param['name']] = param['level']
    type[param['name']] = param['type']
    all_level = all_level | param['level']

