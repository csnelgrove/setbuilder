$(function() {
  $("#family_search_box input").keyup(function() {

    $.get($("#family_search_form").attr("action"), $("#family_search_form").serialize(), null, "script");
    return false;
  });

$('#birthday').datetimepicker({pickTime: false,format: 'YYYY-MM-DD'});

});
