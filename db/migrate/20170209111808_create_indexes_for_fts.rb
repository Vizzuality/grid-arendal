class CreateIndexesForFts < ActiveRecord::Migration[5.0]
  def up
    add_index :news_articles,
      "(setweight(to_tsvector('simple', coalesce(title::text, '')), 'A'))",
      using: :gin,
      name: :index_news_articles_on_to_tsvector_title
    add_index :media_contents,
      "(setweight(to_tsvector('simple', coalesce(title::text, '')), 'A') || setweight(to_tsvector('simple', coalesce(description::text, '')), 'B') || setweight(to_tsvector('simple', coalesce(author::text, '')), 'B'))",
      using: :gin,
      name: :index_media_contents_on_to_tsvector_title_description_author
  end

  def down
    remove_index(:news_articles, name: :index_news_articles_on_to_tsvector_title)
    remove_index(:media_contents, name: :index_media_contents_on_to_tsvector_title_description_author)
  end
end
