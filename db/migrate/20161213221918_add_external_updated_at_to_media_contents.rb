class AddExternalUpdatedAtToMediaContents < ActiveRecord::Migration[5.0]
  def change
    add_column :media_contents, :external_updated_at, :datetime
  end
end
