class RemovePhotoIdFromMediaContents < ActiveRecord::Migration[5.0]
  def change
    remove_column :media_contents, :photo_id, :integer
  end
end
