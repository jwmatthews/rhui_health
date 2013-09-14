require "spec_helper"

describe AwsRegionsController do
  describe "routing" do

    it "routes to #index" do
      get("/aws_regions").should route_to("aws_regions#index")
    end

    it "routes to #new" do
      get("/aws_regions/new").should route_to("aws_regions#new")
    end

    it "routes to #show" do
      get("/aws_regions/1").should route_to("aws_regions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/aws_regions/1/edit").should route_to("aws_regions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/aws_regions").should route_to("aws_regions#create")
    end

    it "routes to #update" do
      put("/aws_regions/1").should route_to("aws_regions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/aws_regions/1").should route_to("aws_regions#destroy", :id => "1")
    end

  end
end
