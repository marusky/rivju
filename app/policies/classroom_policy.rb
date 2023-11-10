class ClassroomPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(teacher: user)
      end
    end
  end

  def show?
    taught_by_or_admin?
  end

  def new?
    user.teacher? || user.admin?
  end

  def create?
    taught_by_or_admin?
  end

  def update?
    taught_by_or_admin?
  end

  def destroy?
    taught_by_or_admin?
  end

  private

  def taught_by_or_admin?
    user.teacher? && record.taught_by?(user) || user.admin?
  end
end
