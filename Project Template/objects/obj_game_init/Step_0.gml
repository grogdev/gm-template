/// @description
// Don't process while alarm is counting
if alarm[0] != -1 exit

while !array_is_empty(__.init_flow) {
	var _instruction = __.init_flow[0]
	var _should_continue = process_instruction(_instruction)
	
	if !_should_continue {
		exit
	}	
}


room_goto_next()

//if should_process_init_flow {
	//for (var i = 0; i < array_length(__.init_flow); i++){
		//var _instruction = __.init_flow[0]
		//var _should_continue = process_instruction(_instruction)
		//
		//if !_should_continue {
			//break
		//}
	//}
//}
	//
//if array_length(init_flow) == 0 {
	//room_goto_next()
//} 

