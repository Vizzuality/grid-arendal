class AddTitleAndSocialDescriptionToSiteSections < ActiveRecord::Migration[5.0]
  def change
    add_column :site_sections, :title, :string
    add_column :site_sections, :social_description, :text
  end
end
