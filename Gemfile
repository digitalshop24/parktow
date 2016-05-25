source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18.4'
gem 'activerecord-postgis-adapter', '~> 3.1', '>= 3.1.4'
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

gem 'rack-cors', :require => 'rack/cors'
gem 'grape', '~> 0.15.0'
gem 'grape-entity', '~> 0.4.8'
gem 'grape-swagger', '~> 0.10.4'
gem 'grape-swagger-rails', '~> 0.1.0'

gem 'faker', '~> 1.6', '>= 1.6.3'

gem 'figaro', '~> 1.1', '>= 1.1.1'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry', '~> 0.10.3'
end

group :development do
	gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

