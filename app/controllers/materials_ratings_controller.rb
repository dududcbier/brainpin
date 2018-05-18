class MaterialsRatingsController < ApplicationController
  before_action :set_materials_rating, only: [:show, :edit, :update, :destroy]

  # GET /materials_ratings
  # GET /materials_ratings.json
  def index
    @materials_ratings = MaterialsRating.all
  end

  # GET /materials_ratings/1
  # GET /materials_ratings/1.json
  def show
  end

  # GET /materials_ratings/new
  def new
    @materials_rating = MaterialsRating.new
  end

  # GET /materials_ratings/1/edit
  def edit
  end

  # POST /materials_ratings
  # POST /materials_ratings.json
  def create
    @materials_rating = MaterialsRating.new(materials_rating_params)

    respond_to do |format|
      if @materials_rating.save
        format.html { redirect_to @materials_rating, notice: 'Materials rating was successfully created.' }
        format.json { render :show, status: :created, location: @materials_rating }
      else
        format.html { render :new }
        format.json { render json: @materials_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materials_ratings/1
  # PATCH/PUT /materials_ratings/1.json
  def update
    respond_to do |format|
      if @materials_rating.update(materials_rating_params)
        format.html { redirect_to @materials_rating, notice: 'Materials rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @materials_rating }
      else
        format.html { render :edit }
        format.json { render json: @materials_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials_ratings/1
  # DELETE /materials_ratings/1.json
  def destroy
    @materials_rating.destroy
    respond_to do |format|
      format.html { redirect_to materials_ratings_url, notice: 'Materials rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materials_rating
      @materials_rating = MaterialsRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materials_rating_params
      params.require(:materials_rating).permit(:id_student, :id_material, :rating)
    end
end
