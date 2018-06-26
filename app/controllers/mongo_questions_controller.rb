class MongoQuestionsController < ApplicationController
  before_action :set_mongo_question, only: [:show, :edit, :update, :destroy]

  # GET /mongo_questions
  # GET /mongo_questions.json
  def index
    if is_teacher?
      @questions = Question.where registrant_id: current_registrant_id
      @mongo_questions = MongoQuestion.in(_id: @questions.collect {|q| q.mongo_id})
    else 
      @questions = []
      @mongo_questions = []
    end
  end

  # GET /mongo_questions/1
  # GET /mongo_questions/1.json
  def show
  end

  # GET /mongo_questions/new
  def new
    @mongo_question = MongoQuestion.new
    @mongo_question.build_right_answer
    @mongo_question.wrong_answers.build

    @all_topics = Topic.all
  end

  # GET /mongo_questions/1/edit
  def edit
  end

  # POST /mongo_questions
  # POST /mongo_questions.json
  def create
    @mongo_question = MongoQuestion.new(mongo_question_params)
    @mongo_question.topics = params['mongo_question']['topics']
    respond_to do |format|
      if @mongo_question.save
        format.html { redirect_to @mongo_question, notice: 'Mongo question was successfully created.' }
        format.json { render :show, status: :created, location: @mongo_question }
      else
        format.html { render :new }
        format.json { render json: @mongo_question.errors, status: :unprocessable_entity }
      end
    end

    Question.create mongo_id: @mongo_question._id, registrant_id: current_registrant_id
  end

  # PATCH/PUT /mongo_questions/1
  # PATCH/PUT /mongo_questions/1.json
  def update
    respond_to do |format|
      if @mongo_question.update(mongo_question_params)
        format.html { redirect_to @mongo_question, notice: 'Mongo question was successfully updated.' }
        format.json { render :show, status: :ok, location: @mongo_question }
      else
        format.html { render :edit }
        format.json { render json: @mongo_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mongo_questions/1
  # DELETE /mongo_questions/1.json
  def destroy
    @mongo_question.destroy
    respond_to do |format|
      format.html { redirect_to mongo_questions_url, notice: 'Mongo question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mongo_question
      @mongo_question = MongoQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mongo_question_params
      params.require(:mongo_question).permit(:difficulty, :points, :text, :topics, right_answer_attributes: [:text], wrong_answers_attributes: [:text, :plausibility])
    end
end
