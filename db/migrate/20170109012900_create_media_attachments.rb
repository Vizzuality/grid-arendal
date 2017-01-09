class CreateMediaAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :media_attachments do |t|
      t.string :document_file_name
      t.string :document_content_type
      t.integer :document_file_size
      t.datetime :document_updated_at

      t.timestamps
    end
  end
end
