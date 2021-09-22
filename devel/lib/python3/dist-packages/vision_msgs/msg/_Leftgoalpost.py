# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from vision_msgs/Leftgoalpost.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class Leftgoalpost(genpy.Message):
  _md5sum = "593e6a8c66231b4fe6d1d33cf452902c"
  _type = "vision_msgs/Leftgoalpost"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """bool found
int32 x
int32 y
int32 roi_width
int32 roi_height
"""
  __slots__ = ['found','x','y','roi_width','roi_height']
  _slot_types = ['bool','int32','int32','int32','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       found,x,y,roi_width,roi_height

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Leftgoalpost, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.found is None:
        self.found = False
      if self.x is None:
        self.x = 0
      if self.y is None:
        self.y = 0
      if self.roi_width is None:
        self.roi_width = 0
      if self.roi_height is None:
        self.roi_height = 0
    else:
      self.found = False
      self.x = 0
      self.y = 0
      self.roi_width = 0
      self.roi_height = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_B4i().pack(_x.found, _x.x, _x.y, _x.roi_width, _x.roi_height))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 17
      (_x.found, _x.x, _x.y, _x.roi_width, _x.roi_height,) = _get_struct_B4i().unpack(str[start:end])
      self.found = bool(self.found)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_B4i().pack(_x.found, _x.x, _x.y, _x.roi_width, _x.roi_height))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 17
      (_x.found, _x.x, _x.y, _x.roi_width, _x.roi_height,) = _get_struct_B4i().unpack(str[start:end])
      self.found = bool(self.found)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_B4i = None
def _get_struct_B4i():
    global _struct_B4i
    if _struct_B4i is None:
        _struct_B4i = struct.Struct("<B4i")
    return _struct_B4i
