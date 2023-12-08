class Project < ApplicationRecord
  belongs_to :student, class_name: 'Users::Student', foreign_key: :user_id
  belongs_to :task

  has_many :submissions, dependent: :delete_all
end