class AddPublicationDateToNewsArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :news_articles, :publication_date, :date
  end
end
