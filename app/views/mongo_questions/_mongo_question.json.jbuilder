json.extract! mongo_question, :id, :difficulty, :points, :rating, :text, :created_at, :updated_at
json.url mongo_question_url(mongo_question, format: :json)
