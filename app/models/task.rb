class Task < ApplicationRecord
  has_many :submissions
  has_many :projects
  belongs_to :classroom
  belongs_to :assignment

  validates :name, :description, :first_submission_deadline,
            :review_deadline, :second_submission_deadline, presence: true

  validates :review_deadline, comparison: { greater_than: :first_submission_deadline }
  validates :second_submission_deadline, comparison: { greater_than: :review_deadline }

  scope :in_progress, -> { where('second_submission_deadline > ?', DateTime.now) }

  def assign_reviews(reviews_per_project)
    # TODO optimize # of queries?

    shuffled_projects = projects.shuffle
    shuffled_projects += shuffled_projects[0...reviews_per_project]

    shuffled_projects.each.with_index do |project, index|
      reviews_per_project.times do |index_incremented_by|
        break if index + index_incremented_by + 1 >= shuffled_projects.length

        Review.create(project_id: project.id, user_id: shuffled_projects[index + index_incremented_by + 1].student.id)
      end
    end
  end

  def from_assignment_by_teacher?(given_teacher)
    assignment.from_course_by_teacher?(given_teacher)
  end

  def from_classroom_taught_by?(given_teacher)
    classroom.taught_by?(given_teacher)
  end

  def phase
    current_time = DateTime.now

    if current_time < first_submission_deadline
      :first_submission
    elsif current_time < review_deadline
      :review
    elsif current_time < second_submission_deadline
      :second_submission
    else
      :done
    end
  end

  def time_left
    return 'Done' if phase == :done

    self.send("#{phase.to_s}_deadline") - DateTime.now
  end
end
