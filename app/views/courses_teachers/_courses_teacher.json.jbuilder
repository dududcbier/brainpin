json.extract! courses_teacher, :id, :id_course, :id_teacher, :start_date, :end_date, :created_at, :updated_at
json.url courses_teacher_url(courses_teacher, format: :json)
