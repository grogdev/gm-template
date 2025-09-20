function weighted_random(_odds, _multiplier = 1) {
    var total_odds = 0;
    for (var i = 0; i < array_length(_odds); i++) {
      var _item_key = _odds[i].item_key 
      var _weight   = _odds[i].weight;
      
      if _item_key != noone {
         _weight *= _multiplier 
      }
      
      total_odds += _weight
        
    }
    
    var _roll = random(total_odds);
    
    for (var i = 0; i < array_length(_odds); i++) {
      var _item_key = _odds[i].item_key 
      var _weight   = _odds[i].weight;
      if _item_key != noone {
        _weight *= _multiplier 
      }
      
      if (_roll < _weight) {
        return _item_key;
      }
        
      _roll -= _weight;
    }
}
//
//weighted_random(["apple", "banana", "cherry"], [100, 50, 1])
//weighted_random("apple", 100, "banana", 50, "cherry", 1)
//weighted_random({ item: "apple", chance: 100}, )
////

//var _pool = [
  //{ item: ITEM_POTION, cost: 50, weight: 100 },
  //{ item: ITEM_BOMB, cost: 50, weight: 100 },
  //{ item: ITEM_SMOKE_BOMB, cost: 50, weight: 100 },
//
//]
//





// for, ocn, tow, mtn, fcn, 