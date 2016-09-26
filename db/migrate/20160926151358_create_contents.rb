class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :type
      t.string :title
      t.text :description
      t.boolean :is_published
      t.integer :position
      t.string :story_map_url

      t.timestamps
    end
  end
end
