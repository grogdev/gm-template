function Stats(_stat_struct,_config = {}) constructor {
	// Public
	static add_modifier 		= function(_mod){
		var _id = _mod.get_id()
		__.modifiers[$ _id] = {
			add: _mod.get_add()  ?? {},
			mult: _mod.get_mult() ?? {} 
		}
		return self
	}
	static remove_modifier	= function(_id){
		struct_remove(__.modifiers, _id)
		return self
	}
	static increase					= function(_stat, _amount = 1){
		__.base[$ _stat] += _amount
		__stat_update(_stat, __.base[$ _stat])
		return self
	}
	static get							= function(_stat){
		var total = __.base[$ _stat]
		var multiplier = 0
		
		var _keys = struct_get_names(__.modifiers)
		for (var i = 0; i < array_length(_keys); i++)
		{
			var _val = __.modifiers[$ _keys[i]]
			total      += _val.add[$ _stat] ?? 0
			multiplier += _val.mult[$ _stat] ?? 0
	
		}
		if multiplier == 0 {
			multiplier = 1
		}
		
		return total * multiplier
	}
	static get_base					= function(_stat){
		return __.base[$ _stat]
	}
	static set_base					= function(_stat,_val){
		__.base[$ _stat] = _val
		return self
	}
	static on_stat_update		= function(_callback){
		__stat_update = _callback
	}
	static get_stat_struct  = function(){
		return __.base
	}

	// Internal
	__ = {}
	with __ {
		base 			= variable_clone(_stat_struct)
		modifiers = {}
		static __stat_update = function(){}
	}
}

function Modifier(_id, _additives = {}, _multipliers = {}) constructor{
	// Public
	static set_additives 		= function(_stat_struct){
		__.additives = _stat_struct
	}
	static set_multipliers 	= function(_stat_struct){
		__.multipliers = _stat_struct
	}
	static get_id 					= function(){
		return __.id	
	}
	static get_additives 		= function(){
		return __.additives	
	}
	static get_multipliers	= function(){
		return __.multipliers	
	} 
    
	// Internal
	__ = {}
	with __ {
		id					= _id
		additives		= _additives
		multipliers	= _multipliers
	}
}