/// @desc  approach_smooth(start, end, shift,[snap_distance])
/// @param {real} _start Description
/// @param {real} _end Description
/// @param {real} _shift Description
/// @param {real} [_snap]=math_get_epsilon() Description
/// @returns {real} Description
function approach_smooth(_start, _end, _shift, _snap = math_get_epsilon()){
  //We are close enough
  if(abs(_start-_end) < _snap) 
    return _end;	

  return lerp(_start,_end,_shift);
}