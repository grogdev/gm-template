/// @description
if should_process_init_flow {
	var _instruction 			= init_flow[0]
	var _obj_or_callback 	= _instruction[0]
	var _data 						= _instruction[1]
		
	if is_callable(_obj_or_callback){
		if _obj_or_callback(_data) {
			array_delete(init_flow, 0, 1)
		}
	} else {
		if is_string(_obj_or_callback){
			show_debug_message($"--- GAME INIT: {_obj_or_callback}")
		}	else if object_exists(_obj_or_callback){
			instance_create_depth(0,0,0, _obj_or_callback, _data)
		}
		array_delete(init_flow, 0, 1)
	}
	
	if array_length(init_flow) == 0 {
		room_goto_next()
	} 
}

