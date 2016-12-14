class AddIsFeaturedToMediaContents < ActiveRecord::Migration[5.0]
  def change
    add_column :media_contents, :is_featured, :boolean
  end
end
