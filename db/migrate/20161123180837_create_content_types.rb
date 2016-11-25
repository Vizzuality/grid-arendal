class CreateContentTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :content_types do |t|
      t.string :for_content, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
