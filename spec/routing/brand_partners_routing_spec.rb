require "rails_helper"

RSpec.describe BrandPartnersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/brand_partners").to route_to("brand_partners#index")
    end

    it "routes to #new" do
      expect(get: "/brand_partners/new").to route_to("brand_partners#new")
    end

    it "routes to #show" do
      expect(get: "/brand_partners/1").to route_to("brand_partners#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/brand_partners/1/edit").to route_to("brand_partners#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/brand_partners").to route_to("brand_partners#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/brand_partners/1").to route_to("brand_partners#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/brand_partners/1").to route_to("brand_partners#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/brand_partners/1").to route_to("brand_partners#destroy", id: "1")
    end
  end
end
