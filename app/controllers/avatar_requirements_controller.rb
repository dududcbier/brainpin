class AvatarRequirementsController < ApplicationController
  before_action :set_avatar_requirement, only: [:show, :edit, :update, :destroy]

  # GET /avatar_requirements
  # GET /avatar_requirements.json
  def index
    @avatar_requirements = AvatarRequirement.all
  end

  # GET /avatar_requirements/1
  # GET /avatar_requirements/1.json
  def show
  end

  # GET /avatar_requirements/new
  def new
    @avatar_requirement = AvatarRequirement.new
  end

  # GET /avatar_requirements/1/edit
  def edit
  end

  # POST /avatar_requirements
  # POST /avatar_requirements.json
  def create
    @avatar_requirement = AvatarRequirement.new(avatar_requirement_params)

    respond_to do |format|
      if @avatar_requirement.save
        format.html { redirect_to @avatar_requirement, notice: 'Avatar requirement was successfully created.' }
        format.json { render :show, status: :created, location: @avatar_requirement }
      else
        format.html { render :new }
        format.json { render json: @avatar_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avatar_requirements/1
  # PATCH/PUT /avatar_requirements/1.json
  def update
    respond_to do |format|
      if @avatar_requirement.update(avatar_requirement_params)
        format.html { redirect_to @avatar_requirement, notice: 'Avatar requirement was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar_requirement }
      else
        format.html { render :edit }
        format.json { render json: @avatar_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avatar_requirements/1
  # DELETE /avatar_requirements/1.json
  def destroy
    @avatar_requirement.destroy
    respond_to do |format|
      format.html { redirect_to avatar_requirements_url, notice: 'Avatar requirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avatar_requirement
      @avatar_requirement = AvatarRequirement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avatar_requirement_params
      params.require(:avatar_requirement).permit(:avatar_id, :learnable_id, :min_level)
    end
end
