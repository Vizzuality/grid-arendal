class CreateMediaSupports < ActiveRecord::Migration[5.0]
  def change
    create_table :media_supports do |t|
      t.integer :content_id
      t.integer :media_content_id

      t.timestamps
    end
  end
end
