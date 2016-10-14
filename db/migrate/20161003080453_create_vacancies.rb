class CreateVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancies do |t|
      t.string :title
      t.string :description
      t.boolean :is_published, default: false

      t.timestamps
    end
  end
end
