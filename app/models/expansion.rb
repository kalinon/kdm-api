class Expansion < ApplicationRecord
  has_many :monsters

  attribute :release, :datetime
  attribute :color, :string, default: '#333'
  attribute :bg_color, :string, default: '#fff'

  validates_presence_of :name
  validates_uniqueness_of :name
end
