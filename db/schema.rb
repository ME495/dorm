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

ActiveRecord::Schema.define(version: 20191228151246) do

  create_table "admins", force: :cascade do |t|
    t.string "account"
    t.string "password"
    t.string "email"
    t.index ["account"], name: "index_admins_on_account", unique: true
  end

  create_table "lectures", force: :cascade do |t|
    t.string "title"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "category"
    t.text "content"
    t.integer "student_id", null: false
    t.string "suite"
    t.index ["student_id"], name: "index_lectures_on_student_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.integer "amount", default: 0
    t.integer "number"
    t.integer "suite_id"
    t.integer "team_id"
    t.index ["name"], name: "index_rooms_on_name", unique: true
    t.index ["suite_id"], name: "index_rooms_on_suite_id"
    t.index ["team_id"], name: "index_rooms_on_team_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "number"
    t.string "password"
    t.string "name"
    t.string "gender"
    t.integer "room_id"
    t.string "email"
    t.integer "team_id"
    t.index ["number"], name: "index_students_on_number", unique: true
    t.index ["room_id"], name: "index_students_on_room_id"
    t.index ["team_id"], name: "index_students_on_team_id"
  end

  create_table "suites", force: :cascade do |t|
    t.string "name"
    t.string "apartment"
    t.integer "unit"
    t.integer "floor"
    t.integer "number"
    t.string "gender"
    t.string "layout"
    t.index ["name"], name: "index_suites_on_name", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

end
