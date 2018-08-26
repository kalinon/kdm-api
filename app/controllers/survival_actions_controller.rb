class SurvivalActionsController < ApplicationController
  before_action :set_survival_action, only: %i[show update destroy]

  # GET /survival_actions
  def index
    @survival_actions = SurvivalAction.all

    render json: @survival_actions
  end

  # GET /survival_actions/1
  def show
    render json: @survival_action
  end

  # POST /survival_actions
  def create
    @survival_action = SurvivalAction.new(survival_action_params)

    if @survival_action.save
      render json: @survival_action, status: :created, location: @survival_action
    else
      render json: @survival_action.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /survival_actions/1
  def update
    if @survival_action.update(survival_action_params)
      render json: @survival_action
    else
      render json: @survival_action.errors, status: :unprocessable_entity
    end
  end

  # DELETE /survival_actions/1
  def destroy
    @survival_action.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_survival_action
    @survival_action = SurvivalAction.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def survival_action_params
    params.fetch(:survival_action, {}).permit(:name)
  end
end
