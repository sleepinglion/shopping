json.extract! contact, :id, :title, :enable, :created_at, :updated_at
json.url admin_contact_url(contact, format: :json)
