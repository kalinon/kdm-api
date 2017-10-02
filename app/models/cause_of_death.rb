class CauseOfDeath < ApplicationRecord
  include SafeName
  include HasExpansion

  enum context: %i[unknown showdown settlement_event severe_injury story_event
                   hunt_event endeavor consumption brain_trauma]
end
