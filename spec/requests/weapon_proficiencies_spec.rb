require 'swagger_helper'

WP_SCHEMA = {
  type: :object,
  properties: {
    name: { type: :string }, expansion_id: { type: :integer }
  }
}

RSpec.describe 'WeaponProficiencies', type: :request do
  path '/weapon_proficiencies' do
    get summary: 'fetch list' do
      produces 'application/json'
      response 200, description: 'success'
    end

    post summary: 'create item' do
      produces 'application/json'
      consumes 'application/json'

      parameter 'body', in: :body, schema: {
        type: :object,
        properties: {
          weapon_proficiency: WP_SCHEMA
        }
      }

      let(:body) { { weapon_proficiency: { name: 'Long Sword', expansion_id: 1 } } }

      response(201, description: 'successfully created') do
        it 'uses the body we passed in' do
          wep = JSON.parse(response.body)
          expect(wep['name']).to eq('Long Sword')
          expect(wep['safe_name']).to eq('long-sword')
          expect(wep['expansion_id']).to eq(1)
        end
        capture_example
        schema(WP_SCHEMA)
      end
    end
  end

  # Path Object
  path '/weapon_proficiencies/{id}' do
    parameter 'id', in: :path, type: :integer
    let(:id) { 1 }

    get summary: 'fetch item' do
      produces 'application/json'
      response 200, description: 'success', schema: WP_SCHEMA
    end
  end
end
