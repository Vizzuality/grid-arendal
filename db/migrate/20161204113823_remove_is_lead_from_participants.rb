class RemoveIsLeadFromParticipants < ActiveRecord::Migration[5.0]
  def change
    remove_column :participants, :is_lead, :boolean
  end
end
