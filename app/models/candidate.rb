class Candidate
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  TECHNOLOGY_OPTIONS = %w(html css javascript python django dev_ios dev_android)
  SAFE_ATTRIBUTES = %w(name email) + TECHNOLOGY_OPTIONS

  attr_accessor :name, :email
  validates_presence_of :name, :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  TECHNOLOGY_OPTIONS.each do |technology|
    attr_accessor technology.to_sym
    validates_numericality_of technology.to_sym, greater_than_or_equal_to: 0, less_than_or_equal_to: 10, only_integer: true, allow_nil: true
  end

  def self.technology_options
    TECHNOLOGY_OPTIONS
  end

  def initialize attributes = {}
    safe_attributes = sanitize_attributes(attributes)
    safe_attributes.each do |key, value|
      send("#{key}=", value)
    end
  end

  def send_feedback
    send_email("front_end") if front_end_developer?
    send_email("back_end")  if back_end_developer?
    send_email("mobile")    if mobile_developer?
    send_email("generic")   if generic_developer?
  end

  # just to act as a model (facilitates the use of validations)
  def persisted?
    false
  end

  private
    def front_end_developer?
      html >= 7 && css >= 7 && javascript >= 7
    end

    def back_end_developer?
      python >= 7 && django >= 7
    end

    def mobile_developer?
      dev_ios >= 7 || dev_android >= 7
    end

    def generic_developer?
      not (front_end_developer? || back_end_developer? || mobile_developer?)
    end

    def sanitize_attributes attributes = {}
      attributes.slice(*SAFE_ATTRIBUTES)
    end
end
