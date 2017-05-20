# frozen_string_literal: true

10.times do |n|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "person#{n}@#{Faker::Internet.domain_name}",
    password: "password",
    password_confirmation: "password",
    sign_in_count: 1
  )
end

10.times do
  Term.create(name: Faker::Hipster.word)
end

20.times do
  lesson = Lesson.create(
    lesson_type: Lesson::LESSON_TYPES.sample,
    title: Faker::Book.title,
    body:  Faker::Hipster.paragraph,
    questions: Faker::Hipster.sentence,
    user: User.order('RANDOM()').take
  )

  3.times do
    lesson.lesson_terms.create(term: Term.order('RANDOM()').take)
  end
end

