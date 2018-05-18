class CoursesTeachersController < ApplicationController
  before_action :set_courses_teacher, only: [:show, :edit, :update, :destroy]

  # GET /courses_teachers
  # GET /courses_teachers.json
  def index
    @courses_teachers = CoursesTeacher.all
  end

  # GET /courses_teachers/1
  # GET /courses_teachers/1.json
  def show
  end

  # GET /courses_teachers/new
  def new
    @courses_teacher = CoursesTeacher.new
  end

  # GET /courses_teachers/1/edit
  def edit
  end

  # POST /courses_teachers
  # POST /courses_teachers.json
  def create
    @courses_teacher = CoursesTeacher.new(courses_teacher_params)

    respond_to do |format|
      if @courses_teacher.save
        format.html { redirect_to @courses_teacher, notice: 'Courses teacher was successfully created.' }
        format.json { render :show, status: :created, location: @courses_teacher }
      else
        format.html { render :new }
        format.json { render json: @courses_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses_teachers/1
  # PATCH/PUT /courses_teachers/1.json
  def update
    respond_to do |format|
      if @courses_teacher.update(courses_teacher_params)
        format.html { redirect_to @courses_teacher, notice: 'Courses teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @courses_teacher }
      else
        format.html { render :edit }
        format.json { render json: @courses_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses_teachers/1
  # DELETE /courses_teachers/1.json
  def destroy
    @courses_teacher.destroy
    respond_to do |format|
      format.html { redirect_to courses_teachers_url, notice: 'Courses teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courses_teacher
      @courses_teacher = CoursesTeacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def courses_teacher_params
      params.require(:courses_teacher).permit(:id_course, :id_teacher, :start_date, :end_date)
    end
end
