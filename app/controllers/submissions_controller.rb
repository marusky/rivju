class SubmissionsController < ApplicationController
  before_action :set_submission, only: %i[ show edit update destroy ]

  # GET /submissions or /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1 or /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    if params[:task_id]
      @project = Project.find_or_create_by(student: current_user, task_id: params[:task_id])
    else
      @project = Project.find(params[:project_id])
    end

    @submission = Submission.new(project_id: @project.id, version: params[:version])
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions or /submissions.json
  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      redirect_to @submission.project, notice: "Submission was successfully updated."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /submissions/1 or /submissions/1.json
  def update
    if @submission.update(submission_params)
      redirect_to @submission.project, notice: "Submission was successfully created."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /submissions/1 or /submissions/1.json
  def destroy
    @submission.destroy

    redirect_to @submission.project, notice: "Submission was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def submission_params
      params.require(:submission).permit(:project_id, :file, :version)
    end
end
