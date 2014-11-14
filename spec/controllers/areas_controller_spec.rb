require 'rails_helper'

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

RSpec.describe AreasController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Area. As you add validations to Area, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:area)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:area, state: nil, name:nil, latitude: nil, longitude: nil, zoom:nil, )
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AreasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  describe "GET index" do

    before(:each) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start
    end

    after(:each) do
      DatabaseCleaner.clean
    end

    it "assigns all areas as @areas" do
      area = Area.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:areas)).to eq([area])
    end
  end

  describe "GET show" do
    it "assigns the requested area as @area" do
      area = Area.create! valid_attributes
      get :show, {:id => area.to_param}, valid_session
      expect(assigns(:area)).to eq(area)
    end
  end

  describe "GET new" do
    it "assigns a new area as @area" do
      get :new, {}, valid_session
      expect(assigns(:area)).to be_a_new(Area)
    end
  end

  describe "GET edit" do
    it "assigns the requested area as @area" do
      area = Area.create! valid_attributes
      get :edit, {:id => area.to_param}, valid_session
      expect(assigns(:area)).to eq(area)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Area" do
        puts Area.count
        expect {
          post :create, {:area => valid_attributes}, valid_session
        }.to change(Area, :count).by(1)
      end

      it "assigns a newly created area as @area" do
        post :create, {:area => valid_attributes}, valid_session
        expect(assigns(:area)).to be_a(Area)
        expect(assigns(:area)).to be_persisted
      end

      it "redirects to the created area" do
        post :create, {:area => valid_attributes}, valid_session
        expect(response).to redirect_to(Area.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved area as @area" do
        post :create, {:area => invalid_attributes}, valid_session
        expect(assigns(:area)).to be_a_new(Area)
      end

      it "re-renders the 'new' template" do
        post :create, {:area => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:area, name:"It's Jimmy!")
      }

      it "updates the requested area" do
        area = Area.create! valid_attributes
        put :update, {:id => area.to_param, :area => new_attributes}, valid_session
        area.reload
        expect(area.name).to eq("It's Jimmy!")
      end

      it "assigns the requested area as @area" do
        area = Area.create! valid_attributes
        put :update, {:id => area.to_param, :area => valid_attributes}, valid_session
        expect(assigns(:area)).to eq(area)
      end

      it "redirects to the area" do
        area = Area.create! valid_attributes
        put :update, {:id => area.to_param, :area => valid_attributes}, valid_session
        expect(response).to redirect_to(area)
      end
    end

    describe "with invalid params" do
      it "assigns the area as @area" do
        area = Area.create! valid_attributes
        put :update, {:id => area.to_param, :area => invalid_attributes}, valid_session
        expect(assigns(:area)).to eq(area)
      end

      it "re-renders the 'edit' template" do
        area = Area.create! valid_attributes
        put :update, {:id => area.to_param, :area => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested area" do
      area = Area.create! valid_attributes
      expect {
        delete :destroy, {:id => area.to_param}, valid_session
      }.to change(Area, :count).by(-1)
    end

    it "redirects to the areas list" do
      area = Area.create! valid_attributes
      delete :destroy, {:id => area.to_param}, valid_session
      expect(response).to redirect_to(areas_url)
    end
  end

end
