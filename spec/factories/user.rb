FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    sequence(:email, 100) { |n| "person#{n}@#{Faker::Internet.domain_name}" }
    password "password"
    password_confirmation "password"
    sign_in_count 1

    trait :admin do
      admin true
    end

    trait :super_user do
      super_user true
    end
  end
end