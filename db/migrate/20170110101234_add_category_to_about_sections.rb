class AddCategoryToAboutSections < ActiveRecord::Migration[5.0]
  def change
    add_column :about_sections, :category, :string
  end
end
