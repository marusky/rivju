class Classroom < ApplicationRecord
  include Hashid::Rails

  has_many :students, class_name: 'Users::Student', dependent: :delete_all
  has_many :tasks
  belongs_to :teacher, class_name: 'Users::Teacher', foreign_key: :user_id

  def taught_by?(given_teacher)
    teacher == given_teacher
  end
end
