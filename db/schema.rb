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

ActiveRecord::Schema.define(version: 2018_10_21_231945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", id: :serial, force: :cascade do |t|
    t.string "course_name"
    t.string "course_description"
    t.string "course_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subject_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.string "user_id"
    t.string "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string "instructor_middle"
    t.string "instructor_last"
    t.string "instructor_first"
    t.string "instructor_email"
    t.string "instructor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject_id"
    t.string "subject_comment"
    t.string "subject_term"
    t.string "subject_name"
    t.string "subject_abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "users_and_courses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_users_and_courses_on_course_id"
    t.index ["user_id"], name: "index_users_and_courses_on_user_id"
  end

end
