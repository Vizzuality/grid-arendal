class AnableLockedAccountForUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :locked_at,       :datetime
    add_column :users, :failed_attempts, :integer, default: 0, null: false
    add_column :users, :unlock_token,    :string  # Only if unlock strategy is :email or :both
  end
end
