class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :activity_news, :contents, column: :activity_id
    add_foreign_key :activity_news, :news_articles

    add_foreign_key :participants, :users
    add_foreign_key :participants, :contents

    add_foreign_key :content_partners, :partners
    add_foreign_key :content_partners, :contents
  end
end
