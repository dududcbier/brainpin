json.extract! material, :id, :teacher_id, :subtopic_id, :description, :url, :file, :rating, :created_at, :updated_at
json.url material_url(material, format: :json)
