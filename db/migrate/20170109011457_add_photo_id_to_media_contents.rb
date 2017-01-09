class AddPhotoIdToMediaContents < ActiveRecord::Migration[5.0]
  def change
    add_column :media_contents, :photo_id, :integer
  end
end
