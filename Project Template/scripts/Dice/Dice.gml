function Dice(_dice_notation) constructor {
  static roll = function(_dice_notation_to_add = "+0") {
    var _leading_char = string_char_at(_dice_notation_to_add, 1)
    if  _leading_char != "+" and _leading_char != "-" {
      _dice_notation_to_add = "+" + _dice_notation_to_add
    }
    var _roll = dice_roll(__.dice_notation + _dice_notation_to_add)
    array_push(__.roll_history, _roll)
    return _roll
  }
  static update = function(_dice_notation){
    __.dice_notation = _dice_notation
  }
  static get_last_roll = function(){
    return array_last(__.roll_history)
  }
  static get_roll_history = function(){
    return __.roll_history
  }
  __ = {}
  with __ {
    dice_notation = _dice_notation
    roll_history  = []
  }
}

/// @desc Generate a random number using dice notation (e.g "3d6+1d20-10")
/// @param {string} _dice_notation Dice notation
/// @returns {real} Rolled result based off the dice notation
function dice_roll(_dice_notation) {
  _dice_notation = string_replace_all(_dice_notation, " ", "")
  
  var _total = 0
  var _token = ""
  var _sign  = 1

  var _leading_char = string_char_at(_dice_notation, 1)
  if  _leading_char != "+" and _leading_char != "-" {
    _dice_notation = "+" + _dice_notation
  }
  
  // Parse through notation string
  var _str_length = string_length(_dice_notation)
  for (var i = 1; i <= _str_length; i++) {
    var _char = string_char_at(_dice_notation, i)
    if _char == "+" or _char == "-" {
      if _token != "" {
        // Found next token, add the previously built token
        _total += __roll_dice_token(_token) * _sign
        _token = ""
      }
      // Update to the sign of the next token
      _sign = (_char == "+") ? 1 : -1
    }
    else {
      // Build the token char by char
      _token += _char
    }
  }
  
  if _token != "" {
    // Add the remaining token, if any
    _total += __roll_dice_token(_token) * _sign
  }
  
  return _total
}

/// @desc Internal Use - Rolls a number based off an individual dice notation token
/// @param {string} _dice_token Individual dice notation token (e.g. "1d6")
/// @returns {real} Returns rolled number based off that token.
function __roll_dice_token(_dice_token) {
  var _d_pos = string_pos("d", _dice_token)
  if _d_pos > 0 {
    var _dice_count = real(string_copy(_dice_token, 1, _d_pos - 1))
    var _dice_sides = real(string_copy(_dice_token, _d_pos + 1, string_length(_dice_token)))
    var _total = 0
    for (var i = 0; i < _dice_count; i++) {
      _total += irandom_range(1, _dice_sides)
    }
    return _total
  } else {
    return real(_dice_token)
  }
}