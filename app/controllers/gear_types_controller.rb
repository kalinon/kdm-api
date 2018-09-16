class GearTypesController < ApplicationController
  before_action :set_gear_type, only: %i[show update destroy]

  # GET /gear_types
  def index
    @gear_types = GearType.all

    render json: @gear_types
  end

  # GET /gear_types/1
  def show
    render json: @gear_type
  end

  # POST /gear_types
  def create
    @gear_type = GearType.new(gear_type_params)

    if @gear_type.save
      render json: @gear_type, status: :created, location: @gear_type
    else
      render json: @gear_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gear_types/1
  def update
    if !gear_type_params.empty? && @gear_type.update(gear_type_params)
      render json: @gear_type
    else
      render json: @gear_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gear_types/1
  def destroy
    @gear_type.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gear_type
    @gear_type = GearType.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def gear_type_params
    params.fetch(:gear_type, {}).permit(:name, :expansion_id)
  end
end
