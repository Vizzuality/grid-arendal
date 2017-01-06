class AddFieldsForLogoInAmazonForPartners < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :s_logo_file_name, :string
    add_column :partners, :s_logo_content_type, :string
    add_column :partners, :s_logo_file_size, :integer
    add_column :partners, :s_logo_updated_at, :datetime
  end
end
