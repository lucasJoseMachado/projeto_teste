class ApplicationMailer < ActionMailer::Base
  include Sidekiq::Mailer
  sidekiq_options queue: "default"

  default from: ENV["sender_email"], cc: ENV["sender_email"]
  layout "mailer"
end
