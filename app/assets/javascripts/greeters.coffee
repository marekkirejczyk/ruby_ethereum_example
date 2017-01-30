updateButtonState = -> 
  if ($("#greeting").val() == "")
    $("#submit").addClass("disabled")
  else 
    $("#submit").removeClass("disabled")

behave_as_disable = (selector) ->
  $(selector).on 'click', (e) ->
    if ($(this).hasClass('disabled'))
      e.stopPropagation()
      e.preventDefault()
      
status_pooling = () ->
  return unless $("#deploy").size() > 0
  tx = $("#deploy").data("tx")
  $.ajax({
    url: "/greeters/status?id=" + tx,
  }).done((result) ->
    setTimeout(status_pooling, 5000);
    window.location = "/greeters/#{result}" if result != ""
  );
  
$ ->
  updateButtonState
  $("#greeting").on "keyup", updateButtonState

  behave_as_disable("#submit")
      
  setTimeout(status_pooling, 5000);
  