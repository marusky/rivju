class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @submissions = @project.submissions
  end
end