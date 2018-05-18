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

  create_table "avatar_requirements", primary_key: ["id_avatar", "id_learnable"], force: :cascade do |t|
    t.integer "id_avatar", null: false
    t.integer "id_learnable", null: false
    t.integer "min_level", null: false
  end

  create_table "avatars", primary_key: "id_avatar", id: :serial, force: :cascade do |t|
    t.string "avatar_name", limit: 20, null: false
    t.binary "img", null: false
    t.index ["avatar_name"], name: "avatars_avatar_name_key", unique: true
  end

  create_table "coordinators", primary_key: "id_registrant", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "courses", primary_key: "id_learnable", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "courses_teachers", primary_key: ["id_course", "id_teacher", "start_date"], force: :cascade do |t|
    t.integer "id_course", null: false
    t.integer "id_teacher", null: false
    t.date "start_date", null: false
    t.date "end_date"
  end

  create_table "learnables", primary_key: "id_learnable", id: :serial, force: :cascade do |t|
    t.integer "id_coordinator", null: false
    t.string "learnable_name", limit: 20, null: false
    t.integer "max_level", default: 10, null: false
  end

  create_table "levels_points", primary_key: ["level", "id_learnable"], force: :cascade do |t|
    t.integer "level", null: false
    t.integer "id_learnable", null: false
    t.integer "points", null: false
  end

  create_table "materials", primary_key: "id_material", id: :serial, force: :cascade do |t|
    t.integer "id_teacher", null: false
    t.integer "id_subtopic", null: false
    t.string "description", limit: 400, null: false
    t.string "url", limit: 100
    t.binary "file"
    t.decimal "rating"
  end

  create_table "materials_ratings", primary_key: ["id_student", "id_material"], force: :cascade do |t|
    t.integer "id_student", null: false
    t.integer "id_material", null: false
    t.integer "rating", null: false
  end

  create_table "questions", primary_key: "id_mongo", id: :string, limit: 50, force: :cascade do |t|
    t.integer "id_registrant", null: false
  end

# Could not dump table "questions_study_sessions" because of following StandardError
#   Unknown type 'status_tp' for column 'status'

  create_table "registrants", primary_key: "id_user", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "student_levels", primary_key: ["id_learnable", "id_student"], force: :cascade do |t|
    t.integer "id_learnable", null: false
    t.integer "id_student", null: false
    t.integer "level", default: 1, null: false
    t.integer "points", default: 0, null: false
  end

  create_table "students", primary_key: "id_user", id: :integer, default: nil, force: :cascade do |t|
    t.string "interest", limit: 20
    t.integer "school_year", null: false
    t.date "birth_date", null: false
  end

  create_table "study_sessions", primary_key: ["start_date", "id_student"], force: :cascade do |t|
    t.date "start_date", null: false
    t.integer "id_student", null: false
    t.integer "id_subtopic", null: false
    t.date "end_date"
    t.integer "num_correct"
    t.integer "num_questions"
  end

  create_table "subtopics", primary_key: "id_learnable", id: :integer, default: nil, force: :cascade do |t|
    t.integer "id_topic", null: false
  end

  create_table "subtopics_questions", primary_key: ["id_question", "id_subtopic"], force: :cascade do |t|
    t.string "id_question", limit: 50, null: false
    t.integer "id_subtopic", null: false
  end

  create_table "teachers", primary_key: "id_registrant", id: :integer, default: nil, force: :cascade do |t|
    t.integer "id_coordinator", null: false
    t.string "office", limit: 10, null: false
  end

  create_table "teachers_titles", primary_key: ["id_teacher", "title"], force: :cascade do |t|
    t.integer "id_teacher", null: false
    t.string "title", limit: 15, null: false
  end

  create_table "topics", primary_key: "id_learnable", id: :integer, default: nil, force: :cascade do |t|
    t.integer "id_course", null: false
  end

  create_table "users", primary_key: "id_user", id: :serial, force: :cascade do |t|
    t.integer "id_avatar", default: 0, null: false
    t.string "name", limit: 70, null: false
    t.string "password", limit: 20, null: false
    t.string "phone", limit: 10
    t.string "cpf", limit: 11, null: false
    t.string "email", limit: 254, null: false
    t.index ["email"], name: "users_email_key", unique: true
  end

  add_foreign_key "avatar_requirements", "avatars", column: "id_avatar", primary_key: "id_avatar", name: "avatar_requirements_id_avatar_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "avatar_requirements", "learnables", column: "id_learnable", primary_key: "id_learnable", name: "avatar_requirements_id_learnable_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "coordinators", "registrants", column: "id_registrant", primary_key: "id_user", name: "coordinators_id_registrant_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "courses", "learnables", column: "id_learnable", primary_key: "id_learnable", name: "courses_id_learnable_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "courses_teachers", "courses", column: "id_course", primary_key: "id_learnable", name: "courses_teachers_id_course_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "courses_teachers", "teachers", column: "id_teacher", primary_key: "id_registrant", name: "courses_teachers_id_teacher_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "learnables", "coordinators", column: "id_coordinator", primary_key: "id_registrant", name: "learnables_id_coordinator_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "levels_points", "learnables", column: "id_learnable", primary_key: "id_learnable", name: "levels_points_id_learnable_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "materials", "subtopics", column: "id_subtopic", primary_key: "id_learnable", name: "materials_id_subtopic_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "materials", "teachers", column: "id_teacher", primary_key: "id_registrant", name: "materials_id_teacher_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "materials_ratings", "materials", column: "id_material", primary_key: "id_material", name: "materials_ratings_id_material_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "materials_ratings", "students", column: "id_student", primary_key: "id_user", name: "materials_ratings_id_student_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "questions", "registrants", column: "id_registrant", primary_key: "id_user", name: "questions_id_registrant_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "questions_study_sessions", "questions", column: "id_question", primary_key: "id_mongo", name: "questions_study_sessions_id_question_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "questions_study_sessions", "study_sessions", column: "id_student", primary_key: "id_student", name: "questions_study_sessions_id_student_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "registrants", "users", column: "id_user", primary_key: "id_user", name: "registrants_id_user_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student_levels", "learnables", column: "id_learnable", primary_key: "id_learnable", name: "student_levels_id_learnable_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student_levels", "students", column: "id_student", primary_key: "id_user", name: "student_levels_id_student_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "students", "users", column: "id_user", primary_key: "id_user", name: "students_id_user_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "study_sessions", "students", column: "id_student", primary_key: "id_user", name: "study_sessions_id_student_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "study_sessions", "subtopics", column: "id_subtopic", primary_key: "id_learnable", name: "study_sessions_id_subtopic_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "subtopics", "learnables", column: "id_learnable", primary_key: "id_learnable", name: "subtopics_id_learnable_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "subtopics", "topics", column: "id_topic", primary_key: "id_learnable", name: "subtopics_id_topic_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "subtopics_questions", "questions", column: "id_question", primary_key: "id_mongo", name: "subtopics_questions_id_question_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "subtopics_questions", "subtopics", column: "id_subtopic", primary_key: "id_learnable", name: "subtopics_questions_id_subtopic_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "teachers", "coordinators", column: "id_coordinator", primary_key: "id_registrant", name: "teachers_id_coordinator_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "teachers", "registrants", column: "id_registrant", primary_key: "id_user", name: "teachers_id_registrant_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "teachers_titles", "teachers", column: "id_teacher", primary_key: "id_registrant", name: "teachers_titles_id_teacher_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "topics", "courses", column: "id_course", primary_key: "id_learnable", name: "topics_id_course_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "topics", "learnables", column: "id_learnable", primary_key: "id_learnable", name: "topics_id_learnable_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "users", "avatars", column: "id_avatar", primary_key: "id_avatar", name: "users_id_avatar_fkey", on_update: :cascade
end
