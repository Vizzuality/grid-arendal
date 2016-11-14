class CreateAlbumRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :album_relations do |t|
      t.integer :photoset_id,    comment: 'ID media content of type album', index: true
      t.integer :album_photo_id, comment: 'ID media content of type photo', index: true

      t.timestamps null: false
    end
    add_index :album_relations, [:photoset_id, :album_photo_id], unique: true
  end
end
