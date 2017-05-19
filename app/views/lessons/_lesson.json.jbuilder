json.extract! lesson, :id, :byline, :lesson_type, :terms, :user_id, :title, :body, :links, :questions, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
