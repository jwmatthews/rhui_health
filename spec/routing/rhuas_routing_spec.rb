require "spec_helper"

describe RhuasController do
  describe "routing" do

    it "routes to #index" do
      get("/rhuas").should route_to("rhuas#index")
    end

    it "routes to #new" do
      get("/rhuas/new").should route_to("rhuas#new")
    end

    it "routes to #show" do
      get("/rhuas/1").should route_to("rhuas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/rhuas/1/edit").should route_to("rhuas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/rhuas").should route_to("rhuas#create")
    end

    it "routes to #update" do
      put("/rhuas/1").should route_to("rhuas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/rhuas/1").should route_to("rhuas#destroy", :id => "1")
    end

  end
end
