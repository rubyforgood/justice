# frozen_string_literal: true

class Lesson < ApplicationRecord
  include PgSearch

  ACTIVITY = 'Activity-based'
  ARTICLE = 'Article-based'
  LESSON_TYPES = [ACTIVITY, ARTICLE].freeze

  belongs_to :user
  has_many :lesson_terms
  has_many :terms, through: :lesson_terms
  has_attached_file :document
  belongs_to :user

  validates_presence_of :body, :lesson_type, :questions, :title
  validates_inclusion_of :lesson_type, in: LESSON_TYPES
  validates_attachment :document,
                       storage: :database,
                       content_type: {
                         content_type: [
                           'application/pdf',
                           'application/doc',
                           'application/docx'
                         ]
                       }
  validates_attachment_file_name :document, matches: [/pdf\z/, /docx?\z/]

  pg_search_scope :search_by_title, against: :title
end
