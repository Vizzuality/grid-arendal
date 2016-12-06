class AddLeadUserIdToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :lead_user_id, :integer
  end
end
