class AddIndecesToDb < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :contents, :content_types
    add_index :contents, :content_type_id, using: :btree
    add_foreign_key :contents, :media_contents
    add_index :contents, :media_content_id, using: :btree
    add_foreign_key :documents, :contents, column: :publication_id, primary_key: :id

    add_foreign_key :event_partners, :partners
    add_foreign_key :event_partners, :events

    add_foreign_key :media_contents, :media_contents, column: :album_id
    add_index :media_contents, :album_id, using: :btree

    add_foreign_key :media_contents, :media_attachments, column: :eps_id
    add_foreign_key :media_contents, :media_attachments, column: :pdf_id

    add_foreign_key :media_supports, :contents
    add_index :media_supports, :content_id, using: :btree
    add_foreign_key :media_supports, :media_contents, column: :media_content_id
    add_index :media_supports, :media_content_id, using: :btree

   add_foreign_key :news_media_contents, :news_articles
   add_index :news_media_contents, :news_article_id, using: :btree
   add_foreign_key :news_media_contents, :media_contents
   add_index :news_media_contents, :media_content_id, using: :btree

   add_foreign_key :photo_sizes, :media_contents, column: :photo_id
   add_index :photo_sizes, :photo_id, using: :btree
   add_index :photo_sizes, :label, using: :btree

   add_foreign_key :related_contents, :contents, column: :activity_id, primary_key: :id
   add_index :related_contents, :activity_id, using: :btree
   add_foreign_key :related_contents, :contents, column: :publication_id, primary_key: :id
   add_index :related_contents, :publication_id, using: :btree

   change_column :weblinks, :publication_id, 'integer USING publication_id::integer'
   add_foreign_key :weblinks, :contents, column: :publication_id, primary_key: :id

   add_index :content_types, :title, using: :btree

   add_index :users, :position_category, using: :btree
   add_index :users, :current_position, using: :btree
  end
end
