class AddAmazonFilesFieldsForUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :s_avatar_file_name, :string
    add_column :users, :s_avatar_content_type, :string
    add_column :users, :s_avatar_file_size, :integer
    add_column :users, :s_avatar_updated_at, :datetime
    add_column :users, :s_thumbnail_file_name, :string
    add_column :users, :s_thumbnail_content_type, :string
    add_column :users, :s_thumbnail_file_size, :integer
    add_column :users, :s_thumbnail_updated_at, :datetime
  end
end
