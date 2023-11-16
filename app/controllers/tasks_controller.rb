class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  include Pundit::Authorization

  def index
    @tasks = policy_scope(Task)
  end

  def show
  end

  def new
    assignment = authorize policy_scope(Assignment).find(params[:assignment_id])

    @task = Task.new(
      name: assignment.name, description: assignment.description,
      classroom_id: params[:classroom_id], assignment_id: params[:assignment_id]
    )
  end

  def course_choice
    @courses = authorize policy_scope(Course), policy_class: TaskPolicy
  end

  def assignment_choice
    @assignments = authorize policy_scope(Assignment).where(course_id: params[:course_id]), policy_class: TaskPolicy
  end

  def edit
  end

  def create
    @task = authorize Task.new(task_params)

    if @task.save
      redirect_to @task.classroom, notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_url(@task), notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy

    redirect_to tasks_url, notice: "Task was successfully destroyed."
  end

  private

  def set_task
    @task = authorize policy_scope(Task).find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :classroom_id, :assignment_id, :first_submission_deadline, :review_deadline, :second_submission_deadline)
  end
end
