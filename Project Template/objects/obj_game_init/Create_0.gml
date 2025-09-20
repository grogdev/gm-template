/// @descrifption
randomize()

init_flow = []
// Public
queue = function(_obj_or_callback, _data = {}){
	array_push(init_flow, [_obj_or_callback, _data])
	return self
}

// Events
should_process_init_flow = false
init = function(){
	should_process_init_flow = true
	return self
	//array_foreach(init_flow, function(_value){
		//var _obj_or_callback 	= _value[0]
		//var _data 						= _value[1]
		//
		//if is_callable(_obj_or_callback){
			//_obj_or_callback(_data)
		//} else if is_string(_obj_or_callback) {
			//show_debug_message($"--- GAME INIT: {_obj_or_callback}")
		//}	else if object_exists(_obj_or_callback){
			//instance_create_depth(0,0,0, _obj_or_callback, _data)
		//}
		//
	//})
	//room_goto_next()

}



 



