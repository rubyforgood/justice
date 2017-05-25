require 'rails_helper'

RSpec.describe 'User auth', type: :request do
  describe 'signing in' do
    let(:params) { { user: { email: volunteer.email, password: volunteer.password } } }
    let(:log_in) { post user_session_path, params: params }

    context 'with valid credentials' do
      it 'redirects to /admin' do
        expect(log_in).to redirect_to 'http://www.example.com/admin'
      end
    end

    context 'when the user has not been approved' do
      let(:volunteer) { FactoryGirl.create(:user, :volunteer, approved: false) }

      it 'wont log in the user' do
        expect(log_in).to redirect_to 'http://www.example.com/users/sign_in'
        expect(flash[:alert]).to eq 'Your account has not been approved by your administrator yet.'
      end
    end
  end

  describe 'signing up' do
    let(:email) { 'new@user.com' }
    let(:params) { { user: { email: email, password: '123456', password_confirmation: '123456' } } }
    let(:sign_up) { post user_registration_path, params: params  }

    it 'creates a new user' do
      expect { sign_up }.to change { User.count }.by(1)
      expect(User.where(email: email).first.approved).to eq false
    end

    it 'wont log in the user' do
      expect(sign_up).to redirect_to 'http://www.example.com/'
      expect(flash[:notice]).to eq 'You have signed up successfully but your account has not been approved by your administrator yet.'
    end
  end
end