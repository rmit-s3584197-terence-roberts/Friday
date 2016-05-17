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

ActiveRecord::Schema.define(version: 20160516132230) do

  create_table "properties", force: :cascade do |t|
    t.string   "name",                  limit: 50,  null: false
    t.integer  "user_id",               limit: 4,   null: false
    t.string   "address",               limit: 255, null: false
    t.string   "city",                  limit: 255, null: false
    t.string   "country",               limit: 255, null: false
    t.integer  "num_rooms",             limit: 4,   null: false
    t.boolean  "ac_available"
    t.boolean  "pool_available"
    t.integer  "num_points",            limit: 4,   null: false
    t.float    "discount",              limit: 53,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "combined_city_country"
    t.float    "longitude"
    t.float    "latitude"
  end

  add_index "properties", ["user_id"], name: "index_properties_on_user_id"

  create_table "reservations", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "start_date"
    t.integer  "property_id"
    t.integer  "status"
    t.integer  "user_id"
  end

  add_index "reservations", ["property_id"], name: "index_reservations_on_property_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "user_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 50,                  null: false
    t.string   "first_name",      limit: 30,                  null: false
    t.string   "last_name",       limit: 30,                  null: false
    t.string   "email",           limit: 255,                 null: false
    t.string   "city",            limit: 255,                 null: false
    t.string   "country",         limit: 255,                 null: false
    t.string   "address",         limit: 255,                 null: false
    t.string   "phone",           limit: 255,                 null: false
    t.integer  "points",          limit: 4,   default: 600,   null: false
    t.boolean  "request_status",              default: false, null: false
    t.boolean  "booking_status",              default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
