class EpithetsController < ApplicationController
  before_action :set_epithet, only: %i[show update destroy]

  # GET /epithets
  def index
    @epithets = Epithet.all

    render json: @epithets
  end

  # GET /epithets/1
  def show
    render json: @epithet
  end

  # POST /epithets
  def create
    @epithet = Epithet.new(epithet_params)

    if @epithet.save
      render json: @epithet, status: :created, location: @epithet
    else
      render json: @epithet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /epithets/1
  def update
    if @epithet.update(epithet_params)
      render json: @epithet
    else
      render json: @epithet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /epithets/1
  def destroy
    @epithet.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_epithet
    @epithet = Epithet.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def epithet_params
    params.fetch(:epithet, {}).permit(:name, :expansion_id)
  end
end
