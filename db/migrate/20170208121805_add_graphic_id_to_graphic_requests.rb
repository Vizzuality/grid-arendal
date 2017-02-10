class AddGraphicIdToGraphicRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :graphic_requests, :graphic_id, :integer
  end
end
