json.array!(@posts) do |post|
  json.extract! post, :id, :title, :description, :content, :author, :site_url
  json.url post_url(post, format: :json)
end
