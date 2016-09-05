$(function() {
  $(document).ajaxSend(function() {
    $("#ajax_loader").show();
  });
  $(document).ajaxComplete(function() {
    $("#ajax_loader").hide();
  });
});