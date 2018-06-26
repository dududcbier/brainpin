class WrongAnswersController < ApplicationController
  before_action :set_wrong_answer, only: [:show, :edit, :update, :destroy]

  # GET /wrong_answers
  # GET /wrong_answers.json
  def index
    @wrong_answers = WrongAnswer.all
  end

  # GET /wrong_answers/1
  # GET /wrong_answers/1.json
  def show
  end

  # GET /wrong_answers/new
  def new
    @mongo_question = MongoQuestion.find(params[:mongo_question_id])
    @wrong_answer = @mongo_question.wrong_answers.build
  end

  # GET /wrong_answers/1/edit
  def edit
  end

  # POST /wrong_answers
  # POST /wrong_answers.json
  def create
    @mongo_question = MongoQuestion.find(params[:mongo_question_id])
    @wrong_answer = @mongo_question.wrong_answers.build(params[:wrong_answer])

    respond_to do |format|
      if @wrong_answer.save
        format.html { redirect_to @wrong_answer, notice: 'Wrong answer was successfully created.' }
        format.json { render :show, status: :created, location: @wrong_answer }
      else
        format.html { render :new }
        format.json { render json: @wrong_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wrong_answers/1
  # PATCH/PUT /wrong_answers/1.json
  def update
    respond_to do |format|
      if @wrong_answer.update(wrong_answer_params)
        format.html { redirect_to @wrong_answer, notice: 'Wrong answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @wrong_answer }
      else
        format.html { render :edit }
        format.json { render json: @wrong_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wrong_answers/1
  # DELETE /wrong_answers/1.json
  def destroy
    @wrong_answer.destroy
    respond_to do |format|
      format.html { redirect_to wrong_answers_url, notice: 'Wrong answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wrong_answer
      @wrong_answer = WrongAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wrong_answer_params
      params.require(:wrong_answer).permit(:text, :plausibility)
    end
end
