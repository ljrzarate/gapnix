//= require filter_time_format

var Gapnix = {
  models: {},
  views: {},
  helpers: {},
  modules: {}
};

Gapnix.helpers.changeHourFormat = function(time){
    return convertFloatToTimeString(time);
}

Gapnix.helpers.filterTimeFormat = function(time){
    return filterTimeFormat(time);
}

