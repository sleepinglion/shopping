json.extract! user, :id, :name, :enable, :created_at, :updated_at
json.url user_url(user, format: :json)
