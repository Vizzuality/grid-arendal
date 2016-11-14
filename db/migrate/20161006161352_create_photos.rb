class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.belongs_to :media_content, index: true, foreign_key: true
      t.string :photo_id
      t.string :photo_url

      t.timestamps
    end
  end
end
