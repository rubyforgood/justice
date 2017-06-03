require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  let(:first_name) { 'first' }
  let(:last_name) { 'last' }
  let(:email) { 'em@a.il' }
  let(:password) { 'new_password' }

  before do
    sign_in admin
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: volunteer.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:params) { { first_name: first_name, last_name: last_name, email: email, password: password } }

    it 'creates an user' do
      expect do
        post :create, params: { user: params }
      end.to change { User.count }.by(1)
      user = User.where(email: email).first
      expect(user.first_name).to eq first_name
      expect(user.last_name).to eq last_name
    end
  end

  describe 'PUT #update' do
    let(:update_params) { { first_name: first_name, last_name: last_name, email: email, password: password, approved: false, suspended: true } }
    let(:request) { patch :update, params: { id: volunteer.id, user: update_params } }
    let(:user) { User.where(email: email).first }


    it 'updates the user' do
      request
      expect(response).to redirect_to(admin_user_url(user))

      expect(user.first_name).to eq first_name
      expect(user.last_name).to eq last_name
      expect(user.approved).to eq false
      expect(user.suspended).to eq true
    end

    context 'when the new password is blank' do
      let(:password) { '' }
      let!(:original_password) { volunteer.encrypted_password }

      it 'ignores it' do
        request
        volunteer.reload
        expect(volunteer.first_name).to eq first_name
        expect(volunteer.encrypted_password).to eq original_password
      end
    end
  end
end
