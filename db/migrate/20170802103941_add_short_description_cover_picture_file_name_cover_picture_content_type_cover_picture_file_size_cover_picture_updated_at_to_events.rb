class AddShortDescriptionCoverPictureFileNameCoverPictureContentTypeCoverPictureFileSizeCoverPictureUpdatedAtToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :short_description, :text
    add_column :events, :cover_picture_file_name, :string
    add_column :events, :cover_picture_content_type, :string
    add_column :events, :cover_picture_file_size, :integer
    add_column :events, :cover_picture_updated_at, :datetime
  end
end
