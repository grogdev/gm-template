//call_later(1, time_source_units_frames, function(){
	//instance_create_depth(0,0,0,obj_game_init)
		//.execute(function(){
			//#macro LOG global.logger
			//global.logger = new Logger()
			//if SEND_ERROR {
			  //global.sentry = new Sentry(SENTRY_DSN)
			  //exception_unhandled_handler(global.sentry.get_exception_handler())
			  //global.logger.use_sentry(global.sentry)
			//}
			//
			//application_surface_draw_enable(false);
			//randomize()
			//
			//global.font = font_add_sprite_ext(spr_font, "abcdefghijklmnopqrstuvwxyz0123456789?!.[]<>:_+-=%\"\'/\\$A", true, 1)
			//draw_set_font(global.font)
			//
			//// Load Roam Data
			//var _roomLoaderRooms = tag_get_asset_ids("field", asset_room);
			//
			//array_foreach(_roomLoaderRooms, function(_x){
			  //RoomLoader.data_init(_x);  
			//})
			//
		//})
		//.log("Creating system objects.")
		//.create(obj_gmlive)
		//.create(sys_data)
		//.create(sys_window)
		//.create(sys_imgui)
		//.create(sys_debug)
		//.create(sys_twitch)
		//.create(sys_mods)
		//.wait_for(function(){
			//return display_measure_is_available
		//})
		//.init()
//})
//




call_later(1, time_source_units_frames, function(){
	instance_create_depth(0,0,0,obj_game_init)
		.wait(120)
		.execute(function(){
			show_message("init")
		})
		.execute(function(){
			show_message("init")
		})
		.execute(function(){
			show_message("init")
		})
		.wait(120)
		.execute(function(){
			show_message("init")
		})
		.log("log: stuff created")
		
		.init()
})

