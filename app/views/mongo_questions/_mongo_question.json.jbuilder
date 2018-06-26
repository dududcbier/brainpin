json.extract! mongo_question, :id, :topics, :difficulty, :points, :text, :created_at, :updated_at
json.url mongo_question_url(mongo_question, format: :json)
