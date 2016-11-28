class AddContentTypeIdToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :content_type_id, :integer
  end
end
