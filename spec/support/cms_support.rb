module CmsSupport
  extend ActiveSupport::Concern

  included do
    include LoginSupport
    let!(:site) { FactoryGirl.create :comfy_cms_site }
  end
end