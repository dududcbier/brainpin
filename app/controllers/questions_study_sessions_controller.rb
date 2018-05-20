class QuestionsStudySessionsController < ApplicationController
  before_action :set_questions_study_session, only: [:show, :edit, :update, :destroy]

  # GET /questions_study_sessions
  # GET /questions_study_sessions.json
  def index
    @questions_study_sessions = QuestionsStudySession.all
  end

  # GET /questions_study_sessions/1
  # GET /questions_study_sessions/1.json
  def show
  end

  # GET /questions_study_sessions/new
  def new
    @questions_study_session = QuestionsStudySession.new
  end

  # GET /questions_study_sessions/1/edit
  def edit
  end

  # POST /questions_study_sessions
  # POST /questions_study_sessions.json
  def create
    @questions_study_session = QuestionsStudySession.new(questions_study_session_params)

    respond_to do |format|
      if @questions_study_session.save
        format.html { redirect_to @questions_study_session, notice: 'Questions study session was successfully created.' }
        format.json { render :show, status: :created, location: @questions_study_session }
      else
        format.html { render :new }
        format.json { render json: @questions_study_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions_study_sessions/1
  # PATCH/PUT /questions_study_sessions/1.json
  def update
    respond_to do |format|
      if @questions_study_session.update(questions_study_session_params)
        format.html { redirect_to @questions_study_session, notice: 'Questions study session was successfully updated.' }
        format.json { render :show, status: :ok, location: @questions_study_session }
      else
        format.html { render :edit }
        format.json { render json: @questions_study_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions_study_sessions/1
  # DELETE /questions_study_sessions/1.json
  def destroy
    @questions_study_session.destroy
    respond_to do |format|
      format.html { redirect_to questions_study_sessions_url, notice: 'Questions study session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questions_study_session
      @questions_study_session = QuestionsStudySession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questions_study_session_params
      params.require(:questions_study_session).permit(:id_question, :id_study_session, :status)
    end
end
