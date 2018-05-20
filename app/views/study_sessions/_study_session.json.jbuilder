json.extract! study_session, :id, :start_date, :student_id, :subtopic_id, :end_date, :num_correct, :num_questions, :created_at, :updated_at
json.url study_session_url(study_session, format: :json)
