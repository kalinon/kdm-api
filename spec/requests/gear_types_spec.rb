require 'swagger_helper'

RSpec.describe 'GearTypes', type: :request do
  describe 'GET /gear_types' do
    it 'works! (now write some real specs)' do
      get gear_types_path
      expect(response).to have_http_status(200)
    end
  end
end
