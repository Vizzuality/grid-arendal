class CreateSiteSections < ActiveRecord::Migration[5.0]
  def change
    create_table :site_sections do |t|
      t.string :section
      t.text :description

      t.timestamps
    end
  end
end
