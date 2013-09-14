require "spec_helper"

describe CdsController do
  describe "routing" do

    it "routes to #index" do
      get("/cds").should route_to("cds#index")
    end

    it "routes to #new" do
      get("/cds/new").should route_to("cds#new")
    end

    it "routes to #show" do
      get("/cds/1").should route_to("cds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cds/1/edit").should route_to("cds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cds").should route_to("cds#create")
    end

    it "routes to #update" do
      put("/cds/1").should route_to("cds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cds/1").should route_to("cds#destroy", :id => "1")
    end

  end
end
