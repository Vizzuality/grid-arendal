class RemovePictureFromContents < ActiveRecord::Migration[5.0]
  def change
    remove_column :contents, :picture_file_name, :string
    remove_column :contents, :picture_content_type, :string
    remove_column :contents, :picture_file_size, :integer
    remove_column :contents, :picture_updated_at, :datetime
  end
end
