class AddDescriptionOfUsageToGraphicRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :graphic_requests, :description_of_usage, :text
  end
end
