class RenameSPictureToPictureInContents < ActiveRecord::Migration[5.0]
  def change
    rename_column :contents, :s_picture_file_name, :picture_file_name
    rename_column :contents, :s_picture_content_type, :picture_content_type
    rename_column :contents, :s_picture_file_size, :picture_file_size
    rename_column :contents, :s_picture_updated_at, :picture_updated_at
  end
end
