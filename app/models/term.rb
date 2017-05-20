# frozen_string_literal: true

class Term < ApplicationRecord
  has_many :lesson_terms
  has_many :lessons, through: :lesson_terms
  validates_presence_of :name
  validates_uniqueness_of :name
end
