require 'swagger_helper'

RSpec.describe 'Monsters', type: :request do
  include_examples 'swagger requests', ::Monster
end
