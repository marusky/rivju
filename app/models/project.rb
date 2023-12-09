class Project < ApplicationRecord
  belongs_to :student, class_name: 'Users::Student', foreign_key: :user_id
  belongs_to :task

  has_many :submissions, dependent: :delete_all

  def first_submission
    submissions.find_by(version: 'first')
  end
end