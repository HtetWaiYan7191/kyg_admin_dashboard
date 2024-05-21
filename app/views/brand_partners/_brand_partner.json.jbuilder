json.extract! brand_partner, :id, :name, :brand_category_id, :image, :created_at, :updated_at
json.url brand_partner_url(brand_partner, format: :json)
json.image url_for(brand_partner.image)
