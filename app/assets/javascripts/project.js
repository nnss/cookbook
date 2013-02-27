$(document).ready(function() {
  $("#owner a.add_fields").
    data("association-insertion-position", 'before').
    data("association-insertion-node", 'this');
	 
  $('#owner').bind('insertion-callback',
     function() {
       $("#owner_from_list").hide();
       $("#owner a.add_fields").hide();
     });
  $('#owner').bind("removal-callback",
     function() {
       $("#owner_from_list").show();
       $("#owner a.add_fields").show();
     });
});
