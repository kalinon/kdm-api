require 'rails_helper'

RSpec.describe GearTypesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'api/v1/gear_types').to route_to('gear_types#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: 'api/v1/gear_types/1').to route_to('gear_types#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: 'api/v1/gear_types').to route_to('gear_types#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: 'api/v1/gear_types/1').to route_to('gear_types#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'api/v1/gear_types/1').to route_to('gear_types#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: 'api/v1/gear_types/1').to route_to('gear_types#destroy', id: '1', format: :json)
    end
  end
end
