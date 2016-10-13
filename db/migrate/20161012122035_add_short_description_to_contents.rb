class AddShortDescriptionToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :short_description, :text
  end
end
