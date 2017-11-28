json.extract! post, :id, :title, :name, :age, :body, :created_at, :updated_at, :class_desired
json.url post_url(post, format: :json)
