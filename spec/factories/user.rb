FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
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

    trait :volunteer do
      admin false
      super_user false
    end
  end
end
