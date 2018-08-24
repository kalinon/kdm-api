class Epithet < ApplicationRecord
  include SafeName
  include HasExpansion

  enum gender: %i[male female]

  attribute :selectable, :boolean, default: true
  attribute :color, :string, default: '#fff'
  attribute :bg_color, :string, default: '#fff'
  attribute :border_color, :string, default: '#333'
end
