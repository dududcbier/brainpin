class StudySessionsController < ApplicationController
  before_action :set_study_session, only: [:show, :edit, :update, :destroy]

  # GET /study_sessions
  # GET /study_sessions.json
  def index
    @study_sessions = StudySession.all
  end

  # GET /study_sessions/1
  # GET /study_sessions/1.json
  def show
  end

  # GET /study_sessions/new
  def new
    @study_session = StudySession.new
  end

  # GET /study_sessions/1/edit
  def edit
  end

  # POST /study_sessions
  # POST /study_sessions.json
  def create
    @study_session = StudySession.new(study_session_params)
    @study_session.student_id = current_student_id
    @study_session.start_date = Time.now
    respond_to do |format|
      if @study_session.save
        format.html { redirect_to @study_session, notice: 'Study session was successfully created.' }
        format.json { render :show, status: :created, location: @study_session }
      else
        format.html { render :new }
        format.json { render json: @study_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_sessions/1
  # PATCH/PUT /study_sessions/1.json
  def update
    respond_to do |format|
      if @study_session.update(study_session_params)
        format.html { redirect_to @study_session, notice: 'Study session was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_session }
      else
        format.html { render :edit }
        format.json { render json: @study_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_sessions/1
  # DELETE /study_sessions/1.json
  def destroy
    @study_session.destroy
    respond_to do |format|
      format.html { redirect_to study_sessions_url, notice: 'Study session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_session
      @study_session = StudySession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_session_params
      params.require(:study_session).permit(:start_date, :student_id, :subtopic_id, :end_date, :num_correct, :num_questions)
    end
end
