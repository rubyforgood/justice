class RemoveBylineFromLessons < ActiveRecord::Migration[5.0]
  def change
    remove_column :lessons, :byline, :string
  end
end
