class Monster < ApplicationRecord
  after_initialize :init

  belongs_to :expansion

  validates_presence_of :name, :safe_name
  validates_uniqueness_of :name, :safe_name

  def init
    self.safe_name ||= name.parameterize
  end
end
