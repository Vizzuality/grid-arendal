class AddIsBoardMemberToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_board_member, :boolean, default: false
  end
end
