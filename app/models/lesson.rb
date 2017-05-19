class Lesson < ApplicationRecord
  ACTIVITY = "Activity-based"
  ARTICLE = "Article-based"
  LESSON_TYPES = [ACTIVITY, ARTICLE]
  has_and_belongs_to_many :terms
  validates_presence_of :body, :lesson_type, :questions, :title
  validates_inclusion_of :lesson_type, in: LESSON_TYPES
end
