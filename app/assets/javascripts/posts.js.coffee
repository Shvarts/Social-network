# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
id = 0;
$ ->
  $(document).on "click", ".save", ->
    form = $("form.new_post")
    formData = new FormData(form[0])
    $.ajax
      type: "POST"
      url: form.attr( 'action' )
      data: formData
      cache: false
      contentType: false
      processData: false
      success: (data) ->
        $("#myModal").modal "hide"
        $("#posts_user").prepend(data)
      error: (error) ->
        console.log error
    return false

$ ->
  $(document).on "click", "button.new_post_hp", ->
    post_modal_window 0
    return

$ ->
  $(document).on "click", "button.up", ->
    id = $(this).attr("tagname")
    post_modal_window id
    return

$ ->
  $(document).on "click", "button.de", ->
    id = $(this).attr("tagname")
    post_delete id
    return

post_delete = (idd) ->
  $.ajax
    type: "POST"
    data:
      id: idd

    url: "delete_post"
    success: (data) ->
      $("#posts_user").html(data)
      return

    error: (data) ->
      alert "erorr - post_delete"
      return

  return

post_modal_window = (idd) ->
  $.ajax
    type: "POST"
    data:
      id: idd

    url: "post_modal_window"
    success: (data) ->
      $("#render_post_mw").html(data)
      return

    error: (data) ->
      alert "erorr - post_update_mw"
      return

  return