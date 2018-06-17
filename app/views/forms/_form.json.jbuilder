json.extract! form, :id, :name, :description, :is_published, :created_at, :updated_at
json.url form_url(form, format: :json)
