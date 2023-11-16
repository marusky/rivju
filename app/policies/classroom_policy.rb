class ClassroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.teacher?
        scope.where(teacher: user)
      elsif user.student?
        scope.where(id: user.classroom_id)
      end
    end
  end

  def show?
    true
  end
end
