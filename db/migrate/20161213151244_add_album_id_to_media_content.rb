class AddAlbumIdToMediaContent < ActiveRecord::Migration[5.0]
  def change
    add_column :media_contents, :album_id, :integer
  end
end
