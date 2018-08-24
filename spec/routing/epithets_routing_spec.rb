require 'rails_helper'

RSpec.describe EpithetsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/epithets').to route_to('epithets#index')
    end

    it 'routes to #show' do
      expect(get: '/epithets/1').to route_to('epithets#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/epithets').to route_to('epithets#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/epithets/1').to route_to('epithets#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/epithets/1').to route_to('epithets#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/epithets/1').to route_to('epithets#destroy', id: '1')
    end
  end
end
