class Users::InvitationsController < Devise::InvitationsController
  include Pundit::Authorization

  def new
    authorize [:users, :invitation]

    super
  end

  def create
    classroom_invited_to = Classroom.find(params[:user][:classroom_id])

    authorize classroom_invited_to, policy_class: Users::InvitationPolicy

    super
  end

  private

  def after_invite_path_for(inviter, invitee = nil)
    classroom_path(invitee.classroom)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: policy([:users, :invitation]).permitted_attributes)
  end
end