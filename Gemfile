source 'https://rubygems.org'

gem 'rails',          '>= 5.0.0'
gem 'pg'
gem 'uglifier'
gem 'jquery-rails'
gem 'jbuilder'
gem 'bcrypt'

# gem 'ember-cli-rails' <- incompatible with rails 5.x
gem 'active_model_serializers', '~> 0.10.1'
gem 'rack-cors'
gem 'kaminari'
gem 'chunky_png'

group :development do
  gem 'puma'
  gem 'pry-rails'
  gem 'spring'
  gem 'listen'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'faker'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug'
end

group :test do
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
