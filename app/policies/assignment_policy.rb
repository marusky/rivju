class AssignmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(course_id: user.course_ids)
      end
    end
  end

  def show?
    admin_or_allowed?
  end

  def new?
    admin_or_teacher?
  end

  def create?
    admin_or_allowed?
  end

  def update?
    admin_or_allowed?
  end

  def destroy?
    admin_or_allowed?
  end

  private

  def admin_or_allowed?
    user.admin? || user.teacher? && record.from_course_by_teacher?(user)
  end
end
