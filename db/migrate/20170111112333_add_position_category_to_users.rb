class AddPositionCategoryToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :position_category, :string
  end
end
