class SubtopicsController < ApplicationController
  before_action :set_subtopic, only: [:show, :edit, :update, :destroy]

  # GET /subtopics
  # GET /subtopics.json
  def index
    @subtopics = Subtopic.all
  end

  # GET /subtopics/1
  # GET /subtopics/1.json
  def show
  end

  # GET /subtopics/new
  def new
    @subtopic = Subtopic.new
  end

  # GET /subtopics/1/edit
  def edit
  end

  # POST /subtopics
  # POST /subtopics.json
  def create
    @subtopic = Subtopic.new(subtopic_params)

    respond_to do |format|
      if @subtopic.save
        format.html { redirect_to @subtopic, notice: 'Subtopic was successfully created.' }
        format.json { render :show, status: :created, location: @subtopic }
      else
        format.html { render :new }
        format.json { render json: @subtopic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subtopics/1
  # PATCH/PUT /subtopics/1.json
  def update
    respond_to do |format|
      if @subtopic.update(subtopic_params)
        format.html { redirect_to @subtopic, notice: 'Subtopic was successfully updated.' }
        format.json { render :show, status: :ok, location: @subtopic }
      else
        format.html { render :edit }
        format.json { render json: @subtopic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subtopics/1
  # DELETE /subtopics/1.json
  def destroy
    @subtopic.destroy
    respond_to do |format|
      format.html { redirect_to subtopics_url, notice: 'Subtopic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subtopic
      @subtopic = Subtopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subtopic_params
      params.require(:subtopic).permit(:topic_id)
    end
end
