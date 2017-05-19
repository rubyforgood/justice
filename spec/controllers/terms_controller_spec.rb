require 'rails_helper'

RSpec.describe TermsController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:term)
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      term = FactoryGirl.create(:term)
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      term = FactoryGirl.create(:term)
      get :show, params: {id: term.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      term = FactoryGirl.create(:term)
      get :edit, params: {id: term.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Term" do
        expect {
          post :create, params: {term: valid_attributes}
        }.to change(Term, :count).by(1)
      end

      it "redirects to the created term" do
        post :create, params: {term: valid_attributes}
        expect(response).to redirect_to(Term.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {term: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "RAINBOWS!" }
      }

      it "updates the requested term" do
        term = FactoryGirl.create(:term)
        put :update, params: {id: term.to_param, term: new_attributes}
        term.reload
        expect(term.name).to eq("RAINBOWS!")
      end

      it "redirects to the term" do
        term = FactoryGirl.create(:term)
        put :update, params: {id: term.to_param, term: valid_attributes}
        expect(response).to redirect_to(term)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        term = FactoryGirl.create(:term)
        put :update, params: {id: term.to_param, term: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested term" do
      term = FactoryGirl.create(:term)
      expect {
        delete :destroy, params: {id: term.to_param}
      }.to change(Term, :count).by(-1)
    end

    it "redirects to the terms list" do
      term = FactoryGirl.create(:term)
      delete :destroy, params: {id: term.to_param}
      expect(response).to redirect_to(terms_url)
    end
  end

end
