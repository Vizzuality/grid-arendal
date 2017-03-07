class CreateVacancyDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancy_documents do |t|
      t.string :label
      t.string :document_file_name
      t.string :document_content_type
      t.integer :document_file_size
      t.datetime :document_updated_at
      t.integer :vacancy_id

      t.timestamps
    end

    add_foreign_key "vacancy_documents", "vacancies"
  end
end
