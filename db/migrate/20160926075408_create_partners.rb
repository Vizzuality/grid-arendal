class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :web_url
      t.text   :description

      t.timestamps
    end
  end
end
