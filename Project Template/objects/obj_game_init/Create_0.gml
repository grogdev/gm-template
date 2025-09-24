/// @description
// Public
queue		= function(_type, _value, _data = {}){
	is_type(_type, Type.STRING)
	is_type(_data, Type.STRUCT)
	array_push(__.init_flow, {
		type: _type,
		value: _value,
		data: _data,
	})
	return self
}
create	= function(_object, _data){
	queue("object", _object, _data)
	return self
}
log			= function(_string, _data){
	queue("log", _string, _data)
	return self
}
execute	= function(_callback, _data){
	queue("callback", _callback, _data)
	return self
}
wait = function(_duration, _data){
	queue("wait", _duration, _data)
	return self
}
wait_for = function(_callback, _data){
	queue("wait for", _callback, _data)
	return self
}
init 		= function(){
	__.should_process_init_flow = true
	//for (var i = 0; i < array_length(__.init_flow); i++){
		//var _type		= _entry.type
		//var _value	= _entry.value
		//var _data 	= _entry.data
		//
		//switch _type {
			//case "object":	
				//instance_create_depth(0,0,0, _value, _data)
			//break
			//case "log":
				//show_debug_message($"--- GAME INIT: {_value}")
			//break
			//case "callback":
				//_value()
			//break
			//case "predicate":
				//
			//break
			//
		//}
	//}
	//room_goto_next()
	//
	//// Must be called last
	return undefined 
}

process_instruction = function(_instruction){
	var _type		= _instruction.type
	var _value	= _instruction.value
	var _data 	= _instruction.data
	
	switch _type {
		case "object":	
			instance_create_depth(0,0,0, _value, _data)
			array_delete(__.init_flow, 0, 1)
			return true
		break
		case "log":
			show_debug_message($"--- GAME INIT: {_value}")
			array_delete(__.init_flow, 0, 1)
			return true
		break
		case "callback":
			_value()
			array_delete(__.init_flow, 0, 1)
			return true
		break
		case "predicate":
			if _value() {
				array_delete(__.init_flow, 0, 1)
				return true
			} else {
				return false
			}
		break
		case "wait":	
			alarm[0] = _value
			array_delete(__.init_flow, 0, 1)
			return false
		break
	}
}

// Private
__ = {}
with __ {
	init_flow 								= []
	should_process_init_flow	 	= false
}