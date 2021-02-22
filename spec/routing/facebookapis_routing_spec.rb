require "rails_helper"

RSpec.describe FacebookapisController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/facebookapis").to route_to("facebookapis#index")
    end

    it "routes to #new" do
      expect(get: "/facebookapis/new").to route_to("facebookapis#new")
    end

    it "routes to #show" do
      expect(get: "/facebookapis/1").to route_to("facebookapis#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/facebookapis/1/edit").to route_to("facebookapis#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/facebookapis").to route_to("facebookapis#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/facebookapis/1").to route_to("facebookapis#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/facebookapis/1").to route_to("facebookapis#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/facebookapis/1").to route_to("facebookapis#destroy", id: "1")
    end
  end
end
