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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140118175508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accomplishments", force: true do |t|
    t.integer  "user_activity_id", null: false
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",          null: false
  end

  create_table "activities", force: true do |t|
    t.string   "name",           null: false
    t.float    "met",            null: false
    t.boolean  "cardiovascular"
    t.boolean  "bone_strength"
    t.boolean  "resistance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "points", force: true do |t|
    t.integer  "quantity",          default: 0, null: false
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "accomplishment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name",       null: false
    t.integer  "captain_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_activities", force: true do |t|
    t.integer  "user_id",     null: false
    t.integer  "activity_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_activities", ["user_id", "activity_id"], name: "index_user_activities_on_user_id_and_activity_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.integer  "age",                                 null: false
    t.string   "gender",                              null: false
    t.integer  "height",                              null: false
    t.integer  "weight",                              null: false
    t.date     "date_of_birth",                       null: false
    t.string   "profile_picture"
    t.integer  "team_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
