class Assignment < ApplicationRecord
  belongs_to :course
  has_many :tasks

  validates :name, :description, presence: true

  def from_course_by_teacher?(given_teacher)
    return unless course.present?

    course.teacher == given_teacher
  end
end
