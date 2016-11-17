class AddShortDescriptionAndDescriptionToNewsArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :news_articles, :short_description, :string
    add_column :news_articles, :description, :text
  end
end
