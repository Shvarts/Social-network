###
Created by vitalik on 14.03.14.
###
$(document).ready ->
  $(".friends").on "click", ->
    $(".friends_list").slideDown()
    $(".requested_list").slideUp()
    $(".pending_list").slideUp()
    return

  $(".requested").on "click", ->
    $(".requested_list").slideDown()
    $(".friends_list").slideUp()
    $(".pending_list").slideUp()
    return

  $(".pending").on "click", ->
    $(".pending_list").slideDown()
    $(".friends_list").slideUp()
    $(".requested_list").slideUp()
    return

  return
