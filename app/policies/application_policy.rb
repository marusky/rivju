# frozen_string_literal: true

class ApplicationPolicy
  class Scope
    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, "must be logged in" unless user

      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        yield
      end
    end

    private

    attr_reader :user, :scope
  end

  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user

    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    admin_or_teacher?
  end

  def create?
    admin_or_allowed?
  end

  def new?
    admin_or_teacher?
  end

  def update?
    admin_or_allowed?
  end

  def edit?
    admin_or_teacher?
  end

  def destroy?
    admin_or_teacher?
  end

  private

  def admin_or_allowed?
    user.admin? || user.teacher? && record.taught_by?(user)
  end

  def admin_or_teacher?
    user.admin? || user.teacher?
  end
end
