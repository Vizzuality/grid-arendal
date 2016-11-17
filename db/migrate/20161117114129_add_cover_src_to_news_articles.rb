class AddCoverSrcToNewsArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :news_articles, :cover_src, :string
  end
end
