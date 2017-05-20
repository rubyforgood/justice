# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Term.create(name: Faker::Hipster.word)
end

20.times do
  lesson = Lesson.create(
    byline: Faker::Company.bs,
    lesson_type: Lesson::LESSON_TYPES.sample,
    title: Faker::Book.title,
    body:  Faker::Hipster.paragraph,
    questions: Faker::Hipster.sentence
  )
  3.times do
    lesson.lesson_terms.create( term: Term.order("RANDOM()").take)
  end
end