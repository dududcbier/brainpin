class TeachersTitlesController < ApplicationController
  before_action :set_teachers_title, only: [:show, :edit, :update, :destroy]

  # GET /teachers_titles
  # GET /teachers_titles.json
  def index
    @teachers_titles = TeachersTitle.all
  end

  # GET /teachers_titles/1
  # GET /teachers_titles/1.json
  def show
  end

  # GET /teachers_titles/new
  def new
    @teachers_title = TeachersTitle.new
  end

  # GET /teachers_titles/1/edit
  def edit
  end

  # POST /teachers_titles
  # POST /teachers_titles.json
  def create
    @teachers_title = TeachersTitle.new(teachers_title_params)

    respond_to do |format|
      if @teachers_title.save
        format.html { redirect_to @teachers_title, notice: 'Teachers title was successfully created.' }
        format.json { render :show, status: :created, location: @teachers_title }
      else
        format.html { render :new }
        format.json { render json: @teachers_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers_titles/1
  # PATCH/PUT /teachers_titles/1.json
  def update
    respond_to do |format|
      if @teachers_title.update(teachers_title_params)
        format.html { redirect_to @teachers_title, notice: 'Teachers title was successfully updated.' }
        format.json { render :show, status: :ok, location: @teachers_title }
      else
        format.html { render :edit }
        format.json { render json: @teachers_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers_titles/1
  # DELETE /teachers_titles/1.json
  def destroy
    @teachers_title.destroy
    respond_to do |format|
      format.html { redirect_to teachers_titles_url, notice: 'Teachers title was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teachers_title
      @teachers_title = TeachersTitle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teachers_title_params
      params.require(:teachers_title).permit(:id_teacher, :title)
    end
end
