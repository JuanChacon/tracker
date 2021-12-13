source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.11'
# Use sqlite3 as the database for Active Record
gem 'sqlite3','~> 1.3.13'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


# API authentication
gem 'doorkeeper', '~> 4.4.3'
gem 'doorkeeper-jwt'
gem 'oauth2'
gem 'grape', '~> 1.1.0'
gem 'wine_bouncer', '~> 1.0.4'
# API paginator
gem 'kaminari', '>=0.14.1'
gem 'api-pagination'
#cors midleware
gem 'rack-cors', :require => 'rack/cors'

# ENV VARS
gem 'dotenv'

# json formatter to models

gem 'active_model_serializers', '~> 0.10.0'
gem 'grape-active_model_serializers'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # gem for create fake information
  gem 'faker'

  #gems to show a view where we can test variables, etc
  # gem 'better_errors' 
  # gem 'binding_of_caller'

  #documentation via web to the API
  gem "grape-swagger", "0.30.0"

  # gems to unit test
  gem 'database_cleaner-active_record' # gem to clean db
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_bot_rails', '~> 4.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end



