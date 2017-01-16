class RemoveStoryMapUrlFromContents < ActiveRecord::Migration[5.0]
  def change
    remove_column :contents, :story_map_url, :string
  end
end
