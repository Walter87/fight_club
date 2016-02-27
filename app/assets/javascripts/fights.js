$(document).ready(function() {
  $('#myModalfight').modal('show')
  $('input[type=checkbox]').change(function(e){
   if ($('input[type=checkbox]:checked').length > gon.skills_allowed) {
        $(this).prop('checked', false)
   }
  });
  $('#adding_skills').submit(function(){
    if($(this).find("input:checked").length < gon.skills_allowed){
      alert("Hey boss. He is not here to rest. He needs to work hard now. Choose at least " +  gon.skills_allowed + " skills for him to work on. We don't respect laziness.");
      return false;
    }
  });
});

