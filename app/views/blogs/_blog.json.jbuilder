json.extract! blog, :id, :user_id, :category_id, :content, :views_count, :status, :delete_flg, :title, :images, :videos, :created_at, :updated_at
json.url blog_url(blog, format: :json)
json.images do
  json.array!(blog.images) do |image|
    json.id image.id
    json.url url_for(image)
  end
end
json.videos do
  json.array!(blog.videos) do |video|
    json.id video.id
    json.url url_for(video)
  end
end
