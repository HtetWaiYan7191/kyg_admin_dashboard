class BlogSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :views_count, :title, :content, :image, :created_at, :category_name
  attribute :image, if: :image_present?

  def image
    if object.image.attached?
      rails_blob_url(object.image, host: Rails.application.config.action_mailer.default_url_options[:host], port: 3001)
    end
  end

  def category_name 
    object.category.name
  end

  def image_present?
    object.image.present?
  end

  def content
    object.content.body
  end

  def created_at
    object.created_at.strftime('%Y-%m-%d')
  end
  
end
