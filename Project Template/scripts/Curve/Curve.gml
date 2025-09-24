function Curve(_curve, _channel, _val1, _val2, _duration, _delay = 0) constructor{ 
  // Public   
  set_values = function(_val1, _val2){
    __.val1 = _val1
    __.val2 = _val2
  }
  
  get_value = function(){
    var _pos = animcurve_channel_evaluate(__.channel, __.position)
    return lerp(__.val1, __.val2, _pos) 
  }
  
  is_finished = function(){
    return __.position >= 1 
  }
  
  is_paused = function(){
    return __.paused
  }
  
  toggle_paused = function(_paused = undefined){
    if _paused == undefined
      __.paused = !__.paused
    else 
      __.paused = _paused
    
    return self
  }
  
  reset = function(){
    __.position = 0
    return self
  }
   
	get_pos = function(){
		return __.position
	}
	
  on_update = function(_callback) {
    __.update_callback = _callback
    return self;
  }
  
  on_end = function(_callback){
    __.end_callback = _callback
    return self;
  }
  
  // Events
  update = function(){
    if (is_finished() or is_paused()) exit
    __.position += 1/__.duration
    __.update_callback(get_value())
    if is_finished() {
      __.end_callback()
    }
  }
  
  // Private
  __ = {}
  with __ {
    channel = animcurve_get_channel(_curve, _channel)
    val1 = _val1
    val2 = _val2
    duration = _duration
    delay = 0
    position = 0
    paused = false
    
    end_callback = function(){}
    update_callback = function(){}
  }
}
