class ResourceType < ApplicationRecord
  include SafeName
  include HasExpansion

  attribute :color, :string, default: '#333'
end
