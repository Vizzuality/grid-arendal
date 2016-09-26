class CreateActivityNews < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_news do |t|
      t.integer :activity_id
      t.integer :news_article_id

      t.timestamps
    end
  end
end
