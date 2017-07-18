class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "contents", "users", column: "lead_user_id", name: "contents_lead_user_id_fk"
    add_foreign_key "event_contents", "contents", name: "event_contents_content_id_fk"
    add_foreign_key "event_contents", "events", name: "event_contents_event_id_fk"
    add_foreign_key "event_users", "events", name: "event_users_event_id_fk"
    add_foreign_key "event_users", "users", name: "event_users_user_id_fk"
    add_foreign_key "graphic_requests", "media_contents", column: "graphic_id", name: "graphic_requests_graphic_id_fk"
  end
end
