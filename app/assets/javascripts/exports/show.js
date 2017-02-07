Gapnix.views.exportsShow = (function () {


  $( "input[type=checkbox]" ).on( "click", get_checkedItems )

//   function showalert()
//   {
//       alert ('as');
//   }

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


    function init() {
        //nothing for now to execute at the begginning
    }

    return {
        init: init
    }

})();

(function () {
    Gapnix.views.exportsShow.init();
})();