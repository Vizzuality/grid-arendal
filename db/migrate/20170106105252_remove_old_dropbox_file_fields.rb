class RemoveOldDropboxFileFields < ActiveRecord::Migration[5.0]
  def change
    remove_column :contents, :cover_picture_file_name, :string
    remove_column :contents, :cover_picture_content_type, :string
    remove_column :contents, :cover_picture_file_size, :integer
    remove_column :contents, :cover_picture_update_at, :datetime
    remove_column :documents, :document_file_name, :string
    remove_column :documents, :document_content_type, :string
    remove_column :documents, :document_file_size, :integer
    remove_column :documents, :document_updated_at, :datetime
    remove_column :events, :background_image_file_name, :string
    remove_column :events, :background_image_content_type, :string
    remove_column :events, :background_image_file_size, :integer
    remove_column :events, :background_image_updated_at, :datetime
    remove_column :partners, :logo_file_name, :string
    remove_column :partners, :logo_content_type, :string
    remove_column :partners, :logo_file_size, :integer
    remove_column :partners, :logo_updated_at, :datetime
    remove_column :users, :avatar_file_name, :string
    remove_column :users, :avatar_content_type, :string
    remove_column :users, :avatar_file_size, :integer
    remove_column :users, :avatar_updated_at, :datetime
    remove_column :users, :thumbnail_file_name, :string
    remove_column :users, :thumbnail_content_type, :string
    remove_column :users, :thumbnail_file_size, :integer
    remove_column :users, :thumbnail_updated_at, :datetime
  end
end
