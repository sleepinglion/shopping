json.extract! faq_category, :id, :title, :enable, :created_at, :updated_at
json.url admin_faq_category_url(faq_category, format: :json)
