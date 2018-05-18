class LevelsPointsController < ApplicationController
  before_action :set_levels_point, only: [:show, :edit, :update, :destroy]

  # GET /levels_points
  # GET /levels_points.json
  def index
    @levels_points = LevelsPoint.all
  end

  # GET /levels_points/1
  # GET /levels_points/1.json
  def show
  end

  # GET /levels_points/new
  def new
    @levels_point = LevelsPoint.new
  end

  # GET /levels_points/1/edit
  def edit
  end

  # POST /levels_points
  # POST /levels_points.json
  def create
    @levels_point = LevelsPoint.new(levels_point_params)

    respond_to do |format|
      if @levels_point.save
        format.html { redirect_to @levels_point, notice: 'Levels point was successfully created.' }
        format.json { render :show, status: :created, location: @levels_point }
      else
        format.html { render :new }
        format.json { render json: @levels_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /levels_points/1
  # PATCH/PUT /levels_points/1.json
  def update
    respond_to do |format|
      if @levels_point.update(levels_point_params)
        format.html { redirect_to @levels_point, notice: 'Levels point was successfully updated.' }
        format.json { render :show, status: :ok, location: @levels_point }
      else
        format.html { render :edit }
        format.json { render json: @levels_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /levels_points/1
  # DELETE /levels_points/1.json
  def destroy
    @levels_point.destroy
    respond_to do |format|
      format.html { redirect_to levels_points_url, notice: 'Levels point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_levels_point
      @levels_point = LevelsPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def levels_point_params
      params.require(:levels_point).permit(:level, :id_learnable, :points)
    end
end
