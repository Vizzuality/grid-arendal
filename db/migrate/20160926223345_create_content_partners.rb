class CreateContentPartners < ActiveRecord::Migration[5.0]
  def change
    create_table :content_partners do |t|
      t.integer :content_id
      t.integer :partner_id

      t.timestamps
    end
  end
end
