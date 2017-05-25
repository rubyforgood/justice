# frozen_string_literal: true

FactoryGirl.define do
  factory :comfy_cms_site, class: Comfy::Cms::Site do
    label Faker::Book.title
    identifier 'site_identifier'
    hostname Faker::Internet.domain_name
  end
end
