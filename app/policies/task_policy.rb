class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      super do
        scope.where(classroom_id: user.classroom_ids)
      end
    end
  end

  def course_choice?
    admin_or_teacher?
  end

  def assignment_choice?
    admin_or_teacher?
  end

  private

  def admin_or_allowed?
    user.admin? || record.from_assignment_by_teacher?(user) && record.from_classroom_taught_by?(user)
  end
end
