class RemoveDescriptionFromNewsArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :news_articles, :description, :text
  end
end
