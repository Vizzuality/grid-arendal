class AddDurationToVacancies < ActiveRecord::Migration[5.0]
  def change
    add_column :vacancies, :duration, :string
  end
end
