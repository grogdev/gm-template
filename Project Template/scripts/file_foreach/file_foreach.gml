/// file_foreach(_folder, _mask, _callback)
/// @param {string} _folder - The folder to search in.
/// @param {string} _mask - The filename mask (e.g., "*.sav").
/// @param {function} _callback - The function to call for each file (receives file path).
function file_foreach(_folder, _mask, _attribute = fa_none, _callback) {
  if (string_char_at(_folder, string_length(_folder)) != "/") {
      _folder += "/"
  }
  
  var _dir = file_find_first(_folder + _mask, _attribute)
  
  while (_dir != "") {
      script_execute(_callback, _folder + _dir)
      _dir = file_find_next()

  }
  
  file_find_close()
}