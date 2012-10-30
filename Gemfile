source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'jquery-rails'
gem 'bcrypt-ruby'
gem 'ransack'
gem 'sqlite3'
gem 'whenever', :require => false
gem 'kaminari'

#authentication
gem 'omniauth'
gem 'omniauth-github'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'twitter-bootstrap-rails'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-ui-rails'
end

group :development, :test do
  gem 'quiet_assets'
  gem 'thin'
  gem 'pry'
  gem 'factory_girl_rails'
end

group :test do
  gem "spork"
  gem 'spork-rails'
  gem "rspec-rails"
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'rack_session_access'
  gem "guard-spork"
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'guard-rails'
  gem "guard-bundler"
  gem 'rb-fsevent', '~> 0.9.1'
end
