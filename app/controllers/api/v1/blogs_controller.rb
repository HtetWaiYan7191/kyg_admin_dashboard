class Api::V1::BlogsController < ApplicationController 
  before_action :set_blog, only: [:show]
  include SerializerResource
  def index 
    @blogs = Blog.all.where(delete_flg: false)
render json: {
  data: serialize_resource(@blogs, BlogSerializer),
  message: 'blogs list'
}
  end

  def show 
    if @blog 
      puts @blog.present?
      render json: {message: 'blog detail', data: serialize_resource(@blog, BlogSerializer)}
    end
  end

  private 
  def set_blog 
    @blog = Blog.find_by(id: params[:id], delete_flg: false)
  end
end