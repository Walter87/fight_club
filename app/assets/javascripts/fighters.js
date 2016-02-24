$(document).ready(function() {
  $('#myModal').modal()
  $('input[type=checkbox]').change(function(e){
   if ($('input[type=checkbox]:checked').length > 3) {
        $(this).prop('checked', false)
   }
  });
  $("form").submit(function(){
    if($(this).find("input:checked").length < 3){
      alert("Hey boss. He is not here to rest. He needs to work hard now. Choose at least three skills for him to work on. We don't respect laziness.");
      return false;
    }
  });
});
