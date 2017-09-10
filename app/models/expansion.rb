class Expansion < ApplicationRecord
  after_initialize :init

  has_many :monsters

  attribute :release, :datetime
  attribute :color, :string, default: '#333'
  attribute :bg_color, :string, default: '#fff'

  validates_presence_of :name, :safe_name
  validates_uniqueness_of :name, :safe_name

  def init
    self.safe_name ||= name.parameterize
  end
end
