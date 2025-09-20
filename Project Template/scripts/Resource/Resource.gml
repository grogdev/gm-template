function Resource(_max, _config = {}) constructor{
	// Public
	static deplete = function(_amount = get()){
		if __.resource_val = __.resource_min exit
		set(__.resource_val - _amount)
	}
	static restore = function(_amount = get_missing()){
		set(__.resource_val + _amount)
	}
	static get = function(){
		return __.resource_val
	}
	static set = function(_value){
    var _old_resource_val = __.resource_val 
		__.resource_val = clamp(_value, __.resource_min, __.resource_max)
    if __.resource_val != _old_resource_val {
		  __.callback_change(__.resource_val)
      
      if is_empty() {
		    __.callback_empty()
      }
			
      if is_full() {
        __.callback_full()
      }
    }
    return self
	}
	
	static get_missing = function(){
		return __.resource_max - __.resource_val
	}
	static get_percent = function(_whole = true){
		var _factor = _whole ? 100 : 1
		return (get() / get_max()) * _factor
	}
	
	static is_empty = function(){
		return __.resource_val = __.resource_min
	}
	static is_full = function(){
		return __.resource_val = __.resource_max
	}
	
	on_empty = function(_callback){
		__.callback_empty = _callback
	}
  
	on_full  = function(_callback){
		__.callback_full= _callback
	}
  
	on_change  = function(_callback){
		__.callback_change= _callback
	}
	static get_max = function(){
		return __.resource_max
	}
	static set_max = function(_max){
		__.resource_max = _max
	}
	
	// Private
	__ = {}
	with __ {
		resource_min = 0
		resource_max = _max
		resource_val = resource_max
		
		callback_empty = function(){}
		callback_full  = function(){}
		callback_change  = function(){}
	}
}




