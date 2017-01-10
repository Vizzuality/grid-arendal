class MoveDocumentsToAmazon < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :s_document_file_name, :string
    add_column :documents, :s_document_content_type, :string
    add_column :documents, :s_document_file_size, :integer
    add_column :documents, :s_document_updated_at, :datetime
  end
end
