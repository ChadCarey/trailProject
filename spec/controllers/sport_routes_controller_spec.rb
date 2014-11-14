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

RSpec.describe SportRoutesController, :type => :controller do


  before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:sport_route)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:sport_route, name:nil, latitude: nil, longitude: nil, zoom:nil, )
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SportRoutesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  # GET
  describe "GET" do

    before(:each) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.start
      DatabaseCleaner.clean
    end

    context "index" do
      it "assigns all sport_routes as @sport_routes" do
        sport_route = SportRoute.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:sport_routes)).to eq([sport_route])
      end
    end

    describe "show" do
      it "assigns the requested sport_route as @sport_route" do
        sport_route = SportRoute.create! valid_attributes
        get :show, {:id => sport_route.to_param}, valid_session
        expect(assigns(:sport_route)).to eq(sport_route)
      end
    end

    describe "new" do
      it "assigns a new sport_route as @sport_route" do
        get :new, {}, valid_session
        expect(assigns(:sport_route)).to be_a_new(SportRoute)
      end
    end

    describe "edit" do
      it "assigns the requested sport_route as @sport_route" do
        sport_route = SportRoute.create! valid_attributes
        get :edit, {:id => sport_route.to_param}, valid_session
        expect(assigns(:sport_route)).to eq(sport_route)
      end
    end

    describe "json" do
      it "returns a valid json object" do
        subject = FactoryGirl.create(:sport_route, id:1)
        json = get(:getJson, {}, valid_session)
        expect(json).to_not be_nil;
      end
    end

  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SportRoute" do
        expect {
          post :create, {:sport_route => valid_attributes}, valid_session
        }.to change(SportRoute, :count).by(1)
      end

      it "assigns a newly created sport_route as @sport_route" do
        post :create, {:sport_route => valid_attributes}, valid_session
        expect(assigns(:sport_route)).to be_a(SportRoute)
        expect(assigns(:sport_route)).to be_persisted
      end

      it "redirects to the created sport_route" do
        post :create, {:sport_route => valid_attributes}, valid_session
        expect(response).to redirect_to(SportRoute.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sport_route as @sport_route" do
        post :create, {:sport_route => invalid_attributes}, valid_session
        expect(assigns(:sport_route)).to be_a_new(SportRoute)
      end

      it "re-renders the 'new' template" do
        post :create, {:sport_route => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:sport_route, name:"It's Jimmy!")
      }

      it "updates the requested sport_route" do
        sport_route = SportRoute.create! valid_attributes
        put :update, {:id => sport_route.to_param, :sport_route => new_attributes}, valid_session
        sport_route.reload
        expect(sport_route.name).to eq("It's Jimmy!")
      end

      it "assigns the requested sport_route as @sport_route" do
        sport_route = SportRoute.create! valid_attributes
        put :update, {:id => sport_route.to_param, :sport_route => valid_attributes}, valid_session
        expect(assigns(:sport_route)).to eq(sport_route)
      end

      it "redirects to the sport_route" do
        sport_route = SportRoute.create! valid_attributes
        put :update, {:id => sport_route.to_param, :sport_route => valid_attributes}, valid_session
        expect(response).to redirect_to(sport_route)
      end
    end

    describe "with invalid params" do
      it "assigns the sport_route as @sport_route" do
        sport_route = SportRoute.create! valid_attributes
        put :update, {:id => sport_route.to_param, :sport_route => invalid_attributes}, valid_session
        expect(assigns(:sport_route)).to eq(sport_route)
      end

      it "re-renders the 'edit' template" do
        sport_route = SportRoute.create! valid_attributes
        put :update, {:id => sport_route.to_param, :sport_route => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sport_route" do
      sport_route = SportRoute.create! valid_attributes
      expect {
        delete :destroy, {:id => sport_route.to_param}, valid_session
      }.to change(SportRoute, :count).by(-1)
    end

    it "redirects to the sport_routes list" do
      sport_route = SportRoute.create! valid_attributes
      delete :destroy, {:id => sport_route.to_param}, valid_session
      expect(response).to redirect_to(sport_routes_url)
    end
  end

end
