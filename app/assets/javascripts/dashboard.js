

Gapnix.helpers.dashboard = (function () {

    function on_changed_time(){
         var time_field = $(".js-hour-cell");        
        time_field.each(function() {
            $(this).html(Gapnix.helpers.changeHourFormat($(this).html()));            
        });   
    }

    // function on_show_time(){
    //     var time_field = $(".js-hour-cell");        
    //     time_field.each(function() {
    //         $(this).html(get_time_string($(this).html()));            
    //     });
    // }

    function init(){
    //   change_time_type();
    //   on_changed_time();
    //   on_show_time();
    }

    return{
        init: init
    }

})();

(function () {
  Gapnix.helpers.dashboard.init();
})();