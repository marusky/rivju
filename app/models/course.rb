class Course < ApplicationRecord
  belongs_to :teacher, class_name: 'Users::Teacher', foreign_key: :user_id
  has_many :assignments

  validates :name, :description, :user_id, presence: true
end
