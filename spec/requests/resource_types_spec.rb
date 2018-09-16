require 'swagger_helper'

RSpec.describe 'ResourceTypes', type: :request do
  include_examples 'swagger requests', ::ResourceType
end
