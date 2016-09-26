class CreateNewsArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :news_articles do |t|
      t.string :exposure_slug
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
