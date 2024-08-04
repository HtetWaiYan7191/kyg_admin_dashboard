class Api::V1::BlogsController < ApplicationController 
  include SerializerResource
  def index 
    @blogs = Blog.all.where(delete_flg: false)
render json: {
  data: serialize_resource(@blogs, BlogSerializer),
  message: 'blogs list'
}
  end
end