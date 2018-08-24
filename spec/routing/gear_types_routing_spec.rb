require 'rails_helper'

RSpec.describe GearTypesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/gear_types').to route_to('gear_types#index')
    end

    it 'routes to #show' do
      expect(get: '/gear_types/1').to route_to('gear_types#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/gear_types').to route_to('gear_types#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/gear_types/1').to route_to('gear_types#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/gear_types/1').to route_to('gear_types#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/gear_types/1').to route_to('gear_types#destroy', id: '1')
    end
  end
end
