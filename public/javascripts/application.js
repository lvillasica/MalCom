// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {

  $("#proj_list").change(function(){
    if($(this).val()!="")window.location = $(this).val();  
  });  

});
