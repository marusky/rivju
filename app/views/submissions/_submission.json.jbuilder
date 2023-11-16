json.extract! submission, :id, :user_id, :task_id, :file, :version, :created_at, :updated_at
json.url submission_url(submission, format: :json)
json.file url_for(submission.file)
