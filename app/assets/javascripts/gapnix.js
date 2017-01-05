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

on_show_time = function(){
  var time_field = $(".js-hour-cell");        
  time_field.each(function() {
    $(this).html(Gapnix.helpers.changeHourFormat($(this).html()));            
  });
}

$( document ).ready(function() {
  on_show_time();
});