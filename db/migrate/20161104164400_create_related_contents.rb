class CreateRelatedContents < ActiveRecord::Migration[5.0]
  def change
    create_table :related_contents do |t|
      t.integer :activity_id
      t.integer :publication_id

      t.timestamps
    end
  end
end
