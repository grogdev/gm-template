function Library() constructor {
  static get = function(_key){
    return self[$ _key];  
  }
  
  static set_keys = function(){
      struct_foreach(static_get(self), function(_key, _val){
          var _ref = static_get(self)[$ _key];
          if(_ref == undefined) return;
    
          _ref[$ "key"] = _key;  
      })
  }
}