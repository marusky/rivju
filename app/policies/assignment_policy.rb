class AssignmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      super do
        scope.where(course_id: user.course_ids)
      end
    end
  end

  private

  def admin_or_allowed?
    user.admin? || user.teacher? && record.from_course_by_teacher?(user)
  end
end
