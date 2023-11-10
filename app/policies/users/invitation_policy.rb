class Users::InvitationPolicy < ApplicationPolicy
  def initialize(user, record)
    # raise Pundit::NotAuthorizedError, "must be logged in" unless user

    @user = user
    @record = record
  end

  def new?
    teacher_or_admin?
  end

  def create?
    user.admin? || user.teaches_classroom(record)
  end

  def permitted_attributes
    if user&.admin?
      [:classroom_id, :type]
    else
      [:classroom_id, type: ['Users::Student']]
    end
  end

  private

  def teacher_or_admin?
    user.teacher? || user.admin?
  end

  class Scope < Scope

  end
end
