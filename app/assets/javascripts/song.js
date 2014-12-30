$(function() {
  $("#song_search input").keyup(function() {
    $.get($("#song_search").attr("action"), $("#song_search").serialize(), null, "script");
    return false;
  });
});


$( document ).ready(function() {
    console.log( "ready!" );
		$('#song_search_field').focus();
	    $('#song_search_field').keydown();
	    $('#song_search_field').keypress();
	    $('#song_search_field').keyup();
 		$('#song_search_field').focus();

});

