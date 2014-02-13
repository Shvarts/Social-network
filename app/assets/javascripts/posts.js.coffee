# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
id = 0;
$ ->
  $(document).on "click", "button.save", ->
    title = $("#post_title").val()
    content = $("#post_content").val()
    post_new title, content
    $("#myModal.new").modal "hide"
    return

$ ->
  $(document).on "click", "button.update", ->
    title = $("#post_update_title").val()
    content = $("#post_update_content").val()
    post_update id, title, content
    $("#myModal.update").modal "hide"
    return

$ ->
  $(document).on "click", "button.delete", ->
    post_delete id
    $(".bs-example-modal-sm").modal "hide"
    return

$ ->
  $(document).on "click", "button.up", ->
    id = $(this).attr("tagname")
    return

$ ->
  $(document).on "click", "button.de", ->
    id = $(this).attr("tagname")
    return



post_new = (params_t,params_c) ->
  $.ajax
    type: "POST"
    data:
      title: params_t
      content: params_c

    url: "new_post"
    success: (data) ->
      $("#posts_user").html(data)
      return

    error: (data) ->
      alert "erorr - post_new"
      
      return

  return

post_update = (idd,params_t,params_c) ->
  $.ajax
    type: "POST"
    data:
      id: idd
      title: params_t
      content: params_c

    url: "update_post"
    success: (data) ->
      $("#posts_user").html(data)
      return

    error: (data) ->
      alert "erorr - post_update"
      return

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