class ApplicationMailer < ActionMailer::Base
  include Sidekiq::Mailer
  sidekiq_options queue: "default"

  default from: ENV["gmail_username"], cc: ENV["gmail_username"]
  layout "mailer"
end
