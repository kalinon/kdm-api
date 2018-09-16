require 'swagger_helper'

RSpec.describe 'Locations', type: :request do
  include_examples 'swagger requests', ::Location
end
