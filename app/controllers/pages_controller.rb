class PagesController < ApplicationController
  def home
    # authorize :page, :home?
  end

  def dashboard
    # TODO create presenter

    @tasks = current_user.classroom.tasks
    @projects = current_user.projects
    @reviews = current_user.reviews
  end
end
