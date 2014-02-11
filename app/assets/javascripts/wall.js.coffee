
html = "%h1 New Post \n= form_for :post do |f|\n  %p\n    = f.label :title\n    %br/\n    = f.text_field :title\n  %p\n    = f.label :content\n    %br/\n    = f.text_area :content\n  %p\n    = f.submit"
modalWind.show 40, 40, html