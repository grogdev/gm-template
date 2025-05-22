/// @description

#macro FIRST_ROOM rm_main_menu

randomize()

var _ordered_instances = [
  

]

// Create persistent system objects in order
array_foreach(_ordered_instances, function(_inst){
  instance_create_depth(0,0,0,{ persistent: true })  
})


room_goto(FIRST_ROOM)



