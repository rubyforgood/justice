require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  describe 'GET #index' do
    before do
      sign_in volunteer
    end

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    before do
      sign_in volunteer
    end

    it 'returns http success' do
      get :show, id: volunteer.id
      expect(response).to have_http_status(:success)
    end
  end
end
