# frozen_string_literal: true

FactoryGirl.define do
  factory :term do
    sequence(:name, 100) { |n| "#{Faker::Hipster.word + n.to_s}" }
  end
end
