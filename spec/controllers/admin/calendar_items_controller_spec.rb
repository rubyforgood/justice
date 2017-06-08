# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::CalendarItemsController, type: :controller do
  before do
    @calendar_item = FactoryGirl.create(:calendar_item)
  end
  context 'regular user can see' do
  	before do
      sign_in volunteer
    end
    it 'get index' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'get new' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'show calendar' do
      get :show, params: { id: @calendar_item.id }
      expect(response).to have_http_status(:success)
    end	
  end
end