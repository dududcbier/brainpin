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

ActiveRecord::Schema.define(version: 2018_06_25_234338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.bigint "learnable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learnable_id"], name: "index_courses_on_learnable_id"
  end

  create_table "courses_teachers", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "teacher_id", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_courses_teachers_on_course_id"
    t.index ["teacher_id"], name: "index_courses_teachers_on_teacher_id"
  end

  create_table "learnables", force: :cascade do |t|
    t.string "name", null: false
    t.integer "max_level", default: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "subtopic_id", null: false
    t.string "description", null: false
    t.string "url"
    t.binary "file"
    t.decimal "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subtopic_id"], name: "index_materials_on_subtopic_id"
    t.index ["teacher_id"], name: "index_materials_on_teacher_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "registrant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mongo_id", null: false
    t.index ["registrant_id"], name: "index_questions_on_registrant_id"
  end

  create_table "questions_study_sessions", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "study_session_id", null: false
    t.string "status", default: "not answered", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_questions_study_sessions_on_question_id"
    t.index ["study_session_id"], name: "index_questions_study_sessions_on_study_session_id"
  end

  create_table "registrants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_registrants_on_user_id"
  end

  create_table "student_levels", force: :cascade do |t|
    t.bigint "learnable_id", null: false
    t.bigint "student_id", null: false
    t.integer "level", default: 1, null: false
    t.integer "points", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learnable_id"], name: "index_student_levels_on_learnable_id"
    t.index ["student_id"], name: "index_student_levels_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "interest"
    t.integer "school_year", null: false
    t.date "birth_date", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "study_sessions", force: :cascade do |t|
    t.date "start_date", null: false
    t.bigint "student_id", null: false
    t.bigint "subtopic_id", null: false
    t.date "end_date"
    t.integer "num_correct"
    t.integer "num_questions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_study_sessions_on_student_id"
    t.index ["subtopic_id"], name: "index_study_sessions_on_subtopic_id"
  end

  create_table "subtopics", force: :cascade do |t|
    t.bigint "topic_id", null: false
    t.bigint "learnable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learnable_id"], name: "index_subtopics_on_learnable_id"
    t.index ["topic_id"], name: "index_subtopics_on_topic_id"
  end

  create_table "subtopics_questions", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "subtopic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_subtopics_questions_on_question_id"
    t.index ["subtopic_id"], name: "index_subtopics_questions_on_subtopic_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "office", null: false
    t.bigint "registrant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registrant_id"], name: "index_teachers_on_registrant_id"
  end

  create_table "teachers_titles", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_teachers_titles_on_teacher_id"
  end

  create_table "topics", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "learnable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_topics_on_course_id"
    t.index ["learnable_id"], name: "index_topics_on_learnable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password", null: false
    t.string "phone"
    t.string "cpf", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "avatar_id"
    t.index ["avatar_id"], name: "index_users_on_avatar_id"
  end

  add_foreign_key "courses", "learnables"
  add_foreign_key "courses_teachers", "courses"
  add_foreign_key "courses_teachers", "teachers"
  add_foreign_key "materials", "subtopics"
  add_foreign_key "materials", "teachers"
  add_foreign_key "questions", "registrants"
  add_foreign_key "questions_study_sessions", "questions"
  add_foreign_key "questions_study_sessions", "study_sessions"
  add_foreign_key "registrants", "users"
  add_foreign_key "student_levels", "learnables"
  add_foreign_key "student_levels", "students"
  add_foreign_key "students", "users"
  add_foreign_key "study_sessions", "students"
  add_foreign_key "study_sessions", "subtopics"
  add_foreign_key "subtopics", "learnables"
  add_foreign_key "subtopics", "topics"
  add_foreign_key "subtopics_questions", "questions"
  add_foreign_key "subtopics_questions", "subtopics"
  add_foreign_key "teachers", "registrants"
  add_foreign_key "teachers_titles", "teachers"
  add_foreign_key "topics", "courses"
  add_foreign_key "topics", "learnables"
end
