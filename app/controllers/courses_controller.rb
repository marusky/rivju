class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]
  include Pundit::Authorization

  def index
    @courses = policy_scope(Course)
  end

  def show
  end

  def new
    @course = authorize Course.new
  end

  def edit
  end

  def create
    @course = authorize Course.new(course_params.merge(teacher: current_user))

    if @course.save
      redirect_to course_url(@course), notice: "Course was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @course.update(course_params)
      redirect_to course_url(@course), notice: "Course was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy

    redirect_to courses_url, notice: "Course was successfully destroyed."
  end

  private

  def set_course
    @course = authorize policy_scope(Course).find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :user_id)
  end
end
