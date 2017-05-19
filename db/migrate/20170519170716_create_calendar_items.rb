class CreateCalendarItems < ActiveRecord::Migration[5.0]
  def change
    create_table :calendar_items do |t|
      t.string :title
      t.string :body
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
