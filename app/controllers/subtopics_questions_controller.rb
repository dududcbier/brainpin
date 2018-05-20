class SubtopicsQuestionsController < ApplicationController
  before_action :set_subtopics_question, only: [:show, :edit, :update, :destroy]

  # GET /subtopics_questions
  # GET /subtopics_questions.json
  def index
    @subtopics_questions = SubtopicsQuestion.all
  end

  # GET /subtopics_questions/1
  # GET /subtopics_questions/1.json
  def show
  end

  # GET /subtopics_questions/new
  def new
    @subtopics_question = SubtopicsQuestion.new
  end

  # GET /subtopics_questions/1/edit
  def edit
  end

  # POST /subtopics_questions
  # POST /subtopics_questions.json
  def create
    @subtopics_question = SubtopicsQuestion.new(subtopics_question_params)

    respond_to do |format|
      if @subtopics_question.save
        format.html { redirect_to @subtopics_question, notice: 'Subtopics question was successfully created.' }
        format.json { render :show, status: :created, location: @subtopics_question }
      else
        format.html { render :new }
        format.json { render json: @subtopics_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subtopics_questions/1
  # PATCH/PUT /subtopics_questions/1.json
  def update
    respond_to do |format|
      if @subtopics_question.update(subtopics_question_params)
        format.html { redirect_to @subtopics_question, notice: 'Subtopics question was successfully updated.' }
        format.json { render :show, status: :ok, location: @subtopics_question }
      else
        format.html { render :edit }
        format.json { render json: @subtopics_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subtopics_questions/1
  # DELETE /subtopics_questions/1.json
  def destroy
    @subtopics_question.destroy
    respond_to do |format|
      format.html { redirect_to subtopics_questions_url, notice: 'Subtopics question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subtopics_question
      @subtopics_question = SubtopicsQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subtopics_question_params
      params.require(:subtopics_question).permit(:question_id, :subtopic_id)
    end
end
