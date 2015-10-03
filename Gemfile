source 'https://rubygems.org'

gem 'rails', '4.2.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'haml'
gem 'haml-rails'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'simple_form'
gem "figaro"
gem "sidekiq"
gem 'sidekiq_mailer'

group :production do
  gem "rails_12factor" #for heroku
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'byebug'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'web-console', '~> 2.0'
  gem 'quiet_assets'
  gem "codeclimate-test-reporter", require: nil

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

ruby "2.1.2"
