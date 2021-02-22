require "rails_helper"

RSpec.describe UttrancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/uttrances").to route_to("uttrances#index")
    end

    it "routes to #new" do
      expect(get: "/uttrances/new").to route_to("uttrances#new")
    end

    it "routes to #show" do
      expect(get: "/uttrances/1").to route_to("uttrances#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/uttrances/1/edit").to route_to("uttrances#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/uttrances").to route_to("uttrances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/uttrances/1").to route_to("uttrances#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/uttrances/1").to route_to("uttrances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/uttrances/1").to route_to("uttrances#destroy", id: "1")
    end
  end
end
