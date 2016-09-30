class AddIsFeaturedToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :is_featured, :boolean
  end
end
