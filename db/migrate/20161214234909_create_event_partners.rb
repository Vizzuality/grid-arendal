class CreateEventPartners < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :partner_id, :integer
    create_table :event_partners do |t|
      t.integer :event_id
      t.integer :partner_id

      t.timestamps
    end
  end
end
