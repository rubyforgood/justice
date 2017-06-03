10.times do
  Term.create(name: Faker::Hipster.word)
end

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    status: %w[Active Blocked].sample
  )
end

20.times do
  lesson = Lesson.create(
    lesson_type: Lesson::LESSON_TYPES.sample,
    title: Faker::Book.title,
    body:  Faker::Lorem.paragraphs(rand(1..4)),
    questions: Faker::StarWars.quote + '?',
    # randomly assigns user to lesson
    user_id: User.order('RANDOM()').first.id
  )

  3.times do
    lesson.lesson_terms.create(term: Term.order('RANDOM()').take)
  end
end
