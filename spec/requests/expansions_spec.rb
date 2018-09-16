require 'swagger_helper'

RSpec.describe 'Expansions', type: :request do
  include_examples 'swagger requests', ::Expansion
end
