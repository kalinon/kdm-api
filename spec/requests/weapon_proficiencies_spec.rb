require 'rails_helper'

RSpec.describe 'WeaponProficiencies', type: :request do
  describe 'GET /weapon_proficiencies' do
    it 'works! (now write some real specs)' do
      get weapon_proficiencies_path
      expect(response).to have_http_status(200)
    end
  end
end
