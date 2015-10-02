class ApplicationMailer < ActionMailer::Base
  include Sidekiq::Mailer
  sidekiq_options queue: 'default'

  default from: "lucasmachado.jose@gmail.com"
  layout 'mailer'
end
