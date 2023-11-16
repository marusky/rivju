class Submission < ApplicationRecord
  belongs_to :student, class_name: 'Users::Student', foreign_key: :user_id
  belongs_to :task
  has_one_attached :file

  enum version: {
    first: 1,
    second: 2
  }, _prefix: true
end
