require 'swagger_helper'

RSpec.describe 'GearTypes', type: :request do
  include_examples 'swagger requests', ::GearType
end
