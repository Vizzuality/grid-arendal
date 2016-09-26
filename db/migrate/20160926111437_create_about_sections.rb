class CreateAboutSections < ActiveRecord::Migration[5.0]
  def change
    create_table :about_sections do |t|
      t.string :title
      t.text :body
      t.integer :position

      t.timestamps
    end
  end
end
