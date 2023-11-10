class ClassroomsController < ApplicationController
  before_action :set_classroom, only: %i[ show edit update destroy ]
  include Pundit::Authorization

  def index
    @classrooms = policy_scope(Classroom)
  end

  def show
  end

  def new
    @classroom = authorize Classroom.new
  end

  def edit
  end

  def create
    @classroom = authorize Classroom.new(classroom_params.merge(teacher: current_user))

    if @classroom.save
      redirect_to classroom_url(@classroom), notice: "Classroom was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @classroom.update(classroom_params)
      redirect_to classroom_url(@classroom), notice: "Classroom was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @classroom.destroy

    redirect_to classrooms_url, notice: "Classroom was successfully destroyed."
  end

  private

  def set_classroom
    @classroom = authorize Classroom.find(params[:id])
  end

  def classroom_params
    params.require(:classroom).permit(:name, :school_year)
  end
end
