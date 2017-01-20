class CreateEventContents < ActiveRecord::Migration[5.0]
  def change
    create_table :event_contents do |t|
      t.integer :event_id
      t.integer :content_id

      t.timestamps
    end
  end
end
