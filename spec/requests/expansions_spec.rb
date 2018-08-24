require 'swagger_helper'

RSpec.describe 'Expansions', type: :request do
  describe 'GET /expansions' do
    it 'works! (now write some real specs)' do
      get expansions_path
      expect(response).to have_http_status(200)
    end
  end
end
