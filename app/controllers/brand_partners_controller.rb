class BrandPartnersController < ApplicationController
  load_and_authorize_resource
  before_action :set_brand_partner, only: %i[ show edit update destroy ]
  # before_action :check_management_access
  # GET /brand_partners or /brand_partners.json
  def index 
      if params[:query]
       @brand_partners = BrandPartner.where("LOWER(name) LIKE ?", "%#{params[:query]}%").page(params[:page]).per(4)
       return
      end
       if params[:brand_category_id] == "all" || params[:brand_category_id].blank?
        @brand_partners = BrandPartner.includes(:brand_category).order(:name).page(params[:page]).per(4)
      else
        @brand_category = BrandCategory.find(params[:brand_category_id])
        @brand_partners = @brand_category.brand_partners.order(:name).page(params[:page]).per(4)
      end
  end

  # GET /brand_partners/1 or /brand_partners/1.json
  def show
    @items = @brand_partner.items
    @brand_partner
  end

  # GET /brand_partners/new
  def new
    @brand_partner = BrandPartner.new
    @brand_partner.benefits.build
  end

  # GET /brand_partners/1/edit
  def edit
    @brand_partner.benefits.build if @brand_partner.benefits.empty?
  end

  # POST /brand_partners or /brand_partners.json
  def create
    @brand_partner = BrandPartner.new(brand_partner_params)

    respond_to do |format|
      if @brand_partner.save
        format.html { redirect_to brand_partners_path, notice: "Brand partner was successfully created." }
        format.json { render :show, status: :created, location: @brand_partner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @brand_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brand_partners/1 or /brand_partners/1.json
  def update
    respond_to do |format|
      if @brand_partner.update(brand_partner_params)
        format.html { redirect_to  brand_partners_path, notice: "Brand partner was successfully updated." }
        format.json { render :show, status: :ok, location: @brand_partner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @brand_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brand_partners/1 or /brand_partners/1.json
  def destroy
    @brand_partner.destroy!

    respond_to do |format|
      format.html { redirect_to brand_partners_url, notice: "Brand partner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand_partner
      @brand_partner = BrandPartner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def brand_partner_params
      params.require(:brand_partner).permit(:name, :brand_category_id, :image, benefits_attributes: [:id, :content, :remark, :_destroy])
    end
end
