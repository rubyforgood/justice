# frozen_string_literal: true

class AddAttachmentDocumentToLessons < ActiveRecord::Migration
  def change
    add_attachment :lessons, :document
  end
end
