class AddPrimaryPhotoIdToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :main_photo_id,  :string
    add_column :albums, :main_photo_url, :string
  end
end
