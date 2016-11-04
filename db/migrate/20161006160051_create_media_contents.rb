class CreateMediaContents < ActiveRecord::Migration[5.0]
  def change
    create_table :media_contents do |t|
      t.string  :title
      t.text    :description
      t.boolean :is_published, default: false

      t.timestamps
    end
  end
end
