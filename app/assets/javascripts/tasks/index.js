Gapnix.views.tasksIndex = (function () {

  function change_time_type() {
    var link_to = $(".js-link-hours");

    link_to.on("click", function () {
      var hidden = $(".js-hours-field");
      hidden.toggleClass("hidden");

      var autoTimeStr = link_to.data("link-auto");
      var manualTimeStr = link_to.data("link-manual");
      var submitInput = $("#submit-task");

      if (link_to.text() == manualTimeStr) {
        link_to.text(autoTimeStr);
        submitInput.val(link_to.data("submit-manual"));
      }
      else {
        link_to.text(manualTimeStr);
        submitInput.val(link_to.data("submit-auto"));
      }
    });
  }

  function on_changed_time() {
    var time_field = $(".js-hours-field");
    var hidden_time_field = $(".js-hours-hidden-field");

    time_field.on("change", function () {
      hidden_time_field.val(filterTimeFormat(time_field.val()));
      time_field.val(Gapnix.helpers.changeHourFormat(hidden_time_field.val()));
    });
  }

  function init() {
    change_time_type();
    on_changed_time();
  }

  return {
    init: init
  }

})();

(function () {
  Gapnix.views.tasksIndex.init();
})();