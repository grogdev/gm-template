function fname_remove_ext(_str){
  var _ext_pos = string_last_pos(".", _str)
  if (_ext_pos > 0) { 
    _str = string_copy(_str, 1, _ext_pos - 1)
    return _str
  }
  return _str
}
