class ResourceTypesController < ApplicationController
  before_action :set_resource_type, only: %i[show update destroy]

  # GET /resource_types
  def index
    @resource_types = ResourceType.all

    render json: @resource_types
  end

  # GET /resource_types/1
  def show
    render json: @resource_type
  end

  # POST /resource_types
  def create
    @resource_type = ResourceType.new(resource_type_params)

    if @resource_type.save
      render json: @resource_type, status: :created, location: @resource_type
    else
      render json: @resource_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resource_types/1
  def update
    if !resource_type_params.empty? && @resource_type.update(resource_type_params)
      render json: @resource_type
    else
      render json: @resource_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /resource_types/1
  def destroy
    @resource_type.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_resource_type
    @resource_type = ResourceType.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def resource_type_params
    params.fetch(:resource_type, {}).permit(:name, :expansion_id)
  end
end
