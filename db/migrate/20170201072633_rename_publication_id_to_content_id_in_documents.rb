class RenamePublicationIdToContentIdInDocuments < ActiveRecord::Migration[5.0]
  def change
    rename_column :documents, :publication_id, :content_id
  end
end
