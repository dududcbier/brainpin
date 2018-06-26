class RightAnswersController < ApplicationController
  before_action :set_right_answer, only: [:show, :edit, :update, :destroy]

  # GET /right_answers
  # GET /right_answers.json
  def index
    @right_answers = RightAnswer.all
  end

  # GET /right_answers/1
  # GET /right_answers/1.json
  def show
  end

  # GET /right_answers/new
  def new
    @right_answer = RightAnswer.new
    @right_answer.solutions.build
  end

  # GET /right_answers/1/edit
  def edit
  end

  # POST /right_answers
  # POST /right_answers.json
  def create
    @right_answer = RightAnswer.new(right_answer_params)

    respond_to do |format|
      if @right_answer.save
        format.html { redirect_to @right_answer, notice: 'Right answer was successfully created.' }
        format.json { render :show, status: :created, location: @right_answer }
      else
        format.html { render :new }
        format.json { render json: @right_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /right_answers/1
  # PATCH/PUT /right_answers/1.json
  def update
    respond_to do |format|
      if @right_answer.update(right_answer_params)
        format.html { redirect_to @right_answer, notice: 'Right answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @right_answer }
      else
        format.html { render :edit }
        format.json { render json: @right_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /right_answers/1
  # DELETE /right_answers/1.json
  def destroy
    @right_answer.destroy
    respond_to do |format|
      format.html { redirect_to right_answers_url, notice: 'Right answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_right_answer
      @right_answer = RightAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def right_answer_params
      params.require(:right_answer).permit(:text, solutions_attributes: [:text])
    end
end
