class AddPhotoIdToSiteSections < ActiveRecord::Migration[5.0]
  def change
    add_column :site_sections, :photo_id, :integer
    add_foreign_key "site_sections", "media_contents", column: "photo_id"
  end
end
