class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(classroom_id: user.classroom_ids)
      end
    end
  end

  def new?
    admin_or_teacher?
  end

  def show?
    admin_or_allowed?
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
