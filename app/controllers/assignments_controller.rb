class AssignmentsController < ApplicationController
  before_action :set_assignment, only: %i[ show edit update destroy ]
  include Pundit::Authorization

  def show
  end

  def new
    @assignment = authorize Assignment.new
  end

  def edit
  end

  def create
    @assignment = authorize Assignment.new(assignment_params)

    if @assignment.save
      redirect_to course_path(@assignment.course), notice: "Assignment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @assignment.update(assignment_params)
      redirect_to assignment_url(@assignment), notice: "Assignment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @assignment.destroy

    redirect_to assignments_url, notice: "Assignment was successfully destroyed."
  end

  private

  def set_assignment
    @assignment = authorize policy_scope(Assignment).find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:name, :description, :course_id)
  end
end
