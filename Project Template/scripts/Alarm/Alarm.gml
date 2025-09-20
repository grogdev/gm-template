function Alarm(_duration = 1) constructor{
  // Public
  static start = function(_duration = undefined){
    if _duration != undefined
      __.duration = _duration
    
    reset()
    return self
  }
  static pause = function(){
    __.paused = true
    return self
  }
  static resume = function(){
    _.paused = false
    return self
  }
  static reset = function(){
    __.paused = false
    __.timer  =  __.duration
    return self
  }
    
  static is_active = function(){
    return __.timer >= 0
  }
  
  static is_paused = function(){
    return __.paused
  }
  
  static get_timer = function(){
    return __.timer
  }
  
  static on_update = function(_callback){
    __.update_callback = _callback
    return self
  }
  static on_done = function(_callback){
    __.done_callback = _callback
    return self 
  }
  

  // Private
  __ = {}
  with __ {
    timer = -1
    duration = _duration
    
    paused = false
    
    remaining_time = _duration
    
    update_callback = function(){}
    done_callback = function(){}
  }

  
  // Events
  update = function(){
    if !is_active() and !is_paused() exit
    __.timer--
    __.update_callback(__.timer, __.duration)
    
    if __.timer <= 0 {
      done()
    }
  }
  
  done = function(){
    __.timer = -1
    __.done_callback()
  }

}

//timer = new Alarm(2 SEC)
//.on_update(function(){
  //show_debug_message("alarm is counting down")
//})
//.on_done(function(){
  //show_message("alarm has finished!")  
//})
//.start()
