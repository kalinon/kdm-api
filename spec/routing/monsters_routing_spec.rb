require 'rails_helper'

RSpec.describe MonstersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'api/v1/monsters').to route_to('monsters#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: 'api/v1/monsters/1').to route_to('monsters#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: 'api/v1/monsters').to route_to('monsters#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: 'api/v1/monsters/1').to route_to('monsters#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'api/v1/monsters/1').to route_to('monsters#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: 'api/v1/monsters/1').to route_to('monsters#destroy', id: '1', format: :json)
    end
  end
end
