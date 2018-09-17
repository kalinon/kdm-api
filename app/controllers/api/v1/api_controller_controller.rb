class Api::V1::ApiControllerController < ApplicationController
  before_action -> { doorkeeper_authorize! :public }, only: %i[index show]
  before_action only: %i[create destroy] do
    doorkeeper_authorize! :admin, :write
  end
  before_action only: [:update] do
    doorkeeper_authorize! :admin, :update
  end
end
