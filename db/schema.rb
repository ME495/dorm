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

ActiveRecord::Schema.define(version: 20191129092035) do

  create_table "admins", force: :cascade do |t|
    t.string "account", null: false
    t.string "password", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lectures", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.string "category", null: false
    t.text "content", null: false
    t.integer "student_id", null: false
    t.string "suite", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_lectures_on_student_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_number", null: false
    t.string "apartment", null: false
    t.integer "unit", null: false
    t.integer "capacity", null: false
    t.integer "amount", default: 0, null: false
    t.string "gender"
    t.integer "floor", null: false
    t.string "department"
    t.string "suite", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_number"], name: "index_rooms_on_room_number", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.string "student_number", null: false
    t.string "password", null: false
    t.string "student_name", null: false
    t.string "gender", null: false
    t.string "department", null: false
    t.integer "room_id"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_students_on_room_id"
    t.index ["student_number"], name: "index_students_on_student_number", unique: true
  end

end
