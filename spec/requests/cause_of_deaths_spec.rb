require 'swagger_helper'

RSpec.describe 'CauseOfDeaths', type: :request do
  include_examples 'swagger requests', ::CauseOfDeath
end
