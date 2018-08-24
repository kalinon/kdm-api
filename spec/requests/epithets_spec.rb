require 'swagger_helper'

RSpec.describe 'Epithets', type: :request do
  describe 'GET /epithets' do
    it 'works! (now write some real specs)' do
      get epithets_path
      expect(response).to have_http_status(200)
    end
  end
end
