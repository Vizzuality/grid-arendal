class ChangeTypeOfExternalIdToStringOnMediaContents < ActiveRecord::Migration[5.0]
  def change
    change_column :media_contents, :external_id, :string
  end
end
