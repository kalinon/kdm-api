require 'swagger_helper'

RSpec.describe 'CauseOfDeaths', type: :request do
  describe 'GET /cause_of_deaths' do
    it 'works! (now write some real specs)' do
      get cause_of_deaths_path
      expect(response).to have_http_status(200)
    end
  end
end
