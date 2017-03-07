# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170306234627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_sections", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "category"
  end

  create_table "content_news", force: :cascade do |t|
    t.integer  "content_id"
    t.integer  "news_article_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "content_partners", force: :cascade do |t|
    t.integer  "content_id"
    t.integer  "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "content_types", force: :cascade do |t|
    t.string   "for_content", null: false
    t.string   "title",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.index ["title"], name: "index_content_types_on_title", using: :btree
  end

  create_table "contents", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.text     "description"
    t.boolean  "is_published"
    t.integer  "position"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_featured"
    t.integer  "project_number"
    t.text     "short_description"
    t.date     "content_date"
    t.integer  "content_type_id"
    t.integer  "media_content_id"
    t.integer  "lead_user_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "cover_picture_file_name"
    t.string   "cover_picture_content_type"
    t.integer  "cover_picture_file_size"
    t.datetime "cover_picture_updated_at"
    t.string   "status"
    t.index ["content_type_id"], name: "index_contents_on_content_type_id", using: :btree
    t.index ["media_content_id"], name: "index_contents_on_media_content_id", using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.string   "label"
    t.integer  "content_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "event_contents", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_partners", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_users", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "web_url"
    t.boolean  "active",                        default: false, null: false
    t.datetime "deactivated_at"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "background_image_file_name"
    t.string   "background_image_content_type"
    t.integer  "background_image_file_size"
    t.datetime "background_image_updated_at"
  end

  create_table "graphic_requests", force: :cascade do |t|
    t.integer  "media_attachment_id"
    t.string   "email"
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "download_hash"
    t.integer  "graphic_id"
  end

  create_table "media_attachments", force: :cascade do |t|
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "media_contents", force: :cascade do |t|
    t.string   "external_id"
    t.string   "external_url"
    t.string   "type"
    t.string   "author"
    t.string   "licence"
    t.date     "publication_date"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "title"
    t.integer  "album_id"
    t.datetime "external_updated_at"
    t.boolean  "is_featured"
    t.integer  "eps_id"
    t.integer  "pdf_id"
    t.index "(((setweight(to_tsvector('simple'::regconfig, COALESCE((title)::text, ''::text)), 'A'::\"char\") || setweight(to_tsvector('simple'::regconfig, COALESCE(description, ''::text)), 'B'::\"char\")) || setweight(to_tsvector('simple'::regconfig, COALESCE((author)::text, ''::text)), 'B'::\"char\")))", name: "index_media_contents_on_to_tsvector_title_description_author", using: :gin
    t.index ["album_id"], name: "index_media_contents_on_album_id", using: :btree
  end

  create_table "media_supports", force: :cascade do |t|
    t.integer  "content_id"
    t.integer  "media_content_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["content_id"], name: "index_media_supports_on_content_id", using: :btree
    t.index ["media_content_id"], name: "index_media_supports_on_media_content_id", using: :btree
  end

  create_table "news_articles", force: :cascade do |t|
    t.string   "exposure_slug"
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.date     "publication_date"
    t.text     "short_description"
    t.string   "cover_src"
    t.index "setweight(to_tsvector('simple'::regconfig, COALESCE((title)::text, ''::text)), 'A'::\"char\")", name: "index_news_articles_on_to_tsvector_title", using: :gin
  end

  create_table "news_media_contents", force: :cascade do |t|
    t.integer  "news_article_id"
    t.integer  "media_content_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["media_content_id"], name: "index_news_media_contents_on_media_content_id", using: :btree
    t.index ["news_article_id"], name: "index_news_media_contents_on_news_article_id", using: :btree
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "content_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.string   "web_url"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "photo_sizes", force: :cascade do |t|
    t.integer "photo_id"
    t.string  "size"
    t.integer "width"
    t.integer "height"
    t.string  "url"
    t.string  "label"
    t.index ["label"], name: "index_photo_sizes_on_label", using: :btree
    t.index ["photo_id"], name: "index_photo_sizes_on_photo_id", using: :btree
  end

  create_table "related_contents", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "publication_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["activity_id"], name: "index_related_contents_on_activity_id", using: :btree
    t.index ["publication_id"], name: "index_related_contents_on_publication_id", using: :btree
  end

  create_table "site_sections", force: :cascade do |t|
    t.string   "section"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "title"
    t.text     "social_description"
    t.integer  "photo_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.string  "category"
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "organization"
    t.string   "current_position"
    t.string   "web_url"
    t.boolean  "active",                 default: false, null: false
    t.datetime "deactivated_at"
    t.integer  "role",                   default: 0,     null: false, comment: "User role { contributor: 0, publisher: 1, admin: 2 }"
    t.datetime "locked_at"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.boolean  "is_board_member",        default: false
    t.string   "phone"
    t.text     "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.string   "middle_name"
    t.string   "position_category"
    t.integer  "video_id"
    t.string   "facebook_url"
    t.string   "linkedin_url"
    t.string   "twitter_url"
    t.string   "google_url"
    t.string   "skype_user"
    t.index ["current_position"], name: "index_users_on_current_position", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["position_category"], name: "index_users_on_position_category", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vacancies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "is_published",  default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.date     "starting_date"
    t.date     "ending_date"
    t.string   "vacancy_type"
    t.string   "user_id"
  end

  create_table "weblinks", force: :cascade do |t|
    t.string   "url"
    t.string   "label"
    t.integer  "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "content_news", "contents"
  add_foreign_key "content_news", "news_articles"
  add_foreign_key "content_partners", "contents"
  add_foreign_key "content_partners", "partners"
  add_foreign_key "contents", "content_types"
  add_foreign_key "contents", "media_contents"
  add_foreign_key "documents", "contents"
  add_foreign_key "event_partners", "events"
  add_foreign_key "event_partners", "partners"
  add_foreign_key "graphic_requests", "media_attachments"
  add_foreign_key "media_contents", "media_attachments", column: "eps_id"
  add_foreign_key "media_contents", "media_attachments", column: "pdf_id"
  add_foreign_key "media_contents", "media_contents", column: "album_id"
  add_foreign_key "media_supports", "contents"
  add_foreign_key "media_supports", "media_contents"
  add_foreign_key "news_media_contents", "media_contents"
  add_foreign_key "news_media_contents", "news_articles"
  add_foreign_key "participants", "contents"
  add_foreign_key "participants", "users"
  add_foreign_key "photo_sizes", "media_contents", column: "photo_id"
  add_foreign_key "related_contents", "contents", column: "activity_id"
  add_foreign_key "related_contents", "contents", column: "publication_id"
  add_foreign_key "site_sections", "media_contents", column: "photo_id"
  add_foreign_key "weblinks", "contents"
end
