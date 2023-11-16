class Task < ApplicationRecord
  has_many :submissions
  belongs_to :classroom
  belongs_to :assignment

  validates :name, :description, :first_submission_deadline,
            :review_deadline, :second_submission_deadline, presence: true

  validates :review_deadline, comparison: { greater_than: :first_submission_deadline }
  validates :second_submission_deadline, comparison: { greater_than: :review_deadline }

  def from_assignment_by_teacher?(given_teacher)
    assignment.from_course_by_teacher?(given_teacher)
  end

  def from_classroom_taught_by?(given_teacher)
    classroom.taught_by?(given_teacher)
  end
end
