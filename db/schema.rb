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

ActiveRecord::Schema.define(version: 2022_11_07_231910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emergency_contacts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "phone_number"
    t.index ["user_id"], name: "index_emergency_contacts_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.integer "zone_id"
    t.datetime "start_date"
    t.string "description"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "provider"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "favorite_zone", default: 1128
  end

  add_foreign_key "emergency_contacts", "users"
  add_foreign_key "trips", "users"
end
