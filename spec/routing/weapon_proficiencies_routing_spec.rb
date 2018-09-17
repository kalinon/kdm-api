require 'rails_helper'

RSpec.describe WeaponProficienciesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'api/v1/weapon_proficiencies').to route_to('weapon_proficiencies#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: 'api/v1/weapon_proficiencies/1').to route_to('weapon_proficiencies#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: 'api/v1/weapon_proficiencies').to route_to('weapon_proficiencies#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: 'api/v1/weapon_proficiencies/1').to route_to('weapon_proficiencies#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'api/v1/weapon_proficiencies/1').to route_to('weapon_proficiencies#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: 'api/v1/weapon_proficiencies/1').to route_to('weapon_proficiencies#destroy', id: '1', format: :json)
    end
  end
end
