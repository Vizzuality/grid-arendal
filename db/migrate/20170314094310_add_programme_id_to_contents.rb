class AddProgrammeIdToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :programme_id, :integer
    add_foreign_key "contents", "contents", column: "programme_id"
  end
end
