# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  tabContainers = $("div.tabs > div")
  tabContainers.hide().filter(":first").show()
  $("div.tabs ul.tabNavigation a").click(->
    tabContainers.hide()
    tabContainers.filter(@hash).show()
    $("div.tabs ul.tabNavigation a").removeClass "selected"
    $(this).addClass "selected"
    false
  ).filter(":first").click()
  return

$ ->
  $("#user_search").bind
    keyup: ->
      text_search = $("#user_search").val();
      search(text_search)

      return
  return
search = (val) ->
  $.ajax
    type: "POST"
    data:
      params: val

    url: "/user_search"
    success: (data) ->
      $("#users_srch").html(data)
      return

    error: (data) ->
      alert "Error"
      return

  return



