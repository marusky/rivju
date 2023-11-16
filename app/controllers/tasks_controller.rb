class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  include Pundit::Authorization
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  # GET /tasks or /tasks.json
  def index
    @tasks = policy_scope(Task)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
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

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = authorize Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task.classroom, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = authorize Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :description, :classroom_id, :assignment_id, :first_submission_deadline, :review_deadline, :second_submission_deadline)
    end
end
