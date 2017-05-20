# frozen_string_literal: true

class CreateTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :terms do |t|
      t.string :name

      t.timestamps
    end
  end
end
