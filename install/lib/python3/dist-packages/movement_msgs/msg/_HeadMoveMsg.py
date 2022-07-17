# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from movement_msgs/HeadMoveMsg.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class HeadMoveMsg(genpy.Message):
  _md5sum = "cfc3b4f883111d2901b09d0640ace5ea"
  _type = "movement_msgs/HeadMoveMsg"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """int32    xMove  
int32    yMove
int16	 pos
float64  xPos
float64  yPos
"""
  __slots__ = ['xMove','yMove','pos','xPos','yPos']
  _slot_types = ['int32','int32','int16','float64','float64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       xMove,yMove,pos,xPos,yPos

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(HeadMoveMsg, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.xMove is None:
        self.xMove = 0
      if self.yMove is None:
        self.yMove = 0
      if self.pos is None:
        self.pos = 0
      if self.xPos is None:
        self.xPos = 0.
      if self.yPos is None:
        self.yPos = 0.
    else:
      self.xMove = 0
      self.yMove = 0
      self.pos = 0
      self.xPos = 0.
      self.yPos = 0.

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
      buff.write(_get_struct_2ih2d().pack(_x.xMove, _x.yMove, _x.pos, _x.xPos, _x.yPos))
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
      end += 26
      (_x.xMove, _x.yMove, _x.pos, _x.xPos, _x.yPos,) = _get_struct_2ih2d().unpack(str[start:end])
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
      buff.write(_get_struct_2ih2d().pack(_x.xMove, _x.yMove, _x.pos, _x.xPos, _x.yPos))
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
      end += 26
      (_x.xMove, _x.yMove, _x.pos, _x.xPos, _x.yPos,) = _get_struct_2ih2d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2ih2d = None
def _get_struct_2ih2d():
    global _struct_2ih2d
    if _struct_2ih2d is None:
        _struct_2ih2d = struct.Struct("<2ih2d")
    return _struct_2ih2d
