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

ActiveRecord::Schema.define(version: 20150801151103) do

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
  end

end
