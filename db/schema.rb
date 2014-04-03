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

ActiveRecord::Schema.define(version: 20140403073600) do

  create_table "microposts", force: true do |t|
    t.text     "content",               limit: 255
    t.integer  "user_id"
    t.text     "secret_key",            limit: 255
    t.boolean  "launch_into_space",                 default: true
    t.boolean  "send_email_to_partner",             default: false
    t.boolean  "send_paper_copy",                   default: false
    t.text     "name1",                 limit: 255
    t.text     "name2",                 limit: 255
    t.text     "extra",                 limit: 255
    t.integer  "extra_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "partner_name",          limit: 255
    t.text     "partner_email",         limit: 255
    t.text     "mail_street",           limit: 255
    t.text     "mail_street2",          limit: 255
    t.text     "mail_cp",               limit: 255
    t.text     "mail_city",             limit: 255
    t.text     "mail_state",            limit: 255
    t.text     "mail_country",          limit: 255
    t.integer  "to_pay"
    t.text     "assigned_secret",       limit: 255
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
