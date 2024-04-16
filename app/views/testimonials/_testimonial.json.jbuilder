json.extract! testimonial, :id, :name, :speech, :image, :created_at, :updated_at
json.url testimonial_url(testimonial, format: :json)
json.image url_for(testimonial.image)
