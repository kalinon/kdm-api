require 'rails_helper'

RSpec.describe ExpansionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/expansions').to route_to('expansions#index')
    end

    it 'routes to #show' do
      expect(get: '/expansions/1').to route_to('expansions#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/expansions').to route_to('expansions#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/expansions/1').to route_to('expansions#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/expansions/1').to route_to('expansions#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/expansions/1').to route_to('expansions#destroy', id: '1')
    end
  end
end
