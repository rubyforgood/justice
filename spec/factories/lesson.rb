# frozen_string_literal: true

FactoryGirl.define do
  factory :lesson do
    lesson_type Lesson::LESSON_TYPES.sample
    terms { [FactoryGirl.create(:term)] }
    title Faker::Book.title
    body  Faker::Hipster.paragraph
    questions Faker::Hipster.sentence
    user { FactoryGirl.create :user }
  end
end
