require 'rails_helper'

RSpec.describe FightsController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:fight)
  }

  let(:invalid_attributes) {
    attributes_for(:fight, opponent_id: "")
  }


  describe "GET #index" do
    it "assigns all fights as fights" do
      fight = Fight.create! valid_attributes
      get :index, {}
      expect(controller.fights).to eq([fight])
    end
  end

  describe "GET #show" do
    it "assigns the requested fight as fight" do
      fight = Fight.create! valid_attributes
      get :show, {:id => fight.to_param}
      expect(controller.fight).to eq(fight)
    end
  end

  describe "GET #new" do
    it "assigns a new fight as fight" do
      get :new, {}
      expect(controller.fight).to be_a_new(Fight)
    end
  end

  describe "GET #edit" do
    it "assigns the requested fight as fight" do
      fight = Fight.create! valid_attributes
      get :edit, {:id => fight.to_param}
      expect(controller.fight).to eq(fight)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Fight" do
        expect {
          post :create, {:fight => valid_attributes}
        }.to change(Fight, :count).by(1)
      end

      it "assigns a newly created fight as fight" do
        post :create, {:fight => valid_attributes}
        expect(controller.fight).to be_a(Fight)
        expect(controller.fight).to be_persisted
      end

      it "redirects to the created fight" do
        post :create, {:fight => valid_attributes}
        expect(response).to redirect_to(Fight.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved fighter as fighter" do
        post :create, {:fight => invalid_attributes}
        expect(controller.fight).to be_a_new(Fight)
      end

      it "re-renders the 'new' template" do
        post :create, {:fight => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end





end
