class Lesson < ApplicationRecord
  has_and_belongs_to_many :terms
  validates_presence_of :body, :lesson_type, :questions, :title
  validates_inclusion_of :lesson_type, in: ["Activity-based", "Article-based"]
end
