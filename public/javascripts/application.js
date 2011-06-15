// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// role assignments begin

$('#project_all').live('click', function(){
  if ($('#project_all').is(':checked')){
    $('#project input:checkbox').attr('checked', true);
  }else{
    $('#project input:checkbox').attr('checked', false);
  }
});

$('#ticket_all').live('click', function(){
  if ($('#ticket_all').is(':checked')){
    $('#ticket input:checkbox').attr('checked', true);
  }else{
    $('#ticket input:checkbox').attr('checked', false);
  }
});

$('#tag_all').live('click', function(){
  if ($('#tag_all').is(':checked')){
    $('#tag input:checkbox').attr('checked', true);
  }else{
    $('#tag input:checkbox').attr('checked', false);
  }
});

$('#comment_all').live('click', function(){
  if ($('#comment_all').is(':checked')){
    $('#comment input:checkbox').attr('checked', true);
  }else{
    $('#comment input:checkbox').attr('checked', false);
  }
});

// role assignments end
function datepick(){
  $("#date").datepicker({dateFormat: 'yy-mm-dd'});
}

$(function() {

  $("#proj_list").change(function(){
    if($(this).val()!="")window.location = $(this).val();  
  });  

  $("#notice").dialog({modal: "true"});

});


