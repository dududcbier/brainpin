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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avatar_requirements", primary_key: ["avatar_id", "learnable_id"], force: :cascade do |t|
    t.integer "avatar_id", null: false
    t.integer "learnable_id", null: false
    t.integer "min_level", null: false
  end

  create_table "avatars", primary_key: "avatar_id", id: :serial, force: :cascade do |t|
    t.string "avatar_name", limit: 20, null: false
    t.binary "img", null: false
    t.index ["avatar_name"], name: "avatars_avatar_name_key", unique: true
  end

  create_table "coordinators", primary_key: "coordinator_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "courses", primary_key: "course_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "courses_teachers", primary_key: ["course_id", "teacher_id", "start_date"], force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "teacher_id", null: false
    t.date "start_date", null: false
    t.date "end_date"
  end

  create_table "learnables", primary_key: "learnable_id", id: :serial, force: :cascade do |t|
    t.integer "coordinator_id", null: false
    t.string "learnable_name", limit: 20, null: false
    t.integer "max_level", default: 10, null: false
  end

  create_table "levels_points", primary_key: ["level", "learnable_id"], force: :cascade do |t|
    t.integer "level", null: false
    t.integer "learnable_id", null: false
    t.integer "points", null: false
  end

  create_table "materials", primary_key: "material_id", id: :serial, force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "subtopic_id", null: false
    t.string "description", limit: 400, null: false
    t.string "url", limit: 100
    t.binary "file"
    t.decimal "rating"
  end

  create_table "materials_ratings", primary_key: ["student_id", "material_id"], force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "material_id", null: false
    t.integer "rating", null: false
  end

  create_table "questions", primary_key: "question_id", id: :string, limit: 50, force: :cascade do |t|
    t.integer "registrant_id", null: false
  end

  create_table "questions_study_sessions", primary_key: ["question_id", "study_session_id"], force: :cascade do |t|
    t.string "question_id", limit: 50, null: false
    t.integer "study_session_id", null: false
    t.string "status", limit: 15, default: "not answered", null: false
  end

  create_table "registrants", primary_key: "registrant_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "student_levels", primary_key: ["learnable_id", "student_id"], force: :cascade do |t|
    t.integer "learnable_id", null: false
    t.integer "student_id", null: false
    t.integer "level", default: 1, null: false
    t.integer "points", default: 0, null: false
  end

  create_table "students", primary_key: "student_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "interest", limit: 20
    t.integer "school_year", null: false
    t.date "birth_date", null: false
  end

  create_table "study_sessions", primary_key: "study_session_id", id: :serial, force: :cascade do |t|
    t.date "start_date", null: false
    t.integer "student_id", null: false
    t.integer "subtopic_id", null: false
    t.date "end_date"
    t.integer "num_correct"
    t.integer "num_questions"
    t.index ["start_date", "student_id"], name: "study_sessions_start_date_student_id_key", unique: true
  end

  create_table "subtopics", primary_key: "subtopic_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "topic_id", null: false
  end

  create_table "subtopics_questions", primary_key: ["question_id", "subtopic_id"], force: :cascade do |t|
    t.string "question_id", limit: 50, null: false
    t.integer "subtopic_id", null: false
  end

  create_table "teachers", primary_key: "teacher_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "coordinator_id", null: false
    t.string "office", limit: 10, null: false
  end

  create_table "teachers_titles", primary_key: ["teacher_id", "title"], force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.string "title", limit: 15, null: false
  end

  create_table "topics", primary_key: "topic_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "course_id", null: false
  end

  create_table "users", primary_key: "user_id", id: :serial, force: :cascade do |t|
    t.integer "avatar_id", default: 0, null: false
    t.string "name", limit: 70, null: false
    t.string "password", limit: 20, null: false
    t.string "phone", limit: 10
    t.string "cpf", limit: 11, null: false
    t.string "email", limit: 254, null: false
    t.index ["email"], name: "users_email_key", unique: true
  end

  add_foreign_key "avatar_requirements", "avatars", primary_key: "avatar_id", name: "avatar_requirements_avatar_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "avatar_requirements", "learnables", primary_key: "learnable_id", name: "avatar_requirements_learnable_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "coordinators", "registrants", column: "coordinator_id", primary_key: "registrant_id", name: "coordinators_coordinator_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "courses", "learnables", column: "course_id", primary_key: "learnable_id", name: "courses_course_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "courses_teachers", "courses", primary_key: "course_id", name: "courses_teachers_course_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "courses_teachers", "teachers", primary_key: "teacher_id", name: "courses_teachers_teacher_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "learnables", "coordinators", primary_key: "coordinator_id", name: "learnables_coordinator_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "levels_points", "learnables", primary_key: "learnable_id", name: "levels_points_learnable_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "materials", "subtopics", primary_key: "subtopic_id", name: "materials_subtopic_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "materials", "teachers", primary_key: "teacher_id", name: "materials_teacher_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "materials_ratings", "materials", primary_key: "material_id", name: "materials_ratings_material_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "materials_ratings", "students", primary_key: "student_id", name: "materials_ratings_student_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "questions", "registrants", primary_key: "registrant_id", name: "questions_registrant_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "questions_study_sessions", "questions", primary_key: "question_id", name: "questions_study_sessions_question_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "questions_study_sessions", "study_sessions", primary_key: "study_session_id", name: "questions_study_sessions_study_session_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "registrants", "users", column: "registrant_id", primary_key: "user_id", name: "registrants_registrant_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student_levels", "learnables", primary_key: "learnable_id", name: "student_levels_learnable_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student_levels", "students", primary_key: "student_id", name: "student_levels_student_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "students", "users", column: "student_id", primary_key: "user_id", name: "students_student_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "study_sessions", "students", primary_key: "student_id", name: "study_sessions_student_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "study_sessions", "subtopics", primary_key: "subtopic_id", name: "study_sessions_subtopic_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "subtopics", "learnables", column: "subtopic_id", primary_key: "learnable_id", name: "subtopics_subtopic_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "subtopics", "topics", primary_key: "topic_id", name: "subtopics_topic_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "subtopics_questions", "questions", primary_key: "question_id", name: "subtopics_questions_question_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "subtopics_questions", "subtopics", primary_key: "subtopic_id", name: "subtopics_questions_subtopic_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "teachers", "coordinators", primary_key: "coordinator_id", name: "teachers_coordinator_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "teachers", "registrants", column: "teacher_id", primary_key: "registrant_id", name: "teachers_teacher_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "teachers_titles", "teachers", primary_key: "teacher_id", name: "teachers_titles_teacher_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "topics", "courses", primary_key: "course_id", name: "topics_course_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "topics", "learnables", column: "topic_id", primary_key: "learnable_id", name: "topics_topic_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "users", "avatars", primary_key: "avatar_id", name: "users_avatar_id_fkey", on_update: :cascade
end
