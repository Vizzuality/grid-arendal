class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string     :title
      t.text       :description
      t.string     :web_url
      t.attachment :background_image
      t.boolean    :active, default: false, null: false
      t.datetime   :deactivated_at
      t.integer    :partner_id, index: true

      t.timestamps
    end
  end
end
