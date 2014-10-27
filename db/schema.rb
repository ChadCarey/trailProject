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

ActiveRecord::Schema.define(version: 20141027205145) do

  create_table "areas", force: true do |t|
    t.string   "name"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.integer  "zoom"
    t.string   "weather"
    t.text     "description"
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
  end

  add_index "areas", ["state_id"], name: "index_areas_on_state_id"

  create_table "regions", force: true do |t|
    t.string   "name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "zoom"
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "states", force: true do |t|
    t.integer  "region_id"
    t.string   "name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "zoom"
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "states", ["region_id"], name: "index_states_on_region_id"

  create_table "trail_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "salt"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "permissions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
