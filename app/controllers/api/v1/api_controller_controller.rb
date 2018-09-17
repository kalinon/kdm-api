class Api::V1::ApiControllerController < ApplicationController
  before_action -> { doorkeeper_authorize! :read }, only: %i[index show]
  before_action only: %i[create destroy update] do
    doorkeeper_authorize! :admin, :write
  end
end
