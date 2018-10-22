class CoursesController < ApplicationController
  # before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  def search
  end

  def search_courses
    puts "start searching..."
    @course_list = []
    if !search_params[:course_name].blank? and search_params[:subject_id].blank?
      @course_list = Course.where("course_name LIKE ?","#{search_params[:course_name]}")
    elsif search_params[:course_name].blank? and !search_params[:subject_id].blank?
      @course_list = Course.where(subject_id: search_params[:subject_id])
    elsif !search_params[:course_name].blank? and !search_params[:subject_id].blank?
      list1 = Course.where("course_name LIKE ?", "%#{search_params[:course_name]}%")
      list2 = (Course.where(subject_id: search_params[:subject_id]))
      @course_list = list1 & list2
    end
    puts "course list size: #{@course_list.size}"
    render 'search'
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def search_params
    params
  end
end
