json.extract! comment, :id, :user_id, :review_id, :from_line, :to_line, :content, :created_at, :updated_at
json.url comment_url(comment, format: :json)
