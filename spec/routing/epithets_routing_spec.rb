require 'rails_helper'

RSpec.describe EpithetsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'api/v1/epithets').to route_to('epithets#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: 'api/v1/epithets/1').to route_to('epithets#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: 'api/v1/epithets').to route_to('epithets#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: 'api/v1/epithets/1').to route_to('epithets#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'api/v1/epithets/1').to route_to('epithets#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: 'api/v1/epithets/1').to route_to('epithets#destroy', id: '1', format: :json)
    end
  end
end
