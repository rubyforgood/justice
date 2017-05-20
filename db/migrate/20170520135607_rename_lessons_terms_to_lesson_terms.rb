# frozen_string_literal: true

class RenameLessonsTermsToLessonTerms < ActiveRecord::Migration[5.0]
  def change
    rename_table :lessons_terms, :lesson_terms
  end
end
