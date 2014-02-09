# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require modalwindow

html = "%h1 New Post \n= form_for :post do |f|\n  %p\n    = f.label :title\n    %br/\n    = f.text_field :title\n  %p\n    = f.label :content\n    %br/\n    = f.text_area :content\n  %p\n    = f.submit"
modalWind.show 40, 40, html