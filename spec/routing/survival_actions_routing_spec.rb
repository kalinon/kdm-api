require 'rails_helper'

RSpec.describe SurvivalActionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'api/v1/survival_actions').to route_to('survival_actions#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: 'api/v1/survival_actions/1').to route_to('survival_actions#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: 'api/v1/survival_actions').to route_to('survival_actions#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: 'api/v1/survival_actions/1').to route_to('survival_actions#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'api/v1/survival_actions/1').to route_to('survival_actions#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: 'api/v1/survival_actions/1').to route_to('survival_actions#destroy', id: '1', format: :json)
    end
  end
end
