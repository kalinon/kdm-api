class CauseOfDeath < ApplicationRecord
  include SafeName
  include HasExpansion

  enum context: %i[unknown showdown settlement_event severe_injury story_event
                   hunt_event endeavor brain_trauma consume hunt_xp settlement]
end
