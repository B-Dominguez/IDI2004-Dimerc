json.extract! comment, :id, :content, :highlited, :rep, :user_id, :question_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
