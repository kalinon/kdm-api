require 'swagger_helper'

RSpec.describe 'Epithets', type: :request do
  include_examples 'swagger requests', ::Epithet
end
