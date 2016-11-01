class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.belongs_to :media_content, index: true, foreign_key: true
      t.string  :photoset_id
      t.string  :photoset_url
      t.integer :albumable_count, default: 0

      t.timestamps
    end
  end
end
