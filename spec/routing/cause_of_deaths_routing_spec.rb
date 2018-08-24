require 'rails_helper'

RSpec.describe CauseOfDeathsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/cause_of_deaths').to route_to('cause_of_deaths#index')
    end

    it 'routes to #show' do
      expect(get: '/cause_of_deaths/1').to route_to('cause_of_deaths#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/cause_of_deaths').to route_to('cause_of_deaths#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/cause_of_deaths/1').to route_to('cause_of_deaths#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/cause_of_deaths/1').to route_to('cause_of_deaths#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/cause_of_deaths/1').to route_to('cause_of_deaths#destroy', id: '1')
    end
  end
end
