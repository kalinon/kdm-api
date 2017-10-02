module HasExpansion
  extend ActiveSupport::Concern

  included do
    belongs_to :expansion
  end
end
