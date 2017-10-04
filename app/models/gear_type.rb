class GearType < ApplicationRecord
  include SafeName
  include HasExpansion

  attribute :color, :string, default: '#333'
  attribute :font_color, :string, default: '#fff'
end
