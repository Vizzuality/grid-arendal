class AddStartingDateAndEndingDateAndVacancyTypeToVacancies < ActiveRecord::Migration[5.0]
  def change
    add_column :vacancies, :starting_date, :date
    add_column :vacancies, :ending_date, :date
    add_column :vacancies, :vacancy_type, :string
    add_column :vacancies, :user_id, :integer

    add_foreign_key "vacancies", "users"
  end
end
