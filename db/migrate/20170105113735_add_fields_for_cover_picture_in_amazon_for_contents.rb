class AddFieldsForCoverPictureInAmazonForContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :s_cover_picture_file_name, :string
    add_column :contents, :s_cover_picture_content_type, :string
    add_column :contents, :s_cover_picture_file_size, :integer
    add_column :contents, :s_cover_picture_updated_at, :datetime
  end
end
