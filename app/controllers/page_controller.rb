class PageController < ApplicationController
  before_action :authenticate_user!, except: [:welcome, :landing]
  before_action :authenticate_kyg_user!, except: [:welcome]
  
  def welcome
  end

  def landing
    @brand_categories = BrandCategory.includes(:brand_partners).all
  end
end
