class CreatePhotoSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :photo_sizes do |t|
      t.integer :media_content_id
      t.string :size
      t.integer :width
      t.integer :height
      t.string :url
    end
  end
end
