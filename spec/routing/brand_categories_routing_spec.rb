require "rails_helper"

RSpec.describe BrandCategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/brand_categories").to route_to("brand_categories#index")
    end

    it "routes to #new" do
      expect(get: "/brand_categories/new").to route_to("brand_categories#new")
    end

    it "routes to #show" do
      expect(get: "/brand_categories/1").to route_to("brand_categories#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/brand_categories/1/edit").to route_to("brand_categories#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/brand_categories").to route_to("brand_categories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/brand_categories/1").to route_to("brand_categories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/brand_categories/1").to route_to("brand_categories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/brand_categories/1").to route_to("brand_categories#destroy", id: "1")
    end
  end
end
