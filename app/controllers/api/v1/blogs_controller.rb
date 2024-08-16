class Api::V1::BlogsController < ApiController 
  before_action :set_blog, only: [:show, :blogs_filter_category, :increment_view_count]
  skip_before_action :verify_authenticity_token, only: [:increment_view_count]

  include SerializerResource
  def index 
    @blogs = Blog.all.where(delete_flg: false).page(params[:page]).per(12)
render json: {
  data: serialize_resource(@blogs, BlogSerializer),
  message: 'blogs list'
}
  end

  def blogs_filter_category
    @category = Category.includes(:blogs).find(@blog.category_id)
    @blogs = @category.blogs.where(delete_flg: false).where.not(id: @blog.id).page(params[:page]).per(4)

    render json: {
      data: serialize_resource(@blogs, BlogSerializer),
      message: 'blog list filter by category'
    }
  end

  def show 
    if @blog 
      render json: {message: 'blog detail', data: serialize_resource(@blog, BlogSerializer)}
    end
  end

  def increment_view_count 
    @blog.increase_view_count
    render json: { message: 'View count incremented' }
  end

  private 
  def set_blog 
    @blog = Blog.find_by(id: params[:id], delete_flg: false)
  end
end