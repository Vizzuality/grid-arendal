class RenamePublicationIdToContentIdInWeblinks < ActiveRecord::Migration[5.0]
  def change
    rename_column :weblinks, :publication_id, :content_id
  end
end
