class Users::InvitationPolicy < ApplicationPolicy
  def new?
    teacher_or_admin?
  end

  def create?
    teacher_or_admin?
  end

  private

  def teacher_or_admin?
    user.teacher? || user.admin?
  end

  class Scope < Scope
  end
end
