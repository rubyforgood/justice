class UpdateLessonsTerms < ActiveRecord::Migration[5.0]
  def change
    remove_column :lessons, :terms

    create_table :lessons_terms, id: false do |t|
      t.belongs_to :lesson, index: true
      t.belongs_to :term, index: true
    end
  end
end
