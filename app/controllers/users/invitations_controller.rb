class Users::InvitationsController < Devise::InvitationsController
  include Pundit::Authorization
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def new
    authorize [:users, :invitation], :new?

    super
  end

  def create
    authorize [:users, :invitation], :create?

    # kedy mozem vytvorit pozvanku?
    # ak som admin
    # alebo ak som ucitel a pozyvam ziaka do triedy, ktoru ucim
    super do |resource|
      authorize [:users, :invitation], resource
    end
  end
end