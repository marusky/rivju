class Review < ApplicationRecord
  belongs_to :project
  belongs_to :reviewer, class_name: 'Users::Student', foreign_key: :user_id

  has_many :comments
end
