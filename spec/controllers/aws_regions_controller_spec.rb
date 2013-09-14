require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AwsRegionsController do

  # This should return the minimal set of attributes required to create a valid
  # AwsRegion. As you add validations to AwsRegion, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AwsRegionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all aws_regions as @aws_regions" do
      aws_region = AwsRegion.create! valid_attributes
      get :index, {}, valid_session
      assigns(:aws_regions).should eq([aws_region])
    end
  end

  describe "GET show" do
    it "assigns the requested aws_region as @aws_region" do
      aws_region = AwsRegion.create! valid_attributes
      get :show, {:id => aws_region.to_param}, valid_session
      assigns(:aws_region).should eq(aws_region)
    end
  end

  describe "GET new" do
    it "assigns a new aws_region as @aws_region" do
      get :new, {}, valid_session
      assigns(:aws_region).should be_a_new(AwsRegion)
    end
  end

  describe "GET edit" do
    it "assigns the requested aws_region as @aws_region" do
      aws_region = AwsRegion.create! valid_attributes
      get :edit, {:id => aws_region.to_param}, valid_session
      assigns(:aws_region).should eq(aws_region)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AwsRegion" do
        expect {
          post :create, {:aws_region => valid_attributes}, valid_session
        }.to change(AwsRegion, :count).by(1)
      end

      it "assigns a newly created aws_region as @aws_region" do
        post :create, {:aws_region => valid_attributes}, valid_session
        assigns(:aws_region).should be_a(AwsRegion)
        assigns(:aws_region).should be_persisted
      end

      it "redirects to the created aws_region" do
        post :create, {:aws_region => valid_attributes}, valid_session
        response.should redirect_to(AwsRegion.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved aws_region as @aws_region" do
        # Trigger the behavior that occurs when invalid params are submitted
        AwsRegion.any_instance.stub(:save).and_return(false)
        post :create, {:aws_region => { "name" => "invalid value" }}, valid_session
        assigns(:aws_region).should be_a_new(AwsRegion)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        AwsRegion.any_instance.stub(:save).and_return(false)
        post :create, {:aws_region => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested aws_region" do
        aws_region = AwsRegion.create! valid_attributes
        # Assuming there are no other aws_regions in the database, this
        # specifies that the AwsRegion created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        AwsRegion.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => aws_region.to_param, :aws_region => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested aws_region as @aws_region" do
        aws_region = AwsRegion.create! valid_attributes
        put :update, {:id => aws_region.to_param, :aws_region => valid_attributes}, valid_session
        assigns(:aws_region).should eq(aws_region)
      end

      it "redirects to the aws_region" do
        aws_region = AwsRegion.create! valid_attributes
        put :update, {:id => aws_region.to_param, :aws_region => valid_attributes}, valid_session
        response.should redirect_to(aws_region)
      end
    end

    describe "with invalid params" do
      it "assigns the aws_region as @aws_region" do
        aws_region = AwsRegion.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AwsRegion.any_instance.stub(:save).and_return(false)
        put :update, {:id => aws_region.to_param, :aws_region => { "name" => "invalid value" }}, valid_session
        assigns(:aws_region).should eq(aws_region)
      end

      it "re-renders the 'edit' template" do
        aws_region = AwsRegion.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AwsRegion.any_instance.stub(:save).and_return(false)
        put :update, {:id => aws_region.to_param, :aws_region => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested aws_region" do
      aws_region = AwsRegion.create! valid_attributes
      expect {
        delete :destroy, {:id => aws_region.to_param}, valid_session
      }.to change(AwsRegion, :count).by(-1)
    end

    it "redirects to the aws_regions list" do
      aws_region = AwsRegion.create! valid_attributes
      delete :destroy, {:id => aws_region.to_param}, valid_session
      response.should redirect_to(aws_regions_url)
    end
  end

end