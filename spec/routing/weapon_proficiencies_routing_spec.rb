require 'rails_helper'

RSpec.describe WeaponProficienciesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/weapon_proficiencies').to route_to('weapon_proficiencies#index')
    end

    it 'routes to #show' do
      expect(get: '/weapon_proficiencies/1').to route_to('weapon_proficiencies#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/weapon_proficiencies').to route_to('weapon_proficiencies#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/weapon_proficiencies/1').to route_to('weapon_proficiencies#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/weapon_proficiencies/1').to route_to('weapon_proficiencies#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/weapon_proficiencies/1').to route_to('weapon_proficiencies#destroy', id: '1')
    end
  end
end
