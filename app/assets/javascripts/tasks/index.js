Gapnix.views.tasksIndex = (function () {

    function change_time_type(){
        var link_to = $(".js-link-hours");

        link_to.on("click", function(){
            var hidden = $(".js-hours-field");
            hidden.toggleClass("hidden");
            if(link_to.text() == "Tiempo manual" ){
                link_to.text("Tiempo automatico")
            }
            else{
                link_to.text("Tiempo manual")
            }    
        });
    }

    function on_changed_time(){
        var time_field = $(".js-hours-field");
        var hidden_time_field = $(".js-hours-hidden-field");

        time_field.on("change", function(){
            hidden_time_field.val(filterTimeFormat(time_field.val()));
            time_field.val(Gapnix.helpers.changeHourFormat(hidden_time_field.val()));
        });        
    }

    function on_show_time(){
        var time_field = $(".js-hour-cell");        
        time_field.each(function() {
            $(this).html(Gapnix.helpers.changeHourFormat($(this).html()));            
        });
    }

    function init(){
      change_time_type();
      on_changed_time();
      on_show_time();
    }

    return{
        init: init
    }

})();

(function () {
  Gapnix.views.tasksIndex.init();
})();