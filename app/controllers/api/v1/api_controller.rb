class Api::V1::ApiController < ApplicationController
  before_action -> { doorkeeper_authorize! :read, :admin }, only: %i[index show]
  before_action only: %i[create destroy update] do
    doorkeeper_authorize! :admin, :write
  end
end
