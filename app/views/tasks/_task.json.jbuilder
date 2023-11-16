json.extract! task, :id, :name, :description, :classroom_id, :assignment_id, :first_submission_deadline, :review_deadline, :second_submission_deadline, :created_at, :updated_at
json.url task_url(task, format: :json)
