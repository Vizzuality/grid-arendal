class AddStatusToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :status, :string
  end
end
