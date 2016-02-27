$(document).ready(function() {
  $('#myModalfight').modal('show')
  $('input[type=checkbox]').change(function(e){
   if ($('input[type=checkbox]:checked').length > 2) {
        $(this).prop('checked', false)
   }
  });
  $('#adding_skills').submit(function(){
    if($(this).find("input:checked").length < 2){
      alert("Hey boss. He is not here to rest. He needs to work hard now. Choose at least two skills for him to work on. We don't respect laziness.");
      return false;
    }
  });
});

