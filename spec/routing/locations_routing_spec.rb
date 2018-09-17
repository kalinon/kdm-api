require 'rails_helper'

RSpec.describe LocationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'api/v1/locations').to route_to('locations#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: 'api/v1/locations/1').to route_to('locations#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: 'api/v1/locations').to route_to('locations#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: 'api/v1/locations/1').to route_to('locations#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'api/v1/locations/1').to route_to('locations#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: 'api/v1/locations/1').to route_to('locations#destroy', id: '1', format: :json)
    end
  end
end
