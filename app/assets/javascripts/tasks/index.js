
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
