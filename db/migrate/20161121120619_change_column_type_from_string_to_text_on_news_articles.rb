class ChangeColumnTypeFromStringToTextOnNewsArticles < ActiveRecord::Migration[5.0]
  def change
    change_column :news_articles, :short_description, :text
  end
end
