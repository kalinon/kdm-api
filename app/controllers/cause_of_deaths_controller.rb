class CauseOfDeathsController < ApplicationController
  before_action :set_cause_of_death, only: %i[show update destroy]

  # GET /cause_of_deaths
  def index
    @cause_of_deaths = CauseOfDeath.all

    render json: @cause_of_deaths
  end

  # GET /cause_of_deaths/1
  def show
    render json: @cause_of_death
  end

  # POST /cause_of_deaths
  def create
    @cause_of_death = CauseOfDeath.new(cause_of_death_params)

    if @cause_of_death.save
      render json: @cause_of_death, status: :created, location: @cause_of_death
    else
      render json: @cause_of_death.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cause_of_deaths/1
  def update
    if !cause_of_death_params.empty? && @cause_of_death.update(cause_of_death_params)
      render json: @cause_of_death
    else
      render json: @cause_of_death.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cause_of_deaths/1
  def destroy
    @cause_of_death.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cause_of_death
    @cause_of_death = CauseOfDeath.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cause_of_death_params
    params.fetch(:cause_of_death, {}).permit(:name, :expansion_id)
  end
end
