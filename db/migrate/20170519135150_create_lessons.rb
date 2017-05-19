class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.text :byline
      t.string :lesson_type
      t.text :terms, array: true, default: []
      t.integer :user_id
      t.string :title
      t.text :body
      t.text :links, array: true, default: []
      t.text :questions

      t.timestamps
    end
  end
end
