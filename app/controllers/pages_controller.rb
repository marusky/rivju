class PagesController < ApplicationController
  def home
    # authorize :page, :home?
  end

  def dashboard
    @projects = current_user.projects
    @tasks = current_user.classroom.tasks
  end
end
