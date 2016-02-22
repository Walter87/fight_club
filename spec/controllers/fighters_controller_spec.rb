# == Schema Information
#
# Table name: fighters
#
#  id                  :integer          not null, primary key
#  first_name          :string
#  last_name           :string
#  description         :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

require 'rails_helper'

RSpec.describe FightersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Fighter. As you add validations to Fighter, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:fighter)
  }

  let(:invalid_attributes) {
    attributes_for(:fighter, first_name: "")
  }


  describe "GET #index" do
    it "assigns all fighters as fighters" do
      fighter = Fighter.create! valid_attributes
      get :index, {}
      expect(controller.fighters).to eq([fighter])
    end
  end

  describe "GET #show" do
    it "assigns the requested fighter as fighter" do
      fighter = Fighter.create! valid_attributes
      get :show, {:id => fighter.to_param}
      expect(controller.fighter).to eq(fighter)
    end
  end

  describe "GET #new" do
    it "assigns a new fighter as fighter" do
      get :new, {}
      expect(controller.fighter).to be_a_new(Fighter)
    end
  end

  describe "GET #edit" do
    it "assigns the requested fighter as fighter" do
      fighter = Fighter.create! valid_attributes
      get :edit, {:id => fighter.to_param}
      expect(controller.fighter).to eq(fighter)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Fighter" do
        expect {
          post :create, {:fighter => valid_attributes}
        }.to change(Fighter, :count).by(1)
      end

      it "assigns a newly created fighter as fighter" do
        post :create, {:fighter => valid_attributes}
        expect(controller.fighter).to be_a(Fighter)
        expect(controller.fighter).to be_persisted
      end

      it "redirects to the created fighter" do
        post :create, {:fighter => valid_attributes}
        expect(response).to redirect_to(Fighter.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved fighter as fighter" do
        post :create, {:fighter => invalid_attributes}
        expect(controller.fighter).to be_a_new(Fighter)
      end

      it "re-renders the 'new' template" do
        post :create, {:fighter => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:fighter, first_name: "Dave", last_name: "Bowe")
      }

      it "updates the requested fighter" do
        fighter = Fighter.create! valid_attributes
        put :update, {:id => fighter.to_param, :fighter => new_attributes}
        fighter.reload
        expect(controller.fighter.first_name).to eq("Dave")
        expect(controller.fighter.last_name).to eq("Bowe")
      end

      it "assigns the requested fighter as fighter" do
        fighter = Fighter.create! valid_attributes
        put :update, {:id => fighter.to_param, :fighter => valid_attributes}
        expect(controller.fighter).to eq(fighter)
      end

      it "redirects to the fighter" do
        fighter = Fighter.create! valid_attributes
        put :update, {:id => fighter.to_param, :fighter => valid_attributes}
        expect(response).to redirect_to(fighter)
      end
    end

    context "with invalid params" do
      it "assigns the fighter as fighter" do
        fighter = Fighter.create! valid_attributes
        put :update, {:id => fighter.to_param, :fighter => invalid_attributes}
        expect(controller.fighter).to eq(fighter)
      end

      it "re-renders the 'edit' template" do
        fighter = Fighter.create! valid_attributes
        put :update, {:id => fighter.to_param, :fighter => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested fighter" do
      fighter = Fighter.create! valid_attributes
      expect {
        delete :destroy, {:id => fighter.to_param}
      }.to change(Fighter, :count).by(-1)
    end

    it "redirects to the fighters list" do
      fighter = Fighter.create! valid_attributes
      delete :destroy, {:id => fighter.to_param}
      expect(response).to redirect_to(fighters_url)
    end
  end

end
