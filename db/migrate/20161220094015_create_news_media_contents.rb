class CreateNewsMediaContents < ActiveRecord::Migration[5.0]
  def change
    create_table :news_media_contents do |t|
      t.integer :news_article_id
      t.integer :media_content_id

      t.timestamps
    end
  end
end
