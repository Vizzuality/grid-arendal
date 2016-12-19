class AddThumbnailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :thumbnail_file_name, :string
    add_column :users, :thumbnail_content_type, :string
    add_column :users, :thumbnail_file_size, :integer
    add_column :users, :thumbnail_updated_at, :datetime
  end
end
