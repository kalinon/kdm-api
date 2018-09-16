require 'swagger_helper'

RSpec.describe 'SurvivalActions', type: :request do
  include_examples 'swagger requests', ::SurvivalAction
end
