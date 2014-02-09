# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#walllist_form_ajax").on("ajax:success", (e, data, status, xhr) ->
    $("#walllist_answer_ajax").html xhr.responseText
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#walllist_answer_ajax").html "<p>ERROR: "+error+"</p>"