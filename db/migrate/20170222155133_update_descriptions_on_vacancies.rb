class UpdateDescriptionsOnVacancies < ActiveRecord::Migration[5.0]
  def change
    change_column :vacancies, :description, :text
  end
end
