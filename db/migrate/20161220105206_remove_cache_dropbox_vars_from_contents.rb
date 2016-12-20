class RemoveCacheDropboxVarsFromContents < ActiveRecord::Migration[5.0]
  def change
    remove_column :contents, :db_medium_picture, :string
    remove_column :contents, :db_original_picture, :string
    remove_column :contents, :db_medium_cover_picture, :string
    remove_column :contents, :db_original_cover_picture, :string
  end
end
