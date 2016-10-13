class AddProjectNumberToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :project_number, :integer
  end
end
