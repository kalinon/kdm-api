class Expansion < ApplicationRecord
  include SafeName

  has_many :monsters

  attribute :release, :datetime
  attribute :color, :string, default: '#333'
  attribute :bg_color, :string, default: '#fff'
end
