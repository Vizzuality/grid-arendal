class AddSkypeUserToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :skype_user, :string
  end
end
