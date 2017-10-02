module SafeName
  extend ActiveSupport::Concern

  included do
    before_save :safe_name

    validates_presence_of :name, :safe_name
    validates_uniqueness_of :name, :safe_name
  end

  def safe_name
    self[:safe_name] ||= name.parameterize
  end
end
