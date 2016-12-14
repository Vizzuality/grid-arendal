class RemoveMediaContentsAlbumsPhotosAlbumRelations < ActiveRecord::Migration[5.0]
  def change
    drop_table :album_relations
    drop_table :albums
    drop_table :photos
    drop_table :media_contents
  end
end
