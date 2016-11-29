class AddContentIdColumnOnContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :media_content_id, :integer
  end
end
