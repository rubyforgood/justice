module LoginSupport
  extend ActiveSupport::Concern

  included do
    let(:admin) { FactoryGirl.create(:user, :admin) }
    let(:super_user) { FactoryGirl.create(:user, :super_user) }
    let(:volunteer) { FactoryGirl.create(:user, :volunteer) }
  end
end