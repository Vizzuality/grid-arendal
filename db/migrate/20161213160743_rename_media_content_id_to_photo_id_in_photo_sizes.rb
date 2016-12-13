class RenameMediaContentIdToPhotoIdInPhotoSizes < ActiveRecord::Migration[5.0]
  def change
    rename_column :photo_sizes, :media_content_id, :photo_id
  end
end
