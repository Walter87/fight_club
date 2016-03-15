$(document).ready ->
  $('#myModal').modal
    backdrop: 'static'
    keyboard: false
  $('input[type=checkbox]').change (e) ->
    if $('input[type=checkbox]:checked').length > 3
      $(this).prop 'checked', false
    return
  $('#adding_fighter').submit ->
    if $(this).find('input:checked').length < 3
      alert 'Hey boss. He is not here to rest. He needs to work hard now. Choose at least three skills for him to work on. We don\'t respect laziness.'
      return false
    return
  return
