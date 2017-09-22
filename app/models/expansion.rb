class Expansion < ApplicationRecord
  after_save :safe_name

  has_many :monsters

  attribute :release, :datetime
  attribute :color, :string, default: '#333'
  attribute :bg_color, :string, default: '#fff'

  validates_presence_of :name, :safe_name
  validates_uniqueness_of :name, :safe_name

  def safe_name
    self[:safe_name] ||= name.parameterize
  end
end
