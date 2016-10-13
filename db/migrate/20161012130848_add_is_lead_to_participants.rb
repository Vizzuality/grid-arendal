class AddIsLeadToParticipants < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :is_lead, :boolean, default: false
  end
end
