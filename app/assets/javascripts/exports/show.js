Gapnix.views.exportsShow = (function () {


  $( "input[type=checkbox]" ).on( "click", get_checkedItems )
    function get_checkedItems() {
        var hiddenField = $('.hiddenField')
        var checkedItems = $('.table tr td .chkTask:checked');
        if (hiddenField && checkedItems) {
            var ids = "";
            if (checkedItems.length > 0) {
                $.each(checkedItems, function (position, item) {
                    // alert(item.value);
                    ids += item.value + ',';
                })
            }
            //setting values
            hiddenField.val( ids);    
        }
    }


    function getUsernameAndPassword(){
        $("body").on("click", ".js-journyx-send-bottom", function(){
            var modalName = $("#name");
            $("#password").prop("type", "text");
            var modalPassword = $("#password");            
            $(".js-journyx-name").val(modalName.val());
            $(".js-journyx-password").val(modalPassword.val());

            $(".js-submit-form").submit();
        });
    }


    function init() {
        getUsernameAndPassword();
    }

    return {
        init: init
    }

})();

(function () {
    Gapnix.views.exportsShow.init();
})();