class WeaponProficienciesController < ApplicationController
  before_action :set_weapon_proficiency, only: %i[show update destroy]

  # GET /weapon_proficiencies
  def index
    @weapon_proficiencies = WeaponProficiency.all

    render json: @weapon_proficiencies
  end

  # GET /weapon_proficiencies/1
  def show
    render json: @weapon_proficiency
  end

  # POST /weapon_proficiencies
  def create
    @weapon_proficiency = WeaponProficiency.new(weapon_proficiency_params)

    if @weapon_proficiency.save
      render json: @weapon_proficiency, status: :created, location: @weapon_proficiency
    else
      render json: @weapon_proficiency.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /weapon_proficiencies/1
  def update
    if @weapon_proficiency.update(weapon_proficiency_params)
      render json: @weapon_proficiency
    else
      render json: @weapon_proficiency.errors, status: :unprocessable_entity
    end
  end

  # DELETE /weapon_proficiencies/1
  def destroy
    @weapon_proficiency.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_weapon_proficiency
    @weapon_proficiency = WeaponProficiency.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def weapon_proficiency_params
    params.fetch(:weapon_proficiency, {}).permit(:name, :expansion_id)
  end
end
