class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :label
      t.attachment :document
      t.integer :publication_id

      t.timestamps
    end
  end
end
