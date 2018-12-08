json.extract! question, :id, :title, :description, :cathegory, :rep, :solved, :user_id, :created_at, :updated_at
json.url question_url(question, format: :json)
