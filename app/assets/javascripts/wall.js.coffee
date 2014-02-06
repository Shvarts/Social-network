# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#asdf").on("ajax:success", (e, data, status, xhr) ->
    obj = $.parseJSON(xhr.responseText)
    $("#qa").text ""
    i = 0
    while i <= obj.length
      $("#qa").append obj[i].usr + " - " + obj[i].post + "<br>"
      i++
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#qa").text "<p>ERROR</p>"