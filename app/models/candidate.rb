class Candidate
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  TECHNOLOGY_OPTIONS = %w(html css javascript python django dev_ios dev_android)
  SAFE_ATTRIBUTES = %w(name email) + TECHNOLOGY_OPTIONS

  attr_accessor *SAFE_ATTRIBUTES
  validates_presence_of :name, :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_numericality_of *TECHNOLOGY_OPTIONS, greater_than_or_equal_to: 0, less_than_or_equal_to: 10, only_integer: true, allow_nil: true

  def self.technology_options
    TECHNOLOGY_OPTIONS
  end

  def initialize attributes={}
    safe_attributes = sanitize_attributes(attributes || {})
    safe_attributes.each do |key, value|
      send("#{key}=", value)
    end
  end

  # just to act as a model (facilitates the use of validations)
  def persisted?
    false
  end

  private
    def sanitize_attributes attributes={}
      attributes.slice(*SAFE_ATTRIBUTES)
    end
end
