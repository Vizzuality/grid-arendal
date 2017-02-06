class CreateGraphicRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :graphic_requests do |t|
      t.integer :media_attachment_id
      t.string :email
      t.string :name

      t.timestamps
    end
    add_foreign_key "graphic_requests", "media_attachments"
  end
end
