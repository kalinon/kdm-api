require 'swagger_helper'

RSpec.describe 'WeaponProficiencies', type: :request do
  include_examples 'swagger requests', ::WeaponProficiency
end
