class AddCategoryToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :category, :string
  end
end
