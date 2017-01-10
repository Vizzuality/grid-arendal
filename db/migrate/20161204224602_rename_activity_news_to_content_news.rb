class RenameActivityNewsToContentNews < ActiveRecord::Migration[5.0]
  def change
    rename_table :activity_news, :content_news
    rename_column :content_news, :activity_id, :content_id
  end
end
