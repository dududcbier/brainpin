json.extract! user, :id, :id_avatar, :name, :password, :phone, :cpf, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
