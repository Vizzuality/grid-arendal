class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name,       :string
    add_column :users, :last_name,        :string
    add_column :users, :organization,     :string
    add_column :users, :current_position, :string
    add_column :users, :web_url,          :string
    add_column :users, :active,           :boolean, default: false,  null: false
    add_column :users, :deactivated_at,   :datetime
    add_column :users, :role,             :integer, default: 'user', null: false
  end
end
