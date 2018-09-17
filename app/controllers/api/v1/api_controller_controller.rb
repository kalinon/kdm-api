class Api::V1::ApiControllerController < ApplicationController
  before_action -> { doorkeeper_authorize! :public }, only: [:index, :show]
  before_action only: [:create, :destroy] do
    doorkeeper_authorize! :admin, :write
  end
  before_action only: [:update] do
    doorkeeper_authorize! :admin, :update
  end
end
