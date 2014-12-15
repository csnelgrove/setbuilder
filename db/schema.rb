# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141215143839) do

  create_table "families", :force => true do |t|
    t.integer  "user_id"
    t.integer  "family_member_id"
    t.string   "relationship"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "verified"
  end

  create_table "ministries", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "children"
    t.boolean  "worship"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ministry_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ministry_id"
    t.string   "ministry_role"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "notifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "family_id"
    t.string   "content"
    t.string   "subject"
    t.string   "status_tag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "ref"
    t.string   "from_user"
  end

  create_table "posts", :force => true do |t|
    t.string   "user_id"
    t.text     "message",    :limit => 255
    t.boolean  "published"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "user_id"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "zip_code"
    t.string   "city"
    t.string   "state"
    t.string   "nickname"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "role_users", :force => true do |t|
    t.string   "user_id"
    t.string   "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "setlist_items", :force => true do |t|
    t.integer  "song_id"
    t.integer  "setlist_id"
    t.integer  "song_order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "leader_id"
  end

  add_index "setlist_items", ["setlist_id"], :name => "index_setlist_items_on_setlist_id"
  add_index "setlist_items", ["song_id"], :name => "index_setlist_items_on_song_id"

  create_table "setlists", :force => true do |t|
    t.boolean  "published"
    t.string   "user_id"
    t.date     "service_date"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.text     "publish_message", :limit => 255
  end

  create_table "songs", :force => true do |t|
    t.string   "song_title"
    t.string   "alt_title"
    t.string   "key"
    t.integer  "tempo"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "chart_file_name"
    t.string   "chart_content_type"
    t.integer  "chart_file_size"
    t.datetime "chart_updated_at"
    t.string   "vocal_sheet_file_name"
    t.string   "vocal_sheet_content_type"
    t.integer  "vocal_sheet_file_size"
    t.datetime "vocal_sheet_updated_at"
    t.string   "youtube_link"
    t.string   "ccli_id"
  end

  create_table "user_sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_sessions", ["session_id"], :name => "index_user_sessions_on_session_id"
  add_index "user_sessions", ["updated_at"], :name => "index_user_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "name",                :default => "",    :null => false
    t.string   "crypted_password",                       :null => false
    t.string   "password_salt",                          :null => false
    t.string   "email",                                  :null => false
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token"
    t.string   "perishable_token",                       :null => false
    t.integer  "login_count",         :default => 0,     :null => false
    t.integer  "failed_login_count",  :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "profile_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "active"
    t.date     "birthday"
    t.boolean  "child",               :default => false
  end

end
