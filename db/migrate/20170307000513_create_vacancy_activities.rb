class CreateVacancyActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancy_activities do |t|
      t.integer :vacancy_id
      t.integer :activity_id

      t.timestamps
    end

    add_foreign_key "vacancy_activities", "vacancies"
    add_foreign_key "vacancy_activities", "contents", column: "activity_id"
  end
end
