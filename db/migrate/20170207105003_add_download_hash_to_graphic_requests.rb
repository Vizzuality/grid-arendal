class AddDownloadHashToGraphicRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :graphic_requests, :download_hash, :string
  end
end
