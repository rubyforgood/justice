class Term < ApplicationRecord
  has_many :lesson_terms
  has_many :lessons, through: :lesson_terms
  validates_presence_of :name
end
