source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby "3.1.2"
gem 'friendly_id', '~> 5.4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'font-awesome-rails'
gem 'gravtastic'
gem 'jbuilder'
gem 'importmap-rails'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'valid_email'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'where_exists'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'rubocop'
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'pg'
end
