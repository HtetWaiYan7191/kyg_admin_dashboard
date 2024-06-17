class PageController < ApplicationController
  skip_load_and_authorize_resource
  before_action :authenticate_user!, except: [:welcome, :landing]
  before_action :authenticate_kyg_user!, except: [:welcome]
  
  def welcome
    puts 'welcome method from controller'
  end

  def landing
    @banners = Banner.all
    @brand_categories = BrandCategory.includes(:brand_partners).all
  end
end
