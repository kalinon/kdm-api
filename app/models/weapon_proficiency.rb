class WeaponProficiency < ApplicationRecord
  before_save :safe_name

  belongs_to :expansion

  validates_presence_of :name, :safe_name
  validates_uniqueness_of :name, :safe_name

  def safe_name
    self[:safe_name] ||= name.parameterize
  end
end
