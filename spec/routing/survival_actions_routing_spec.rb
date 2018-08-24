require 'rails_helper'

RSpec.describe SurvivalActionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/survival_actions').to route_to('survival_actions#index')
    end

    it 'routes to #show' do
      expect(get: '/survival_actions/1').to route_to('survival_actions#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/survival_actions').to route_to('survival_actions#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/survival_actions/1').to route_to('survival_actions#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/survival_actions/1').to route_to('survival_actions#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/survival_actions/1').to route_to('survival_actions#destroy', id: '1')
    end
  end
end
