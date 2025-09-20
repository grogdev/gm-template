call_later(1, time_source_units_frames, function(){
	instance_create_depth(0,0,0,obj_game_init)
		.queue("Loading persistent objects")
		.queue(sys_save)
		.queue(sys_display)
		.queue(function(){
			show_message("init")
		})
		.init()
})

