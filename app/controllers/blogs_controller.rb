class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]
  before_action :check_admin_access

  # GET /blogs or /blogs.json
  def index
    if params[:daterange]
      daterange = params[:daterange]
      start_date = Date.strptime(daterange.split(" - ").first, '%m/%d/%Y')
      end_date = Date.strptime(daterange.split(" - ").second, '%m/%d/%Y')
      @blogs = Blog.all.where(delete_flg: false, created_at: start_date.beginning_of_day..end_date.beginning_of_day ).page(params[:page]).per(4)
    else  
      @blogs = Blog.all.page(params[:page]).per(4)
    end
  end

  # def filter_by_date
  #   if params[:from_date].present? && params[:to_date].present?
  #     from_date = Date.parse(params[:from_date])
  #     to_date = Date.parse(params[:to_date])
  #     @blogs = Blog.all.where(delete_flg: false, created_at: from_date.beginning_of_day..to_date.beginning_of_day ).page(params[:page]).per(4)
  #     render :index
  #   else  
  #     @blogs = Blog.all.where(delete_flg: false).page(params[:page]).per(4)
  #     render :index
  #   end
  # end
  # GET /blogs/1 or /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
    @existing_images = @blog.images if @blog.images.attached?
    @existing_videos = @blog.videos if @blog.videos.attached?
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if params[:remove_images].present?
        params[:remove_images].each do |image_id|
          @blog.images.find(image_id).purge
        end
      end
  
      if params[:remove_videos].present?
        params[:remove_videos].each do |video_id|
          @blog.videos.find(video_id).purge
        end
      end
  
  
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy!

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:user_id, :category_id, :content, :views_count, :status, :delete_flg, :title, images: [], videos: [])
    end
end
