class CauseOfDeath < ApplicationRecord
  before_save :safe_name

  belongs_to :expansion

  validates_presence_of :name, :safe_name
  validates_uniqueness_of :name, :safe_name

  enum context: %i[unknown showdown settlement_event severe_injury story_event
                   hunt_event endeavor consumption brain_trauma]

  def safe_name
    self[:safe_name] ||= name.parameterize
  end
end
