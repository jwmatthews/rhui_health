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

describe RhuasController do

  # This should return the minimal set of attributes required to create a valid
  # Rhua. As you add validations to Rhua, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RhuasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all rhuas as @rhuas" do
      rhua = Rhua.create! valid_attributes
      get :index, {}, valid_session
      assigns(:rhuas).should eq([rhua])
    end
  end

  describe "GET show" do
    it "assigns the requested rhua as @rhua" do
      rhua = Rhua.create! valid_attributes
      get :show, {:id => rhua.to_param}, valid_session
      assigns(:rhua).should eq(rhua)
    end
  end

  describe "GET new" do
    it "assigns a new rhua as @rhua" do
      get :new, {}, valid_session
      assigns(:rhua).should be_a_new(Rhua)
    end
  end

  describe "GET edit" do
    it "assigns the requested rhua as @rhua" do
      rhua = Rhua.create! valid_attributes
      get :edit, {:id => rhua.to_param}, valid_session
      assigns(:rhua).should eq(rhua)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Rhua" do
        expect {
          post :create, {:rhua => valid_attributes}, valid_session
        }.to change(Rhua, :count).by(1)
      end

      it "assigns a newly created rhua as @rhua" do
        post :create, {:rhua => valid_attributes}, valid_session
        assigns(:rhua).should be_a(Rhua)
        assigns(:rhua).should be_persisted
      end

      it "redirects to the created rhua" do
        post :create, {:rhua => valid_attributes}, valid_session
        response.should redirect_to(Rhua.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved rhua as @rhua" do
        # Trigger the behavior that occurs when invalid params are submitted
        Rhua.any_instance.stub(:save).and_return(false)
        post :create, {:rhua => { "name" => "invalid value" }}, valid_session
        assigns(:rhua).should be_a_new(Rhua)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Rhua.any_instance.stub(:save).and_return(false)
        post :create, {:rhua => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested rhua" do
        rhua = Rhua.create! valid_attributes
        # Assuming there are no other rhuas in the database, this
        # specifies that the Rhua created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Rhua.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => rhua.to_param, :rhua => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested rhua as @rhua" do
        rhua = Rhua.create! valid_attributes
        put :update, {:id => rhua.to_param, :rhua => valid_attributes}, valid_session
        assigns(:rhua).should eq(rhua)
      end

      it "redirects to the rhua" do
        rhua = Rhua.create! valid_attributes
        put :update, {:id => rhua.to_param, :rhua => valid_attributes}, valid_session
        response.should redirect_to(rhua)
      end
    end

    describe "with invalid params" do
      it "assigns the rhua as @rhua" do
        rhua = Rhua.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Rhua.any_instance.stub(:save).and_return(false)
        put :update, {:id => rhua.to_param, :rhua => { "name" => "invalid value" }}, valid_session
        assigns(:rhua).should eq(rhua)
      end

      it "re-renders the 'edit' template" do
        rhua = Rhua.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Rhua.any_instance.stub(:save).and_return(false)
        put :update, {:id => rhua.to_param, :rhua => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested rhua" do
      rhua = Rhua.create! valid_attributes
      expect {
        delete :destroy, {:id => rhua.to_param}, valid_session
      }.to change(Rhua, :count).by(-1)
    end

    it "redirects to the rhuas list" do
      rhua = Rhua.create! valid_attributes
      delete :destroy, {:id => rhua.to_param}, valid_session
      response.should redirect_to(rhuas_url)
    end
  end

end
