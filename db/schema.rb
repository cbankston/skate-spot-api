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

ActiveRecord::Schema.define(version: 20150802205204) do

  create_table "post_votes", force: :cascade do |t|
    t.integer  "skater_id",  limit: 4
    t.integer  "post_id",    limit: 4
    t.string   "direction",  limit: 255, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "caption",         limit: 255, default: "", null: false
    t.integer  "lat",             limit: 4
    t.integer  "long",            limit: 4
    t.string   "file_path",       limit: 255, default: "", null: false
    t.string   "url",             limit: 255, default: "", null: false
    t.integer  "skater_id",       limit: 4
    t.integer  "up_vote_count",   limit: 4
    t.integer  "down_vote_count", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "spot_id",         limit: 4
  end

  create_table "seed_migration_data_migrations", force: :cascade do |t|
    t.string   "version",     limit: 255
    t.integer  "runtime",     limit: 4
    t.datetime "migrated_on"
  end

  create_table "skater_profiles", force: :cascade do |t|
    t.integer  "skater_id",        limit: 4
    t.string   "first_name",       limit: 255, default: "", null: false
    t.string   "last_name",        limit: 255, default: "", null: false
    t.string   "avatar_file_path", limit: 255, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skaters", force: :cascade do |t|
    t.string   "username",               limit: 255, default: "", null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "skaters", ["reset_password_token"], name: "index_skaters_on_reset_password_token", unique: true, using: :btree
  add_index "skaters", ["username"], name: "index_skaters_on_username", unique: true, using: :btree

  create_table "spots", force: :cascade do |t|
    t.integer  "skater_id",  limit: 4
    t.integer  "lat",        limit: 4
    t.integer  "long",       limit: 4
    t.string   "name",       limit: 255, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
