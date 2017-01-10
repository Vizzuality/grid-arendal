class RenameSFieldsToNormalNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :contents, :s_cover_picture_file_name, :cover_picture_file_name
    rename_column :contents, :s_cover_picture_content_type, :cover_picture_content_type
    rename_column :contents, :s_cover_picture_file_size, :cover_picture_file_size
    rename_column :contents, :s_cover_picture_updated_at, :cover_picture_updated_at
    rename_column :documents, :s_document_file_name, :document_file_name
    rename_column :documents, :s_document_content_type, :document_content_type
    rename_column :documents, :s_document_file_size, :document_file_size
    rename_column :documents, :s_document_updated_at, :document_updated_at
    rename_column :events, :s_background_image_file_name, :background_image_file_name
    rename_column :events, :s_background_image_content_type, :background_image_content_type
    rename_column :events, :s_background_image_file_size, :background_image_file_size
    rename_column :events, :s_background_image_updated_at, :background_image_updated_at
    rename_column :partners, :s_logo_file_name, :logo_file_name
    rename_column :partners, :s_logo_content_type, :logo_content_type
    rename_column :partners, :s_logo_file_size, :logo_file_size
    rename_column :partners, :s_logo_updated_at, :logo_updated_at
    rename_column :users, :s_avatar_file_name, :avatar_file_name
    rename_column :users, :s_avatar_content_type, :avatar_content_type
    rename_column :users, :s_avatar_file_size, :avatar_file_size
    rename_column :users, :s_avatar_updated_at, :avatar_updated_at
    rename_column :users, :s_thumbnail_file_name, :thumbnail_file_name
    rename_column :users, :s_thumbnail_content_type, :thumbnail_content_type
    rename_column :users, :s_thumbnail_file_size, :thumbnail_file_size
    rename_column :users, :s_thumbnail_updated_at, :thumbnail_updated_at
  end
end
