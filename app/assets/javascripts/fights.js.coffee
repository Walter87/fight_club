$(document).ready ->
  $('#myModalfight').modal
    backdrop: 'static'
    keyboard: false
  $('input[type=checkbox]').change (e) ->
    if $('input[type=checkbox]:checked').length > gon.skills_allowed
      $(this).prop 'checked', false
    return
  $('#adding_skills').submit ->
    if $(this).find('input:checked').length < gon.skills_allowed
      alert 'Hey boss. He is not here to rest. He needs to work hard now. Choose at least ' + gon.skills_allowed + ' skills for him to work on. We don\'t respect laziness.'
      return false
    return
  return

