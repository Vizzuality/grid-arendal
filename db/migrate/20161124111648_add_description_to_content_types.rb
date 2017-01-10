class AddDescriptionToContentTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :content_types, :description, :text
  end
end
