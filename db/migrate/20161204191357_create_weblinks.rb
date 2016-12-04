class CreateWeblinks < ActiveRecord::Migration[5.0]
  def change
    create_table :weblinks do |t|
      t.string :url
      t.string :label
      t.string :publication_id

      t.timestamps
    end
  end
end
