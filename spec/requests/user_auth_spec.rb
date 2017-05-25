require 'rails_helper'

RSpec.describe 'User auth', type: :request do
  context 'signing in with valid credentials' do
    let(:log_in) { post user_session_path, user: { email: volunteer.email, password: volunteer.password } }
    it 'redirects to /admin' do
      expect(log_in).to redirect_to 'http://www.example.com/admin'
    end
  end
end