module SafeName
  extend ActiveSupport::Concern

  included do
    before_save :safe_name
    before_update :update_safe_name

    validates_presence_of :name, :safe_name
    validates_uniqueness_of :name, :safe_name
  end

  def safe_name
    self[:safe_name] ||= name.parameterize
  end

  def update_safe_name
    self[:safe_name] = name.parameterize
  end
end
