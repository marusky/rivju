class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(teacher: user)
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
end