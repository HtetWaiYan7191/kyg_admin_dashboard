class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    # Retrieve all items for a specific brand partner
    @brand_partner = BrandPartner.find(params[:brand_partner_id])
    @items = @brand_partner.items
  end

  def show
    # Retrieve a specific item for a specific brand partner
  end

  def new
    # Create a new item for a specific brand partner
    @brand_partner = BrandPartner.find(params[:brand_partner_id])
    @item = @brand_partner.items.new
  end

  def create
    # Create a new item for a specific brand partner
    @brand_partner = BrandPartner.find(params[:brand_partner_id])
    @item = @brand_partner.items.new(item_params)

    if @item.save
      redirect_to brand_partner_path(@brand_partner), notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # Edit an existing item for a specific brand partner
  end

  def update
    # Update an existing item for a specific brand partner

    if @item.update(item_params)
      redirect_to brand_partner_path(@brand_partner), notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # Delete an existing item for a specific brand partner
    if @item.destroy
      redirect_to brand_partner_path(@brand_partner), notice: 'Item was successfully destroyed.'
    end
  end

  private

  def set_item
    @brand_partner = BrandPartner.find(params[:brand_partner_id])
    @item = @brand_partner.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :content, :discount_percentage, :brand_partner_id, images: [])
  end
end
