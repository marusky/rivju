class Course < ApplicationRecord
  belongs_to :teacher, class_name: 'Users::Teacher', foreign_key: :user_id
  has_many :assignments

  validates :name, :user_id, presence: true

  def taught_by?(given_teacher)
    teacher == given_teacher
  end
end
