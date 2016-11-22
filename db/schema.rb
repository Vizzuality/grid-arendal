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

ActiveRecord::Schema.define(version: 20161122102250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_sections", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_news", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "news_article_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "album_relations", force: :cascade do |t|
    t.integer  "photoset_id",                 comment: "ID media content of type album"
    t.integer  "album_photo_id",              comment: "ID media content of type photo"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["album_photo_id"], name: "index_album_relations_on_album_photo_id", using: :btree
    t.index ["photoset_id", "album_photo_id"], name: "index_album_relations_on_photoset_id_and_album_photo_id", unique: true, using: :btree
    t.index ["photoset_id"], name: "index_album_relations_on_photoset_id", using: :btree
  end

  create_table "albums", force: :cascade do |t|
    t.integer  "media_content_id"
    t.string   "photoset_id"
    t.string   "photoset_url"
    t.integer  "albumable_count",  default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "main_photo_id"
    t.string   "main_photo_url"
    t.index ["media_content_id"], name: "index_albums_on_media_content_id", using: :btree
  end

  create_table "content_partners", force: :cascade do |t|
    t.integer  "content_id"
    t.integer  "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.text     "description"
    t.boolean  "is_published"
    t.integer  "position"
    t.string   "story_map_url"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean  "is_featured"
    t.integer  "project_number"
    t.text     "short_description"
    t.date     "content_date"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "web_url"
    t.string   "background_image_file_name"
    t.string   "background_image_content_type"
    t.integer  "background_image_file_size"
    t.datetime "background_image_updated_at"
    t.boolean  "active",                        default: false, null: false
    t.datetime "deactivated_at"
    t.integer  "partner_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["partner_id"], name: "index_events_on_partner_id", using: :btree
  end

  create_table "media_contents", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "is_published", default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "news_articles", force: :cascade do |t|
    t.string   "exposure_slug"
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.date     "publication_date"
    t.text     "short_description"
    t.text     "description"
    t.string   "cover_src"
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "content_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_lead",    default: false
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

  create_table "photos", force: :cascade do |t|
    t.integer  "media_content_id"
    t.string   "photo_id"
    t.string   "photo_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["media_content_id"], name: "index_photos_on_media_content_id", using: :btree
  end

  create_table "related_contents", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "publication_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
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
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vacancies", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "is_published", default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_foreign_key "activity_news", "contents", column: "activity_id"
  add_foreign_key "activity_news", "news_articles"
  add_foreign_key "albums", "media_contents"
  add_foreign_key "content_partners", "contents"
  add_foreign_key "content_partners", "partners"
  add_foreign_key "participants", "contents"
  add_foreign_key "participants", "users"
  add_foreign_key "photos", "media_contents"
end
