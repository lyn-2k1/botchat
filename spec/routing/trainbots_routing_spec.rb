require "rails_helper"

RSpec.describe TrainbotsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/trainbots").to route_to("trainbots#index")
    end

    it "routes to #new" do
      expect(get: "/trainbots/new").to route_to("trainbots#new")
    end

    it "routes to #show" do
      expect(get: "/trainbots/1").to route_to("trainbots#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/trainbots/1/edit").to route_to("trainbots#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/trainbots").to route_to("trainbots#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/trainbots/1").to route_to("trainbots#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/trainbots/1").to route_to("trainbots#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/trainbots/1").to route_to("trainbots#destroy", id: "1")
    end
  end
end
