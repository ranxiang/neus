source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.3'
# Use mysql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem 'puma', '~> 3.12.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 3.2.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.0.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
group :development do
  gem 'capistrano', '~> 3.10.0'
  gem 'capistrano-rvm'
  gem 'capistrano-rails', '~> 1.3.0'
  gem 'capistrano3-puma'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.1.5'
  # Spring opeeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# add slim-rails gem for view.
gem "slim-rails"

# add bootstrap-sass for view.
gem 'bootstrap-sass', '~> 3.3.7'

group :development, :test do
  gem 'rb-readline'
end

# add devise gem for user management.
gem 'devise'

# add kaminari gem for pagination support
gem 'kaminari'
gem 'kaminari-i18n'

# add js runtime
gem "therubyracer"

# add letter opener gem for mail preview in local development env
gem "letter_opener", :group => :development

# add better errors gem for debug
gem "better_errors", :group => :development

# send email when errors occur
gem 'exception_notification'

# for usefule icons
gem 'font-awesome-sass'

gem 'social-share-button',:git => 'https://github.com/ranxiang/social-share-button.git'

gem "validate_url"
