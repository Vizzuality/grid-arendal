class AddLabelToPhotoSizes < ActiveRecord::Migration[5.0]
  def change
    add_column :photo_sizes, :label, :string
  end
end
