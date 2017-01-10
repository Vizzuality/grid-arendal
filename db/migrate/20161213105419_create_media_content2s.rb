class CreateMediaContent2s < ActiveRecord::Migration[5.0]
  def change
    create_table :media_contents do |t|
      t.integer :external_id
      t.string :external_url
      t.string :type
      t.string :author
      t.string :licence
      t.date :publication_date
      t.text :description

      t.timestamps
    end
  end
end
