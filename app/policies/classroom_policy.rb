class ClassroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      super do
        scope.where(teacher: user)
      end
    end
  end
end
