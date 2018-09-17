require 'rails_helper'

RSpec.describe CauseOfDeathsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'api/v1/cause_of_deaths').to route_to('cause_of_deaths#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: 'api/v1/cause_of_deaths/1').to route_to('cause_of_deaths#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: 'api/v1/cause_of_deaths').to route_to('cause_of_deaths#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: 'api/v1/cause_of_deaths/1').to route_to('cause_of_deaths#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'api/v1/cause_of_deaths/1').to route_to('cause_of_deaths#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: 'api/v1/cause_of_deaths/1').to route_to('cause_of_deaths#destroy', id: '1', format: :json)
    end
  end
end
