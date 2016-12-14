class AddTitleToMediaContent < ActiveRecord::Migration[5.0]
  def change
    add_column :media_contents, :title, :string
  end
end
