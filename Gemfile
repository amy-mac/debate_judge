source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '3.2.14'
gem 'sidekiq', '~> 2.15.0'
gem 'sinatra'
gem 'unicorn', '4.7.0'
gem 'pg'
gem 'backbone-on-rails'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails', '2.14.0'
  gem 'factory_girl_rails', '~> 4.2.1'
  gem 'konacha'
  gem 'sqlite3', '1.3.8'
  gem 'letter_opener'
end

group :test do
  gem 'faker', '~> 1.1.2'
  gem 'capybara', '~> 2.1.0'
  gem 'database_cleaner', '~> 1.0.1'
  gem 'launchy', '~> 2.3.0'
  gem 'selenium-webdriver', '~> 2.35.1'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'haml-rails'
  gem 'haml_coffee_assets'
  gem 'execjs'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
