require "rails_helper"

RSpec.describe FaceapisController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/faceapis").to route_to("faceapis#index")
    end

    it "routes to #new" do
      expect(get: "/faceapis/new").to route_to("faceapis#new")
    end

    it "routes to #show" do
      expect(get: "/faceapis/1").to route_to("faceapis#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/faceapis/1/edit").to route_to("faceapis#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/faceapis").to route_to("faceapis#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/faceapis/1").to route_to("faceapis#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/faceapis/1").to route_to("faceapis#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/faceapis/1").to route_to("faceapis#destroy", id: "1")
    end
  end
end
