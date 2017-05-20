class AddAttachmentDocumentToLessons < ActiveRecord::Migration
  def change
    add_attachment :lessons, :document
  end
end
