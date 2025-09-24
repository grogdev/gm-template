function ObjectPool(_object, _pool_size, _var_struct = {}) constructor {
	// Methods
	static get_instance = function(_x, _y, _layer, _var_struct = {}){
		var _instance
		if array_length(__.pool) > 0 {
			_instance = array_pop(__.pool)
		} else {
			_instance = instance_create_layer(_x, _y, _layer, __.object, _var_struct)
		}
		
		_instance.visible	= true
		_instance.x				= _x
		_instance.y				= _y
		
		array_push(__.active_instances, _instance)
		return _instance
	}
	static return_instance = function(_id){
		array_push(__.pool, _id) 
		
		_id.visible = false
		_id.x 			= -1000
		_id.y 			= -1000
		
		var _index = array_get_index(__.active_instances, _id)
		if _index != -1 {
			array_delete(__.active_instances, _index, 1)
		}
	}
	static return_all = function(){
		while array_length(__.active_instances) > 0 {
			return_instance(__.active_instances[0])
		}
	}
	static cleanup = function(){
		array_foreach(__.pool, function(_inst){
			if instance_exists(_inst){
				instance_destroy(_inst)
			}
		})
		array_foreach(__.active_instances, function(_inst){
			if instance_exists(_inst){
				instance_destroy(_inst)
			}
		})
	}
	
	// Internal
	__ = {}
	with __ {
		// Arguments
		object						= _object
		var_struct 				= _var_struct
		
		pool							= []
		active_instances	= []
		
		repeat _pool_size {
			var _instance = instance_create_depth(-1000, -1000, 0, _object, var_struct)
			_instance.visible = false
			array_push(pool, _instance)
		}
	}
}


