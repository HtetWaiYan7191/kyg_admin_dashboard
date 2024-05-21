json.extract! item, :id, :name, :content, :price, :discount_percentage, :brand_partner_id, :images, :created_at, :updated_at
json.url item_url(item, format: :json)
json.images do
  json.array!(item.images) do |image|
    json.id image.id
    json.url url_for(image)
  end
end
