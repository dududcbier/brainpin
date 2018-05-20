json.extract! user, :id, :avatar_id, :name, :password, :phone, :cpf, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
