class AddContentDateToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :content_date, :date
  end
end
