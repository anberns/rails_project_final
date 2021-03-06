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

ActiveRecord::Schema.define(version: 2019_02_18_153900) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.integer "distance"
    t.string "stroke"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "swimmer_events", force: :cascade do |t|
    t.integer "swimmer_id"
    t.integer "event_id"
    t.string "personal_record"
    t.index ["event_id"], name: "index_swimmer_events_on_event_id"
    t.index ["swimmer_id"], name: "index_swimmer_events_on_swimmer_id"
  end

  create_table "swimmers", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "hq"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
