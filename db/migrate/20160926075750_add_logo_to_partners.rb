class AddLogoToPartners < ActiveRecord::Migration[5.0]
  def change
    add_attachment :partners, :logo
  end
end
