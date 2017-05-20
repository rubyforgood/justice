# frozen_string_literal: true

class Lesson < ApplicationRecord
  include PgSearch

  ACTIVITY = 'Activity-based'
  ARTICLE = 'Article-based'
  LESSON_TYPES = [ACTIVITY, ARTICLE].freeze

  has_many :lesson_terms
  has_many :terms, through: :lesson_terms

  validates_presence_of :body, :lesson_type, :questions, :title
  validates_inclusion_of :lesson_type, in: LESSON_TYPES

  pg_search_scope :search_by_title, against: :title
end
