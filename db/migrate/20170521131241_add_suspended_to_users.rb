# frozen_string_literal: true

class AddSuspendedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :suspended, :boolean, default: false, null: false
  end
end
