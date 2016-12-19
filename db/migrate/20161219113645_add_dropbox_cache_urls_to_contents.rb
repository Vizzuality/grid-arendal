class AddDropboxCacheUrlsToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :db_medium_picture, :string
    add_column :contents, :db_original_picture, :string
    add_column :contents, :db_medium_cover_picture, :string
    add_column :contents, :db_original_cover_picture, :string
  end
end
